import 'package:flutter/material.dart';
import 'package:aw_customer/res/AppContextExtension.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(
            height: 8,
          ),
          Text(
            context.resources.strings.labelLoading,
          )
        ],
      ),
    ));
  }
}
