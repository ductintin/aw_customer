import 'package:aw_customer/res/colors/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingScreen extends StatefulWidget {
  const RatingScreen({super.key});

  @override
  State<RatingScreen> createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  List<String> comments = ['Phương tiện sạch sẽ', 'An toàn', 'Nhanh chóng'];
  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return PopScope(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
                  children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 10.0),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 25.0,
                          )),
                      SizedBox(width: 10),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Đánh giá tài xế',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ClipOval(
                  child: const Image(
                      image: AssetImage('assets/images/user_avatar.png'),
                      width: 80.0,
                      height: 80.0,
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                Text(
                  'Bạn đánh giá tài xế như thế nào',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                RatingBar(
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 50,
                    minRating: 1,
                    glow: false,
                    itemPadding: EdgeInsets.all(3.0),
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
                    onRatingUpdate: (value) {}),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  child: _uiComment(),
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.backgroundColor),
                  padding: EdgeInsets.all(15.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Thêm nhận xét của bạn'),
                    maxLines: 5,
                    maxLength: 100,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      onPrimary: Color(0xFFFFFFFF),
                      primary: Color(0xFF7EA567),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)))),
                  child: const Text(
                    'Gửi',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ),
                  ],
                )),
    ));
  }

  _uiComment(){
    return Container(
      height: 40.0,
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(width: 15);
          },

          clipBehavior: Clip.none,
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          controller: scrollController,
          itemCount: comments.length,
          itemBuilder: (context, index){
            String comment = comments[index];
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: AppColor.backgroundColor),
              child: Text(
                comment,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            );
          }),
    );
  }
}
