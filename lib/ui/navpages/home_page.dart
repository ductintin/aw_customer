import 'dart:async';
import 'dart:developer';

import 'package:aw_customer/data/model/api/response/search_location.dart';
import 'package:aw_customer/res/colors/AppColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:aw_customer/ui/navpages/home_page_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../constant/Constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final vm = HomePageViewModel();
  final ScrollController scrollController = ScrollController();
  TextEditingController depController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ChangeNotifierProvider<HomePageViewModel>(
        create: (BuildContext context) => vm,
        child: Consumer<HomePageViewModel>(
          builder: (context, value, _) {
            return SafeArea(
              child: Stack(
                children: [

                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Chọn địa điểm',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0,
                            color: Color(0xff424242),
                          ),
                        ),
                      ),

                      Card(
                        margin: EdgeInsets.all(15.0),
                        surfaceTintColor: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/icon_vector.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Vị trí của bạn',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: Colors.grey,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        TextField(
                                          controller: depController,
                                          onChanged: (value) => {
                                            vm.setListDestination([]),
                                            vm.setOrigin(value),
                                            if(value.isNotEmpty)
                                              vm.searchLocation(vm.origin)
                                          },
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: Color(0xff424242),
                                              overflow: TextOverflow.ellipsis),
                                          decoration: InputDecoration(
                                              hintText: 'Nhập địa điểm đón',
                                              border: InputBorder.none,
                                              suffixIcon: IconButton(
                                                onPressed: () {
                                                  depController.clear();
                                                  vm.setOrigin("");
                                                  vm.setOriginId("");
                                                  vm.setListOrigin([]);
                                                },
                                                icon: const Icon(
                                                    Icons.close_rounded),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 2.0,
                                color: AppColor.mainColor,
                              ),
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/icon_destination.png'),
                                    height: 30,
                                    width: 30,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      controller: desController,
                                      onChanged: (value) =>{
                                        vm.setListOrigin([]),
                                        vm.setDestination(value),
                                        if(value.isNotEmpty)
                                          vm.searchDestination(value)
                                      },
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Color(0xff424242),
                                          overflow: TextOverflow.ellipsis),
                                      decoration: InputDecoration(
                                          hintText: 'Nhập địa điểm đến',
                                          border: InputBorder.none,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              desController.clear();
                                              vm.setDestination("");
                                              vm.setDestinationId("");
                                              vm.setListDestination([]);
                                            },
                                            icon:
                                                const Icon(Icons.close_rounded),
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      if(vm.originList.isNotEmpty) _uiLocation(vm),

                      if(vm.destinationList.isNotEmpty) _uiDestination(vm),

                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        onPressed: vm.originId.isNotEmpty && vm.destinationId.isNotEmpty ? () {
                          log("hello");
                        } : null,
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: Text(
                          "Tiếp tục",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _uiLocation(HomePageViewModel viewModel) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      controller: scrollController,
      itemCount: viewModel.originList.length,
      itemBuilder: (context, index) {
        SearchLocation sr = viewModel.originList[index];
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  depController.text = sr.description!;
                  viewModel.setOrigin(sr.description!);
                  viewModel.setOriginId(sr.place_id!);

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sr!.structured_formatting!.main_text!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xff424242),
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      sr!.description!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis),
                    ),

                    Divider(
                      thickness: 1.0,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  _uiDestination(HomePageViewModel viewModel) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      physics: const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      controller: scrollController,
      itemCount: viewModel.destinationList.length,
      itemBuilder: (context, index) {
        SearchLocation sr = viewModel.destinationList[index];
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  desController.text = sr.description!;
                  viewModel.setDestination(sr.description!);
                  viewModel.setDestinationId(sr.place_id!);

                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sr!.structured_formatting!.main_text!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xff424242),
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      sr!.description!,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis),
                    ),

                    Divider(
                      thickness: 1.0,
                      color: Colors.grey,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
