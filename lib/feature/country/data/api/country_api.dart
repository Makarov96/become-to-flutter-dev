import 'package:become_to_flutter_dev/core/models/country_model.dart';
import 'package:become_to_flutter_dev/feature/country/domain/repositories/country_repositories.dart';
import 'package:dio/dio.dart';

class CountryApi implements CountryRepository {
  const CountryApi({required Dio dio}) : _dio = dio;
  final Dio _dio;
  @override
  Future<List<CountryModel>> getCountries() async {
    final Response response =
        await _dio.get('https://restcountries.com/v3.1/all');
    final List<dynamic> data = response.data;
    return data.map((json) => CountryModel.fromJson(json)).toList();
  }
}
