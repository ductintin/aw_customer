import 'dart:developer';

import 'package:aw_customer/repository/Repository.dart';
import 'package:flutter/widgets.dart';

import '../../data/model/api/ResponseWrapper.dart';
import '../../data/model/api/response/history_response.dart';
import '../../data/model/api/response_list_wrapper.dart';
import '../../utils/Utils.dart';

class HistoryPageViewModel extends ChangeNotifier {
  final _repo = Repository();

  List<HistoryResponse> _histories = [];

  bool isLoading = false;

  int _totalElements = 0;

  int _page = 0;
  int _size = 10;

  int get page => _page;

  setPage(int value) {
    _page = value;
    notifyListeners();
  }

  int get size => _size;

  setSize(int value) {
    _size = value;
    notifyListeners();
  }

  setTotalElement(int totalElements) {
    _totalElements = totalElements;
    notifyListeners();
  }

  int get totalElements => _totalElements;

  ResponseWrapper<ResponseListWrapper<HistoryResponse>> res =
      ResponseWrapper.loading();

  List<HistoryResponse> get histories => _histories;

  setListHistory(List<HistoryResponse> histories) {
    _histories.addAll(histories);
    notifyListeners();
  }

  refreshListHistory() {
    _histories.clear();
  }

  void _showLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  void setLoginRes(ResponseWrapper<ResponseListWrapper<HistoryResponse>> res) {
    this.res = res;
    notifyListeners();
  }

  Future<void> getHistory() async {
    print("firest ${totalElements}");

    _showLoading(true);

    _repo.getHistory(null, null, page, size, null).then((value) {
      _showLoading(false);
      Utils.dismissLoading();

      if (value.result!) {
        final List<HistoryResponse>? data =
            value.data?.content?.map((e) => e).toList();

        setTotalElement(value.data!.totalElements!);
        log("page $page");
        setPage(page + 1);
        log("total $totalElements");

        setListHistory(data as List<HistoryResponse>);

        setLoginRes(ResponseWrapper.completed(value));
      }
    }).onError((error, stackTrace) {
      Utils.dismissLoading();
      log(error.toString());
      _showLoading(false);
      setLoginRes(ResponseWrapper.error(error.toString()));
    }).whenComplete(() {
      Utils.dismissLoading();
      _showLoading(false);
    });
  }
}
