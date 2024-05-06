import 'package:become_to_flutter_dev/feature/country/domain/entity/country.dart';

class CountryModel extends Country {
  CountryModel({
    required String super.commonName,
    required String super.officialName,
    required super.capitals,
    required super.continents,
    required super.flagImageUrl,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      commonName: json["name"]["common"],
      officialName: json["name"]["official"],
      capitals: json["capital"] == null
          ? []
          : List<String>.from(json["capital"].map((x) => x)),
      continents: json["continents"] == null
          ? []
          : List<String>.from(json["continents"].map((x) => x)),
      flagImageUrl: json["flags"]?["png"],
    );
  }
}
