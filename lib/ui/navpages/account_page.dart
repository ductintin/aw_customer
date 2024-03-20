import 'dart:math';

import 'package:aw_customer/data/remote/network/ApiEndPoints.dart';
import 'package:aw_customer/data/remote/network/BaseApiService.dart';
import 'package:aw_customer/ui/account/account_screen.dart';
import 'package:aw_customer/ui/navpages/account_page_view_model.dart';
import 'package:aw_customer/ui/widget/card_profile_shimmer.dart';
import 'package:aw_customer/ui/widget/circle_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:aw_customer/data/local/prefs/AppPreferecesService.dart';
import 'package:aw_customer/res/colors/AppColor.dart';
import 'package:aw_customer/res/colors/AppColors.dart';
import 'package:aw_customer/ui/history/history_screen.dart';
import 'package:aw_customer/ui/login/LoginScreen.dart';
import 'package:provider/provider.dart';

import '../../data/local/prefs/PreferencesService.dart';
import '../../data/model/api/ApiStatus.dart';
import '../widget/shimmer.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final AccountPageViewModel viewModel = AccountPageViewModel();
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getProfile(context);

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(top: 20, left: 16, right: 16),
              child: ChangeNotifierProvider<AccountPageViewModel>(
                  create: (BuildContext context) => viewModel,
                  child: Consumer<AccountPageViewModel>(
                    builder: (context, value, _){
                      return Column(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Cài đặt',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 36.0,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountScreen()));
                            },
                            borderRadius: BorderRadius.circular(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),

                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: value.res.status == ApiStatus.LOADING ?
                                    Shimmer(
                                        linearGradient: AppColor.shimmerGradient,
                                      child: _buildTopRowItem(),
                                      )

                                 : value.res.status == ApiStatus.ERROR ?
                                Image(
                                  image: AssetImage('assets/images/user_avatar.png'),
                                  width: 50.0,
                                  height: 50.0,
                                )
                                 :
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        '${BaseApiService.MEDIA_URL}/v1/file/download${value.res.data!.avatar!}',
                                        width: 60.0,
                                        height: 60.0,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            value.res.data?.name ?? '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.0),
                                          ),

                                          Text(
                                            value.res.data?.email ?? '',
                                            style: TextStyle(fontWeight: FontWeight.w500,
                                                color: Colors.grey
                                            ),
                                          )

                                        ],
                                      ),
                                    ),
                                    // Image(
                                    //   image: AssetImage('assets/images/icon_arrow.png'),
                                    //   width: 50.0,
                                    //   height: 50.0,
                                    // ),

                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 25.0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print('hello');
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.discount,
                                            size: 25.0,
                                          ),

                                          SizedBox(
                                            width: 20.0,
                                          ),

                                          Expanded(
                                              child: Text(
                                                'Mã giảm giá',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18.0),
                                              )),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 25.0,
                                          )

                                        ],
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                    color: Color(0xFFC0C0C0),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const HistoryScreen()));
                                    },
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.history,
                                            size: 25.0,
                                          ),
                                          SizedBox(
                                            width: 20.0,
                                          ),

                                          Expanded(
                                              child: Text(
                                                'Lịch sử',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18.0),
                                              )),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            size: 25.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(children: [
                                    InkWell(
                                      onTap: (){
                                        openAlert(context);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.logout,
                                              size: 25.0,
                                            ),

                                            SizedBox(
                                              width: 20.0,
                                            ),

                                            Expanded(child: Text(
                                              'Đăng xuất',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18.0
                                              ),
                                            )),

                                          ],
                                        ),
                                      ),
                                    ),

                                  ])))
                        ],
                      );
                    },
                  )
              ),
            ),
          ),
        ),
      ),
    );
  }

  openAlert(BuildContext context) {
    final dialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      surfaceTintColor: Colors.white,
      //this right here
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Bạn có muốn đăng xuất?',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
              ),

              const SizedBox(
                height: 16,
              ),

              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 12, right: 6),
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          primary: Colors.green,
                          side: BorderSide(color: Color(0xFF7EA567)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                        "Hủy",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),


                      ),
                      )
                    ),

                  const SizedBox(
                    width: 16,
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6, right: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          AppPreferencesService()
                              .remove(PreferencesService.KEY_BEARER_TOKEN);
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const LoginScreen()));
                          
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                                  (route) => false);

                        },
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text(
                          "Đăng xuất",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),

                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => dialog);
  }

  Future<void> _refresh() async {
    viewModel.getProfile(context);
  }

  Widget _buildTopRowItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CardProfileShimmer(isLoading: _isLoading),
    );
  }
}
