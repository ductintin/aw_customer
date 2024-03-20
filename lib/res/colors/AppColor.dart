import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColor{
  static const Color mainColor = Color(0xff7EA567);
  static const Color secondColor = Color(0xff7EA567);

  static const Color backgroundColor = Color(0xffEEF2F5);

  static get shimmerGradient => const LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
}