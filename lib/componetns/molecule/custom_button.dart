import 'package:flutter/material.dart';
import 'package:pixel_crew_dummy/componetns/atoms/typography3.dart';
import 'package:pixel_crew_dummy/utils/functions.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonTitle,
    required this.callback,
    this.textColor = Colors.white,
    this.isBusy = false,
    this.widthPercent = 100,
  });

  final String buttonTitle;
  final VoidCallback callback;
  final Color textColor;
  final bool isBusy;
  final double widthPercent;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx != 0.0) {
          callback.call();
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 130, 212, 36),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 130, 212, 36),
            ),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        width:
            Functions.responsiveWidth(context: context, percent: widthPercent),
        height: 50,
        child: isBusy
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 1,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Typography3(
                        data: buttonTitle,
                        textColor: textColor,
                        fontweight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
