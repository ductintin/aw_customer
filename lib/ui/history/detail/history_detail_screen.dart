import 'package:flutter/material.dart';

class HistoryDetailScreen extends StatefulWidget {
  int? historyId;

  HistoryDetailScreen(this.historyId, {super.key});

  @override
  State<HistoryDetailScreen> createState() => _HistoryDetailScreenState();
}

class _HistoryDetailScreenState extends State<HistoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context, true);
                      },
                      child: const Image(
                        image: AssetImage('assets/images/icon_back.png'),
                        width: 20,
                        height: 20,
                      ),
                    ),
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

              SizedBox(
                height: 20,
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Image(
                      image: AssetImage('assets/images/user_avatar.png'),
                      width: 80.0,
                      height: 80.0),

                    SizedBox(
                      height: 16,
                    ),

                    Column(
                      children: [
                        Text(
                          'Nguyen Cong Phat',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20
                          ),),

                        Text(
                          '0987654321',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16
                          ),),

                      ],
                    ),

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
                                  '200.000 đ',
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
                                  '200.000 đ',
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
                      'Thành tiền',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                      ),),

                    Row(
                      children: [
                        Text(
                          'Mã: 12345',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16
                          ),),

                        SizedBox(
                          width: 16.0,
                        ),

                        Text(
                          '25/09/2023 15:00',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16
                          ),),
                      ],
                    ),

                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/icon_vector.png'),
                          height: 20,
                          width: 20,
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        Flexible(
                          child: Text(
                            '150/17 Đinh Tiên Hoàng, Phường 26, Quận 3',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      ],

                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/images/icon_destination.png'),
                          height: 20,
                          width: 20,
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        Flexible(
                          child: Text(
                            '150/17 Đinh Tiên Hoàng, Phường 26, Quận 3',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Colors.grey,
                                overflow: TextOverflow.ellipsis
                            ),
                          ),
                        ),
                      ],

                    ),

                  ],


                ),
              )
            ],
          )
      ));
  }

  Future<void> _refresh() async{}
}
