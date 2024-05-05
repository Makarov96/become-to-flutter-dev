import 'package:become_to_flutter_dev/feature/country/domain/repositories/country_repositories.dart';
import 'package:dio/dio.dart';

class CountryApi implements CountryRepository {
  const CountryApi({required Dio dio}) : _dio = dio;
  final Dio _dio;
  @override
  Future<String> getCountries() async {
    final Response response =
        await _dio.get('https://restcountries.com/v3.1/all');

    return response.data.toString();
  }
}
