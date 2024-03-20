import 'package:aw_customer/data/local/prefs/AppPreferecesService.dart';
import 'package:aw_customer/data/model/api/ResponseWrapper.dart';
import 'package:aw_customer/data/model/api/response/profile_response.dart';
import 'package:flutter/cupertino.dart';

import '../../data/model/api/response/customer_response.dart';
import '../../repository/Repository.dart';

class AccountScreenViewModel extends ChangeNotifier{
  final _repo = Repository();

  final _prefs = AppPreferencesService();

  ResponseWrapper<ProfileResponse> res = ResponseWrapper.loading();

  String _name = '';
  String _password = '';

  String get name => _name;
  String get password => _password;

  setName(String name){
    _name = name;
    notifyListeners();
  }

  setPassword(String password){
    _password = password;
    notifyListeners();
  }



  setRes(ResponseWrapper<ProfileResponse> res){
    this.res = res;
    notifyListeners();
  }

  Future<void> getProfile() async{
    _repo.getProfile()
        .then((value) => {
          if(value.result!){
            setRes(ResponseWrapper.completed(value))
          }else{
            setRes(ResponseWrapper.error(value.message.toString()))
          }
    })
        .onError((error, stackTrace) => {
          setRes(ResponseWrapper.error(error.toString()))
    })
        .whenComplete(() => {

    });

  }
}