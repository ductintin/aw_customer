import 'package:aw_customer/data/model/api/response/history_response.dart';
import 'package:aw_customer/res/colors/AppColor.dart';
import 'package:aw_customer/ui/navpages/history_page_view_model.dart';
import 'package:aw_customer/ui/widget/card_item_widget.dart';
import 'package:aw_customer/ui/widget/history_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../data/model/api/ApiStatus.dart';
import '../../data/model/api/ResponseWrapper.dart';
import '../widget/shimmer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with TickerProviderStateMixin {
  late ScrollController scrollController;

  bool _showBackToTopButton = false;
  bool _isLoading = true;

  HistoryPageViewModel viewModel = HistoryPageViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getHistory();
    scrollController = ScrollController()
      ..addListener(loadMore)
      ..addListener(() {
        setState(() {
          if (scrollController.offset >=
              MediaQuery.of(context).size.height * 0.6) {
            _showBackToTopButton = true; // show the back-to-top button
          } else {
            _showBackToTopButton = false; // hide the back-to-top button
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2F5),
      body: SafeArea(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                scrollController.animateTo(0,
                    duration: const Duration(seconds: 1), curve: Curves.linear);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Hoạt động',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0),
                ),
              ),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: ChangeNotifierProvider<HistoryPageViewModel>(
                    create: (BuildContext context) => viewModel,
                    child: Consumer<HistoryPageViewModel>(
                      builder: (context, value, _) {
                        switch (value.res.status) {
                          case ApiStatus.LOADING:
                            //return const Center(child: SpinKitThreeBounce(color: Color(0xff7EA567), size: 30.0,));
                            return Shimmer(
                              linearGradient: AppColor.shimmerGradient,
                              child: ListView(
                                physics: _isLoading
                                    ? const NeverScrollableScrollPhysics()
                                    : null,
                                children: [
                                  const SizedBox(height: 16),
                                  _buildListItem(),
                                  _buildListItem(),
                                  _buildListItem(),
                                ],
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
                                    child: Text(
                                      'Lỗi kết nối, vui lòng thử lại!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20.0,
                                          color: Colors.red),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          case ApiStatus.COMPLETED:
                            return value.histories.isEmpty
                                ? const Text("rỗng")
                                : _ui(viewModel);
                          default:
                            return Container();
                        }
                      },
                    )),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              backgroundColor: AppColor.mainColor,
              child: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  _ui(HistoryPageViewModel viewModel) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        controller: scrollController,
        itemCount: viewModel.histories.length,
        itemBuilder: (context, index) {
          HistoryResponse hs = viewModel.histories[index];
          bool isNextLoading = false;
          if (index == viewModel.histories.length - 1 && viewModel.isLoading) {
            isNextLoading = true;
          }
          return HistoryWidget(hs, isNextLoading);
        });
  }

  void loadMore() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        viewModel.histories.length < viewModel.totalElements) {
      viewModel.getHistory();
    }
  }

  Future<void> _refresh() async {
    viewModel.setPage(0);
    viewModel.setLoginRes(ResponseWrapper.loading());
    viewModel.refreshListHistory();
    viewModel.getHistory();
  }

  Widget _buildListItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CardItemWidget(
        isLoading: _isLoading,
      ),
    );
  }
}
