import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pixel_crew_dummy/componetns/atoms/typography2.dart';
import 'package:pixel_crew_dummy/componetns/atoms/typography3.dart';
import 'package:pixel_crew_dummy/componetns/molecule/appbar.dart';
import 'package:pixel_crew_dummy/componetns/molecule/custom_button.dart';
import 'package:pixel_crew_dummy/screen/home_screen/home_screen_view_model.dart';
import 'package:pixel_crew_dummy/utils/functions.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => HomeScreeViewModel(),
      builder: (ctx, model, _) => _Body(model: model),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.model});

  final HomeScreeViewModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 130, 212, 36),
              border: Border.all(
                  color: const Color.fromARGB(255, 130, 212, 36), width: 1),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
        ),
      ),
      body: SizedBox(
        height: Functions.responsiveHeight(context: context, percent: 100),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(children: [
                CustomAppBar(
                  onIconPress: () {},
                  headerText: 'Charger Reservation',
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      _IconWithText(model: model),
                      _Data(),
                      SizedBox(
                        height: Functions.responsiveHeight(
                            context: context, percent: 4),
                      ),
                      const _Document(),
                    ],
                  ),
                )
              ]),
            ),
            Positioned(
              bottom: 50,
              left: 16,
              right: 16,
              child: CustomButton(
                  buttonTitle: 'Slide to Search nearby Chargers',
                  callback: () => model.handelNavigation(context)),
            )
          ],
        ),
      ),
    );
  }
}

class _IconWithText extends StatelessWidget {
  const _IconWithText({required this.model});

  final HomeScreeViewModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: Functions.responsiveWidth(
        context: context,
        percent: 100,
      ),
      child: const Column(children: [
        Icon(
          Icons.ev_station_rounded,
          size: 100,
          color: Color.fromARGB(255, 142, 223, 49),
        ),
        SizedBox(
          height: 8,
        ),
        TypoGraphy2(
          data: 'My Electrical Vehicle',
          fontweight: FontWeight.bold,
        ),
      ]),
    );
  }
}

class _Data extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        TypoGraphy2(
          data: 'EV Number:',
          fontweight: FontWeight.bold,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Typography3(data: 'Current SOC :'),
                Typography3(
                  data: '76%',
                  textColor: Color.fromARGB(255, 142, 223, 49),
                  fontweight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                ),
                Typography3(data: 'Voltage'),
                Typography3(
                  data: '59.56',
                  fontweight: FontWeight.bold,
                ),
                SizedBox(
                  height: 12,
                ),
                Typography3(data: 'Predicate Kwh/Km'),
                Typography3(
                  data: '120 Kwh/Km',
                  fontweight: FontWeight.bold,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Typography3(data: 'Current SOH'),
                Typography3(
                  data: '75.5%',
                  textColor: Color.fromARGB(255, 142, 223, 49),
                  fontweight: FontWeight.bold,
                ),
                SizedBox(
                  height: 8,
                ),
                Typography3(data: 'Temperature'),
                Typography3(
                  data: '75.5%',
                  fontweight: FontWeight.bold,
                ),
                SizedBox(
                  height: 12,
                ),
                Typography3(data: 'Actual Kwh/Km'),
                Typography3(
                  data: '110 Kwh/Km',
                  fontweight: FontWeight.bold,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class _Document extends StatelessWidget {
  const _Document();

  @override
  Widget build(BuildContext context) {
    return const Typography3(
        data:
            'Use the slider at the bottom to search for nearby chargers and confirm your bookign.\n Once booked, you can use this mobile application to navigate to the charging station and intiate or stop charging.');
  }
}
