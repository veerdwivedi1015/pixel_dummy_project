import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pixel_crew_dummy/model/data.dart';
import 'package:pixel_crew_dummy/services/api_setup/configure_dio.dart';
import 'package:pixel_crew_dummy/services/api_setup/fetch_reservation.dart';
import 'package:pixel_crew_dummy/utils/functions.dart';
import 'package:stacked/stacked.dart';

class ReservationScreenViewModal extends BaseViewModel {
  final _dioInstance = DioConfig.instance; // Server giving inernal error 500

  var list = <Data>[];
  bool isErrorOcurred = false;

  void init(BuildContext context) async {
    setBusy(true);
    var response = await FetchReservations.fetchChargingPoints(_dioInstance);
    if (response.error == null) {
      list = response.data;
    } else {
      if (context.mounted) {
        isErrorOcurred = true;
        Functions.showSnackbar(context, 'Something went wrong!!');
      }
    }
    setBusy(false);
  }

  handleBackPress(BuildContext context) {
    AutoRouter.of(context).pop();
  }
}
