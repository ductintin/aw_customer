
import 'package:flutter/widgets.dart';
import 'package:location/location.dart';
import 'package:aw_customer/data/local/database/UserDao.dart';
import 'package:aw_customer/data/model/api/ResponseWrapper.dart';
import 'package:aw_customer/data/model/api/response/profile_response.dart';
import 'package:aw_customer/utils/Utils.dart';

import '../../data/local/prefs/AppPreferecesService.dart';
import '../../repository/Repository.dart';

class HomeViewModel extends ChangeNotifier{
  final _repo = Repository();

  final _prefs = AppPreferencesService();

  UserDao userDao = UserDao();

  ResponseWrapper<ProfileResponse> profileRes = ResponseWrapper.loading();

  bool _isActive = false;

  bool get isActive => _isActive;

  void setActive(bool value) {
    _isActive = value;
    notifyListeners();
  }

  void _setProfileRes(ResponseWrapper<ProfileResponse> res){
    profileRes = res;
    notifyListeners();
  }

  void getProfile(BuildContext context){
    _setProfileRes(ResponseWrapper.loading());
    Utils.showLoading();
    _repo
        .getProfile()
        .then((value) {
          _setProfileRes(ResponseWrapper.completed(value));

            Utils.dismissLoading();
        })
        .onError((error, stackTrace) {
          _setProfileRes(ResponseWrapper.error(profileRes.message));
          Utils.dismissLoading();
        })
        .whenComplete((){
          Utils.dismissLoading();
        });
  }

}