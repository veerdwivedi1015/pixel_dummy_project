import 'package:flutter/material.dart';

class TypoGraphy2 extends StatelessWidget {
  const TypoGraphy2(
      {super.key,
      required this.data,
      this.textColor = Colors.black,
      this.underLine = false,
      this.align,
      this.fontweight = FontWeight.normal});

  final String data;
  final Color textColor;
  final bool underLine;
  final TextAlign? align;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: fontweight,
        decoration: underLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textAlign: align ?? TextAlign.center,
    );
  }
}
