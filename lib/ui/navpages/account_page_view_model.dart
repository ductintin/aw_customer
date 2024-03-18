import 'package:aw_customer/data/model/api/ResponseWrapper.dart';
import 'package:flutter/cupertino.dart';

import '../../data/local/prefs/AppPreferecesService.dart';
import '../../data/model/api/response/profile_response.dart';
import '../../repository/Repository.dart';

class AccountPageViewModel extends ChangeNotifier{
  final _repo = Repository();

  final _prefs = AppPreferencesService();

  ResponseWrapper<ProfileResponse> res = ResponseWrapper.loading();


  void _setProfileRes(ResponseWrapper<ProfileResponse> res){
    this.res = res;
    notifyListeners();
  }

  void getProfile(BuildContext context){
    _setProfileRes(ResponseWrapper.loading());
    _repo
        .getProfile()
        .then((value) {
      if(value.result!){
        _setProfileRes(ResponseWrapper.completed(value));
      }else{
        _setProfileRes(ResponseWrapper.error(value.message));
      }

    })
        .onError((error, stackTrace) {
      _setProfileRes(ResponseWrapper.error(error.toString()));

    })
        .whenComplete((){

    });
  }
}