import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pixel_crew_dummy/routes/routes_import.gr.dart';
import 'package:stacked/stacked.dart';

class HomeScreeViewModel extends BaseViewModel {
  handelNavigation(BuildContext context) {
    AutoRouter.of(context).push(const ReservationRoute());
  }
}
