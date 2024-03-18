import 'package:flutter/material.dart';
class CircleItemWidget extends StatelessWidget {
  const CircleItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.network(
          'https://docs.flutter.dev/cookbook'
              '/img-files/effects/split-check/Avatar1.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}