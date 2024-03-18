import 'dart:math';

import 'package:aw_customer/data/model/api/response/history_response.dart';
import 'package:aw_customer/utils/number_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HistoryWidget extends StatefulWidget {
  HistoryResponse? hs;
  bool? isNextLoading;

  HistoryWidget(this.hs, this.isNextLoading, {super.key});

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: InkWell(
              onTap: () {
                print("hekko");
              },
              borderRadius: BorderRadius.circular(10.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          NumberUtils.formatDate(widget.hs!.createdDate!),
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/motor_service.png'),
                          height: 50,
                          width: 50,
                        ),
                        const SizedBox(
                          width: 25.0,
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    'Chuyến đi từ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${NumberUtils.formatMoneyToString(widget.hs!.money!)} đ',
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: Colors.black,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              widget.hs?.pickupAddress ?? '',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis),
                            ),
                            Text(
                              widget.hs?.destinationAddress ?? '',
                              textAlign: TextAlign.start,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis),
                            )
                          ],
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'AllBike',
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          width: 25.0,
                        ),
                        Icon(
                          Icons.circle,
                          color: widget.hs?.state == 300 ? Colors.green : ( widget.hs?.state == -100 ? Colors.red : Colors.yellow),
                          size: 8.0,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.hs?.state == 300 ? 'Hoàn thành' : (widget.hs?.state == -100 ? 'Đã hủy' : 'Đang thực hiện'),
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color:  widget.hs?.state == 300 ? Colors.green : ( widget.hs?.state == -100 ? Colors.red : Colors.yellow),
                              fontSize: 16),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        if (widget.isNextLoading!)
          const Padding(
              padding: EdgeInsets.all(16.0),
              child: SpinKitThreeBounce(
                color: Color(0xff7EA567),
                size: 30.0,
              )),
      ],
    );
  }
}
