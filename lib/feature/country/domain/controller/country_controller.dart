import 'package:become_to_flutter_dev/core/controller/core_controller.dart';
import 'package:become_to_flutter_dev/feature/country/data/api/country_api.dart';
import 'package:become_to_flutter_dev/feature/country/domain/repositories/country_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension CountryController on Never {
  static var apiCountry = Provider<CountryRepository>(
    (ref) => CountryApi(dio: ref.read(CoreController.dioProvider)),
  );
}
