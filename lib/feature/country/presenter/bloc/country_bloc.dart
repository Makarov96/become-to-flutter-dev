import 'dart:async';

import 'package:become_to_flutter_dev/feature/country/domain/controller/country_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ControllerNotifier extends AsyncNotifier<String> {
  Future<String> getCharacteristic() async =>
      ref.read(CountryController.apiCountry).getCountries();

  @override
  FutureOr<String> build() async {
    return await getCharacteristic();
  }
}

final controllerNotifierProvider =
    AsyncNotifierProvider<ControllerNotifier, String>(
  ControllerNotifier.new,
);
