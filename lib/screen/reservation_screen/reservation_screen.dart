import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pixel_crew_dummy/componetns/atoms/typography2.dart';
import 'package:pixel_crew_dummy/componetns/atoms/typography3.dart';
import 'package:pixel_crew_dummy/componetns/atoms/typography4.dart';
import 'package:pixel_crew_dummy/componetns/element/error_widget.dart';
import 'package:pixel_crew_dummy/componetns/molecule/appbar.dart';
import 'package:pixel_crew_dummy/componetns/molecule/custom_button.dart';
import 'package:pixel_crew_dummy/model/data.dart';
import 'package:pixel_crew_dummy/screen/reservation_screen/reservation_screen_view_model.dart';
import 'package:pixel_crew_dummy/utils/functions.dart';
import 'package:stacked/stacked.dart';

@RoutePage()
class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ReservationScreenViewModal(),
      onViewModelReady: (model) => model.init(context),
      builder: (ctx, model, _) => _Body(model: model),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.model});

  final ReservationScreenViewModal model;

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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(children: [
            CustomAppBar(
              onIconPress: () => model.handleBackPress(context),
              headerText: 'Charger Reservation',
            ),
            CustomErrorWidget(isError: model.isErrorOcurred),
            Container(
              height: Functions.responsiveHeight(context: context, percent: 90),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: model.isBusy
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 130, 212, 36),
                        strokeWidth: 4,
                      ),
                    )
                  : ListView.builder(
                      itemCount: model.list.length,
                      itemBuilder: (ctx, index) => _ResrvationPoints(
                        model.list[index],
                      ),
                    ),
            )
          ]),
        ),
      ),
    );
  }
}

class _ResrvationPoints extends StatelessWidget {
  const _ResrvationPoints(this.data);

  final Data data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Functions.responsiveHeight(context: context, percent: 25),
      width: Functions.responsiveWidth(context: context, percent: 100),
      child: Card(
          elevation: 2,
          child: ClipPath(
            clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: Color.fromARGB(255, 130, 212, 36), width: 5))),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: Functions.responsiveWidth(
                              context: context, percent: 50),
                          child: Typography3(
                            data: 'Charger ID: ${data.chargerId}',
                            fontweight: FontWeight.bold,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Typography3(data: 'Brand: ${data.brand}'),
                        const SizedBox(
                          height: 8,
                        ),
                        const Typography4(
                          data: 'Availablity',
                          textColor: Colors.black54,
                        ),
                        Typography3(data: data.slot),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Icon(
                          Icons.ev_station,
                          color: Color.fromARGB(255, 130, 212, 36),
                          size: 30,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Typography4(
                          data: 'Est Distance',
                          textColor: Colors.black54,
                        ),
                        TypoGraphy2(data: '${data.distance}KMs')
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  buttonTitle: 'Slide to Book >>',
                  callback: () {},
                  widthPercent: 70,
                )
              ]),
            ),
          )),
    );
  }
}
