
import 'dart:async';
import 'dart:developer';

import 'package:aw_customer/data/model/api/response/search_location.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:aw_customer/data/model/api/ResponseWrapper.dart';
import 'package:aw_customer/data/model/api/request/state_request.dart';
import 'package:aw_customer/data/model/api/response/profile_response.dart';
import 'package:aw_customer/data/model/api/response/service_online_response.dart';
import 'package:aw_customer/utils/Utils.dart';

import '../../data/local/prefs/AppPreferecesService.dart';
import '../../data/model/api/request/position_request.dart';
import '../../repository/Repository.dart';

class HomePageViewModel extends ChangeNotifier{
  final _repo = Repository();

  final _prefs = AppPreferencesService();

  String avatar = '';

  ResponseWrapper<ProfileResponse> profileRes = ResponseWrapper.loading();

  ResponseWrapper<ServiceOnlineResponse> serviceOnline = ResponseWrapper.loading();

  final Completer<GoogleMapController> controller = Completer<GoogleMapController>();

  LocationData? _currentLocation;

  LocationData? get currentLocation => _currentLocation;

  List<SearchLocation> _originList = [];

  List<SearchLocation> get originList => _originList;

  void setListOrigin(List<SearchLocation> originList){
    _originList = originList;
    notifyListeners();
  }

  List<SearchLocation> _destinationList = [];

  List<SearchLocation> get destinationList => _destinationList;

  void setListDestination(List<SearchLocation> destinationList){
    _destinationList = destinationList;
    notifyListeners();
  }

  bool _isActive = false;

  int _driverState = 0;

  int get driverState => _driverState;

  bool get isActive => _isActive;

  String _origin = "";
  String _destination = "";
  String _originId = "";
  String _destinationId = "";

  String get origin => _origin;

  void setOrigin(String value) {
    _origin = value;
    notifyListeners();
  }

  String get destination => _destination;

  void setDestination(String value) {
    _destination = value;
    notifyListeners();
  }

  String get originId => _originId;

  void setOriginId(String value) {
    _originId = value;
    notifyListeners();
  }

  String get destinationId => _destinationId;

  void setDestinationId(String value) {
    _destinationId = value;
    notifyListeners();
  }


  void setActive(bool value) {
    _isActive = value;
    notifyListeners();
  }

  void setCurrentLocation(LocationData loc){
    _currentLocation = loc;
    notifyListeners();
  }

  void setDriverState(int value) {
    _driverState = value;
    notifyListeners();
  }

  void _setProfileRes(ResponseWrapper<ProfileResponse> res){
    profileRes = res;
    notifyListeners();
  }

  void _setServiceOnline(ResponseWrapper<ServiceOnlineResponse> serviceOnline){
    this.serviceOnline = serviceOnline;
    notifyListeners();
  }


  void getProfile(BuildContext context){
    _setProfileRes(ResponseWrapper.loading());
    Utils.showLoading();
    _repo
        .getProfile()
        .then((value) {
      _setProfileRes(ResponseWrapper.completed(value));
      avatar = (profileRes.data != null ? profileRes.data?.avatar :'')!;
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

  void getServiceOnline(BuildContext context){
    _setServiceOnline(ResponseWrapper.loading());
    Utils.showLoading();
    _repo
        .getDriverState()
        .then((value) {
      _setServiceOnline(ResponseWrapper.completed(value));
      setDriverState(serviceOnline.data!.driverState);
      log(" driver state $_driverState");
      Utils.dismissLoading();
    })
        .onError((error, stackTrace) {
      _setProfileRes(ResponseWrapper.error(serviceOnline.message));
      Utils.dismissLoading();
    })
        .whenComplete((){
      Utils.dismissLoading();
    });
  }

  void updatePosition(BuildContext context){
    DateTime timeUpdate = DateTime.now().toUtc();
    String timeUpdateString = DateFormat('dd/MM/yyyy HH:mm:ss', 'en_US').format(timeUpdate);
    PositionRequest request  = PositionRequest(isBusy: 0, latitude: _currentLocation!.latitude.toString(), longitude:_currentLocation!.longitude.toString() , status: 1, timeUpdate: timeUpdateString);
    _repo
        .updatePosition(request)
        .then((value) {
          Utils.toastSuccessMessage(value.message);
    })
        .onError((error, stackTrace) {
    })
        .whenComplete((){
    });
  }

  void changeDriverState(BuildContext context){
    DriverStateRequest request = DriverStateRequest(newState: _driverState);
    _repo
        .changeDriverState(request)
        .then((value) {
      Utils.toastSuccessMessage(value.message);
    })
        .onError((error, stackTrace) {
    })
        .whenComplete((){
    });
  }


  Future<void> searchLocation(String location) async {
    _repo.searchLocation("$location Việt Nam")
        .then((value) => {
          if(value.status == "OK"){
            setListOrigin(value!.predictions!)
          }
        })
        .onError((error, stackTrace) => {

        })
        .whenComplete(() => {

    });
  }

  Future<void> searchDestination(String location) async {
    _repo.searchLocation("$location Việt Nam")
        .then((value) => {
      if(value.status == "OK"){
        setListDestination(value!.predictions!)
      }
    })
        .onError((error, stackTrace) => {

    })
        .whenComplete(() => {

    });
  }
}