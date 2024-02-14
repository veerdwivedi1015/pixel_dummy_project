import 'package:flutter/material.dart';

class Typography3 extends StatelessWidget {
  const Typography3({
    super.key,
    required this.data,
    this.textColor = Colors.black,
    this.underLine = false,
    this.textAlign,
    this.fontweight = FontWeight.normal,
  });

  final String data;
  final Color textColor;
  final bool underLine;
  final TextAlign? textAlign;
  final FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        fontSize: 14,
        fontWeight: fontweight,
        color: textColor,
        decoration: underLine ? TextDecoration.underline : TextDecoration.none,
      ),
      textAlign: textAlign ?? TextAlign.center,
      overflow: TextOverflow.ellipsis,
      maxLines: 8,
    );
  }
}
