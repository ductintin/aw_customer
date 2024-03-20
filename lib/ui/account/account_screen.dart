import 'package:aw_customer/res/colors/AppColor.dart';
import 'package:aw_customer/ui/account/account_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../data/model/api/ApiStatus.dart';
import '../../data/remote/network/BaseApiService.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountScreenViewModel viewModel = AccountScreenViewModel();
  final TextEditingController _textNameController = TextEditingController(text: '');
  final TextEditingController _textPhoneController = TextEditingController(text: '');
  final TextEditingController _textPasswordController = TextEditingController(text: '');

  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getProfile();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textNameController.dispose();
    _textPhoneController.dispose();
    _textPasswordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: ChangeNotifierProvider<AccountScreenViewModel>(
                create: (BuildContext context) => viewModel,
                child: Consumer<AccountScreenViewModel>(
                  builder: (context, value, _){
                    switch(value.res.status){
                      case ApiStatus.LOADING:
                        return const Center(
                          child: SpinKitThreeBounce(
                            color: AppColor.mainColor,
                            size: 30.0,
                          ),
                        );
                      case ApiStatus.ERROR:
                        return RefreshIndicator(
                          onRefresh: _refresh,
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height,
                              child: const Center(
                                child: Text('Lỗi kết nối, vui lòng thử lại!'),
                              ),
                            ),
                          ),
                        );
                      case ApiStatus.COMPLETED:
                        return _ui(viewModel);
                      default:
                        return Container();
                    }
                  },
                ),
              ),

            ),
          )

        )
      ),
    );
  }

  Future<void> _refresh() async{
    viewModel.getProfile();
  }

  _ui(AccountScreenViewModel viewModel){
    _textNameController.text = viewModel.res.data?.name ?? '';
    _textPhoneController.text = viewModel.res.data?.phone ?? '';

    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Tài khoản',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 36.0,
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              ClipOval(
                  child: viewModel.res.data?.avatar != null ?
                  Image.network(
                      '${BaseApiService.MEDIA_URL}/v1/file/download${viewModel.res.data?.avatar!}',
                      height:100.0,
                      width: 100.0,
                      fit: BoxFit.cover
                  )
                      :
                  const Image(
                      image: AssetImage('assets/images/user_avatar.png'),
                      width: 100.0,
                      height: 100.0),
              ),

              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: _textNameController,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Họ và tên',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: Colors.grey
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(width: 1, color: AppColor.mainColor),
                  ),


                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: AppColor.mainColor), // Thiết lập màu của border
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: AppColor.mainColor), // Thiết lập màu của border
                  ),

                ),

              ),

              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: _textPhoneController,
                readOnly: true,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Số điện thoại',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: Colors.grey
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(width: 1, color: Colors.blue),
                  ),


                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: AppColor.mainColor), // Thiết lập màu của border
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: AppColor.mainColor), // Thiết lập màu của border
                  ),

                ),

              ),

              SizedBox(
                height: 20,
              ),

              TextFormField(
                controller: _textPasswordController,
                obscureText: !isVisible,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: 'Mật khẩu',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0,
                      color: Colors.grey,
                  ),

                  suffixIcon: IconButton(
                    icon: Icon(!isVisible ? Icons.visibility : Icons.visibility_off), onPressed: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                  },
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(width: 1, color: Colors.blue),
                  ),


                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: AppColor.mainColor), // Thiết lập màu của border
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(width: 2, color: AppColor.mainColor), // Thiết lập màu của border
                  ),

                ),

              ),



            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                  onPrimary: Color(0xFFFFFFFF),
                  primary: Color(0xFF7EA567),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  )
              ),
              child: const Text(
                'Cập nhật',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
