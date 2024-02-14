import 'package:dio/dio.dart';
import 'package:pixel_crew_dummy/model/custom_response.dart';
import 'package:pixel_crew_dummy/model/data.dart';

class FetchReservations {
  static Future<CustomResponse> fetchChargingPoints(Dio instance) async {
    try {
      String url =
          'https://api-uat.voltnet.io/v0.2.0/omni/cpo/locations/nearby';

      var options = Options(
        headers: {
          'x-api-key':
              'bc9b0d1a5eec5f887cfa7a772d9627f8bca69984bb305a89c4088752e1350d6e'
        },
      );

      final value = await instance.get(url, options: options, queryParameters: {
        'latitude': 13.6521561,
        'longitude': 100.6756948,
        'radius': 1000,
        'limit': 10,
      });

      if (value.statusCode == 200) {
        List response = <Data>[];
        var locationList = value.data['locations'] as List;
        if (locationList.isNotEmpty) {
          for (var element in locationList) {
            var distance = element['distance_meters'] as double;
            distance = double.parse((distance / 1000).toStringAsFixed(4));
            var chargerList = element['location']['evses'] as List;
            for (var charger in chargerList) {
              var result = Data.fromJson(charger, distance: distance);
              if (result.chargerId.isNotEmpty) {
                response.add(result);
              }
            }
          }
        }
        return CustomResponse(data: response, error: null);
      } else {
        return const CustomResponse(data: null, error: 'Error');
      }
    } catch (e) {
      return const CustomResponse(data: null, error: 'Error');
    }
  }
}
