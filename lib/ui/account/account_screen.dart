import 'package:aw_customer/res/colors/AppColor.dart';
import 'package:aw_customer/ui/account/account_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  AccountScreenViewModel viewModel = AccountScreenViewModel();
  final TextEditingController _textNameController = TextEditingController(text: 'Nguyen Cong Phat');

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
                                  child: Image(
                                    image: AssetImage('assets/images/user_avatar.png'),
                                    width: 100.0,
                                    height: 100.0,
                                  )
                              ),

                              SizedBox(
                                height: 20,
                              ),

                              TextFormField(
                                controller: _textNameController,
                                readOnly: true,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
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
                                controller: _textNameController,
                                readOnly: true,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Họ và tên',
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
                                controller: _textNameController,
                                readOnly: true,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0,
                                ),
                                decoration: InputDecoration(
                                  labelText: 'Họ và tên',
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

  }
}
