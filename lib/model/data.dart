class Data {
  Data({
    required this.chargerId,
    required this.brand,
    required this.slot,
    required this.distance,
  });

  final String chargerId;
  final String brand;
  final String slot;
  final double distance;

  factory Data.fromJson(Map<String, dynamic>? map, {double distance = 0.0}) {
    if (map == null) {
      return Data(
        chargerId: '',
        brand: '',
        slot: '',
        distance: 0,
      );
    }
    return Data(
      chargerId: map['evse_id'],
      brand: 'One Plus',
      slot: '9:30 - 10:30',
      distance: distance,
    );
  }
}
