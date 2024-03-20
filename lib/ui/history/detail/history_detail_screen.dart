import 'package:aw_customer/data/remote/network/BaseApiService.dart';
import 'package:aw_customer/res/colors/AppColor.dart';
import 'package:aw_customer/ui/history/detail/history_detail_view_model.dart';
import 'package:aw_customer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../data/model/api/ApiStatus.dart';

class HistoryDetailScreen extends StatefulWidget {
  int? historyId;

  HistoryDetailScreen(this.historyId, {super.key});

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  HistoryDetailViewModel viewModel = HistoryDetailViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getBooking(widget.historyId);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 10.0),
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    IconButton(
                        onPressed: (){
                          Navigator.pop(context, true);},
                        icon: Icon(
                            Icons.arrow_back,
                          size: 25.0,
                        )),

                    SizedBox(width: 10),

                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Chi tiết chuyến đi',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20.0
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Expanded(
                child: RefreshIndicator(
                    onRefresh: _refresh,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        child: ChangeNotifierProvider<HistoryDetailViewModel>(
                          create: (BuildContext context) => viewModel,
                          child: Consumer<HistoryDetailViewModel>(
                            builder: (context, value, _){
                              switch(value.res.status){
                                case ApiStatus.LOADING:
                                  return const Center(
                                    child: SpinKitThreeBounce(
                                      color: AppColor.mainColor,
                                      size: 30.0,
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
                                          child: Text('Lỗi kết nối, vui lòng thử lại!'),
                                        ),
                                      ),
                                    ),
                                  );
                                case ApiStatus.COMPLETED:
                                  return _ui(viewModel);
                                default:
                                  return Container();
                              }
                            },
                          ),

                        ),
                      ),
                    )),
              )

            ],
          )
      ));
  }

  Future<void> _refresh() async{}

  _ui(HistoryDetailViewModel vm){
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              if(vm.res.data?.state == 300)
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.mainColor.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: ClipOval(
                                  child:  viewModel.res.data?.driver?.avatar != null ?
                                  Image.network(
                                      '${BaseApiService.MEDIA_URL}/v1/file/download${vm.res.data?.driver!.avatar!}',
                                      height:60.0,
                                      width: 60.0,
                                      fit: BoxFit.cover
                                  )
                                      :
                                  const Image(
                                      image: AssetImage('assets/images/user_avatar.png'),
                                      width: 60.0,
                                      height: 60.0),
                                ),
                              ),
                            ),

                            Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      vm.res.data?.driver?.fullName ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18
                                      ),),

                                    Text(
                                      vm.res.data?.driver?.address ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16
                                      ),),

                                    Container(
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                          color: AppColor.backgroundColor,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Text(
                                        vm.res.data?.driver?.phone ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16
                                        ),),
                                    )
                                  ],
                                )
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),


              if(vm.res.data?.rating != null)
                Column(
                  children: [
                    Text(
                      'Đánh giá tài xế',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                      ),),

                    RatingBar(
                        initialRating: vm.res.data?.rating?.star?.toDouble() ?? 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        ignoreGestures: true,
                        ratingWidget: RatingWidget(
                            full: const Icon(Icons.star, color: Colors.yellow),
                            half: const Icon(
                              Icons.star_half,
                              color: Colors.yellow,
                            ),
                            empty: const Icon(
                              Icons.star_outline,
                              color: Colors.yellow,
                            )),
                        onRatingUpdate: (value) {

                        }),

                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 50.0),
                      child: Text(
                        vm.res.data?.rating?.message ?? '',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Divider(
                      thickness: 10.0,
                      color: AppColor.backgroundColor,
                    ),
                  ],
                ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [

                    SizedBox(
                      height: 16,
                    ),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Thanh toán',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),),

                          SizedBox(
                            height: 5,
                          ),

                          Row(
                            children: [
                              Text(
                                'Cước phí',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),),

                              Expanded(
                                child: Text(
                                  '${NumberUtils.formatMoneyToString(vm.res.data!.money!)} đ',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16
                                  ),),
                              )
                            ],
                          ),

                          SizedBox(
                            height: 5,
                          ),

                          Divider(
                            color: Color(0xffEEF2F5),
                          ),

                          Row(
                            children: [
                              Text(
                                'Thành tiền',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20
                                ),),

                              Expanded(
                                child: Text(
                                  '${NumberUtils.formatMoneyToString(vm.res.data!.money!)} đ',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20
                                  ),),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),


                  ],
                ),
              ),

              Divider(
                thickness: 8.0,
                color: Color(0xffEEF2F5),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Chi tiết chuyến đi',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xff424242),
                      ),),

                    Row(
                      children: [
                        Text(
                          'Mã: ${vm.res.data?.code}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),),

                        SizedBox(
                          width: 16.0,
                        ),

                        Text(
                          '${NumberUtils.formatDate(vm.res.data!.createdDate!)}',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),),
                      ],
                    ),

                    SizedBox(
                      height: 16,
                    ),

                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/icon_vector.png'),
                          height: 30,
                          width: 30,
                        ),

                        SizedBox(
                          width: 16,
                        ),

                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Điểm đón',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.grey,
                                    overflow: TextOverflow.ellipsis
                                ),
                              ),

                              Text(
                                vm.res.data?.pickupAddress ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xff424242),
                                    overflow: TextOverflow.ellipsis
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),

                    SizedBox(
                      height: 20,
                    ),

                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/icon_destination.png'),
                          height: 30,
                          width: 30,
                        ),


                        SizedBox(
                          width: 16,
                        ),

                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Điểm đến',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),

                                  SizedBox(
                                    width: 10,
                                  ),

                                  Text(
                                    '${NumberUtils.formatDistance(vm.res.data!.distance!)} km',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.grey,
                                        overflow: TextOverflow.ellipsis
                                    ),
                                  ),
                                ],
                              ),

                              Text(
                                vm.res.data?.destinationAddress ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xff424242),
                                    overflow: TextOverflow.ellipsis
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),

                  ],

                ),
              ),
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: vm.res.data!.state == 300 ? Color(0xffDCFFED) : (vm.res.data!.state == -100 ? Color(0xffFFDDDD) : Color(
                      0xfffdf8db)),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: Text(
                textAlign: TextAlign.center,
                vm.res.data!.state == 300 ? 'Đã hoàn thành' : (vm.res.data!.state == -100 ? 'Đã hủy' : 'Đang thực hiện')
                ,
                style: TextStyle(
                    color: vm.res.data!.state == 300 ? Color(0xff0FA958) : (vm.res.data!.state == -100 ? Color(0xffFF0000) : Color(0xffFDDA23)),
                    fontWeight: FontWeight.w700, fontSize: 18),),
            ),
          ),
        )
      ],
    );
  }
}
