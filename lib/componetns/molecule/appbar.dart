import 'package:flutter/material.dart';
import 'package:pixel_crew_dummy/componetns/atoms/typography2.dart';
import 'package:pixel_crew_dummy/utils/functions.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onIconPress,
    required this.headerText,
  });

  final VoidCallback onIconPress;
  final String headerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Functions.responsiveHeight(context: context, percent: 5),
      width: Functions.responsiveWidth(context: context, percent: 100),
      child: Row(
        children: [
          IconButton(
            onPressed: () => onIconPress.call(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: Functions.responsiveWidth(
                context: context,
                percent: 15,
              ),
            ),
            child: TypoGraphy2(
              data: headerText,
              align: TextAlign.center,
              fontweight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
