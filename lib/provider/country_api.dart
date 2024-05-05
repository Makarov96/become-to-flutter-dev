import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:become_to_flutter_dev/core/models/country_model.dart';

class CountryApi {
  Future<List<Country>?> getAllCountries() async {
    var client = http.Client();
    var uri = Uri.parse('https://restcountries.com/v3.1/all');
    var response = await client.get(uri);
  }
}
