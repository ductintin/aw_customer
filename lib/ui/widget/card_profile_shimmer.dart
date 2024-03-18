import 'package:aw_customer/ui/widget/circle_item_widget.dart';
import 'package:flutter/material.dart';
class CardProfileShimmer extends StatelessWidget {
  const CardProfileShimmer({
    super.key,
    required this.isLoading,
  });

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildImage(),
        const SizedBox(width: 16),
        _buildText(),

        Icon(
          Icons.arrow_forward_ios,
          size: 25.0,
        )
      ],
    );
  }

  Widget _buildImage() {
    return const CircleItemWidget();
  }

  Widget _buildText() {
    if (isLoading) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 15,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 15,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
            ),


          ],
        ),
      );
    } else {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
              'eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
      );
    }
  }
}