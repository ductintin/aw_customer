import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:aw_customer/data/local/prefs/AppPreferecesService.dart';
import 'package:aw_customer/data/model/api/ApiResponse.dart';
import 'package:aw_customer/data/model/api/request/LoginRequest.dart';
import 'package:aw_customer/repository/Repository.dart';
import 'package:aw_customer/ui/home/home_screen.dart';
import 'package:aw_customer/ui/widget/LoadingWidget.dart';
import 'package:aw_customer/utils/Utils.dart';

import '../../data/model/api/ResponseWrapper.dart';
import '../../data/model/api/response/LoginResponse.dart';

class LoginViewModel extends ChangeNotifier {

  final _repo = Repository();
  final _prefs = AppPreferencesService();
  late String _phoneNumber;
  late String _password;

  bool isLoading = false;
  String get phoneNumber => _phoneNumber;
  String get password => _password;

  ResponseWrapper<LoginResponse> res = ResponseWrapper.loading();

  void _showLoading(bool loading){
    isLoading = loading;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void _setLoginRes(ResponseWrapper<LoginResponse> res){
      this.res = res;
      notifyListeners();
  }

// Thêm các phương thức xử lý đăng nhập, kiểm tra hợp lệ, v.v.
  Future<void> loginUser(BuildContext context) async {
    _showLoading(true);
    Utils.showLoading();
    LoginRequest loginRequest = LoginRequest(phone: _phoneNumber, password: _password);
    dynamic j = loginRequest.toMap();
    final a = LoginRequest.fromJson(j);
    print(a.toMap());
    _setLoginRes(ResponseWrapper.loading());
    _repo
        .login(loginRequest)
        .then((value) {
          _showLoading(false);
          Utils.dismissLoading();
         if(value.result!){
           Utils.toastSuccessMessage("Đăng nhập thành công");
           _setLoginRes(ResponseWrapper.completed(value));
           String? token = value.data?.access_token;
           _prefs.setToken(token!);
           print("token nef $token");
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
         }else{
           Utils.toastErrorMessage("Tên đăng nhập hoặc mật khẩu không đúng");
         }
        })
        .onError((error, stackTrace) {
      Utils.dismissLoading();
          _showLoading(false);
          _setLoginRes(ResponseWrapper.error(error.toString()));})
        .whenComplete((){
      Utils.dismissLoading();
          _showLoading(false);
    });
  }
}