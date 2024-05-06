import 'package:become_to_flutter_dev/core/models/country_model.dart';

abstract interface class CountryRepository {
  Future<List<CountryModel>> getCountries();
}
