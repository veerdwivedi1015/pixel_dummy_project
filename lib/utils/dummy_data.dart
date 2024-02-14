import 'package:pixel_crew_dummy/model/data.dart';

class DummyData {
  static List<Data> getChargingData() {
    return [
      Data(
          chargerId: 'C06789',
          brand: 'One Plus',
          slot: '8:30 - 9:30',
          distance: 1.5),
      Data(
          chargerId: 'C06790',
          brand: 'Tesla',
          slot: '7:30 - 9:30',
          distance: 3.3),
      Data(
          chargerId: 'C06791',
          brand: 'Tesla',
          slot: '8:30 - 10:30',
          distance: 19.4),
      Data(
          chargerId: 'C06792',
          brand: 'One Plus',
          slot: '8:30 - 9:30',
          distance: 8.5),
      Data(
          chargerId: 'C06793',
          brand: 'One Plus',
          slot: '12:30 - 16:30',
          distance: 9.5),
      Data(
          chargerId: 'C06794',
          brand: 'Tesla',
          slot: '6:30 - 7:30',
          distance: 11.3),
      Data(
          chargerId: 'C06767',
          brand: 'Tata',
          slot: '8:30 - 9:30',
          distance: 10.3),
      Data(
          chargerId: 'C06788',
          brand: 'Tesla',
          slot: '11:30 - 12:30',
          distance: 15.0),
    ];
  }
}
