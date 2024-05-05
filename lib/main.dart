import 'package:become_to_flutter_dev/feature/country/presenter/screen/country_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      home: CountryScreen(),
    );
  }
}

//**
//
//flutter_bloc
// BlocBuilder
// provider Consumer
// */

enum Status {
  init,
  loading,
  loaded,
  error,
}

final controllerProvider = ChangeNotifierProvider((ref) => Controller());

class Controller extends ChangeNotifier {
  Controller() {
    getCharacteristic();
  }
  Status status = Status.init;
  var counter = 0;
  List<String> characteres = [];
  void update() {
    counter++;
    notifyListeners();
  }

  final Dio _dio = Dio();
  String data = '';

  void getCharacteristic() async {
    status = Status.loading;
    try {
      final Response response =
          await _dio.get('https://restcountries.com/v3.1/all');
      data = response.data.toString();
      print(response.data.toString());
      status = Status.loaded;
    } catch (e) {
      status = Status.error;
    }
    notifyListeners();
  }
}
