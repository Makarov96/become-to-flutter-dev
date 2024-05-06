import 'dart:async';

import 'package:become_to_flutter_dev/feature/country/domain/controller/country_controller.dart';
import 'package:become_to_flutter_dev/feature/country/domain/entity/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ControllerNotifier extends AsyncNotifier<dynamic> {
  Future<List<Country>> getCharacteristic() async =>
      ref.read(CountryController.apiCountry).getCountries();

  @override
  FutureOr<List<Country>> build() async {
    return await getCharacteristic();
  }
}

final controllerNotifierProvider =
    AsyncNotifierProvider<ControllerNotifier, dynamic>(
  ControllerNotifier.new,
);
