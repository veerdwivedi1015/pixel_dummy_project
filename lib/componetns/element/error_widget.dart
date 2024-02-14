import 'package:flutter/material.dart';
import 'package:pixel_crew_dummy/componetns/atoms/typography2.dart';
import 'package:pixel_crew_dummy/utils/functions.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.isError});

  final bool isError;

  @override
  Widget build(BuildContext context) {
    return isError
        ? SizedBox(
            width: Functions.responsiveWidth(context: context, percent: 100),
            height: Functions.responsiveHeight(context: context, percent: 90),
            child: const Center(
              child: TypoGraphy2(
                data: 'Please try after some time!',
                textColor: Colors.grey,
                fontweight: FontWeight.bold,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
