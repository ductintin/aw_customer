import 'package:aw_customer/data/model/api/ResponseWrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:aw_customer/repository/Repository.dart';

import '../../../data/model/api/response/booking_response.dart';

class HistoryDetailViewModel extends ChangeNotifier {
  final _repo = Repository();

  ResponseWrapper<BookingResponse> res = ResponseWrapper.loading();

  setRes(ResponseWrapper<BookingResponse> res) {
    this.res = res;
    notifyListeners();
  }

  Future<void> getBooking(int? id) async {
    setRes(ResponseWrapper.loading());

    _repo
        .getBooking(id)
        .then((value) => {
              if (value.result!) {setRes(ResponseWrapper.completed(value))}
            })
        .onError((error, stackTrace) =>
            {setRes(ResponseWrapper.error(error.toString()))})
        .whenComplete(() => {});
  }
}
