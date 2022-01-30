class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Map<String, dynamic> geolocation;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geolocation,
  });

  Address.fromJson(Map<String, dynamic> json)
      : street = json['street'],
        suite = json['suite'],
        city = json['city'],
        zipcode = json['zipcode'],
        geolocation = json['geo'];

  Map<String, dynamic> toJson() => {
        'street': street,
        'suite': suite,
        'city': city,
        'zipcode': zipcode,
        'geo': geolocation,
      };
}
