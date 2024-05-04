import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => Controller()..getCharacteristic(),
          ),
        ],
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Controller controller = Controller();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          children: [
            ListenableBuilder(
              listenable: controller,
              builder: (context, widget) {
                return Text('${controller.counter}');
              },
            ),
            Consumer<Controller>(
              builder: (context, controller, widget) {
                return Text('${controller.counter}');
              },
            ),
            Consumer<Controller>(
              builder: (context, controller, widget) {
                switch (controller.status) {
                  case Status.init:
                    return const CircularProgressIndicator();
                  case Status.loading:
                    return const CircularProgressIndicator();
                  case Status.loaded:
                    return Text(controller.data);

                  case Status.error:
                    return const Text('Ah pasado un error');
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller.update();
          context.read<Controller>().update();
        },
      ),
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

class Controller extends ChangeNotifier {
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

/**
 * 
 * ChangeNotifier
 * ValueNotifier
 * setState
 */

/**
 * 
 * 
 * RxJs
 * 
 * //Oservable Objects
 * Suscription
 * Observable
 * SucriptionBehavior
 * Reactive Programing 
 * Concept Programing 
 * Design Pattern
 *      |
 *     \ /
 *   Oservable Pattern
 * Suscription 
 *      ------>  ObservableObject
 *      ---✅--✅--✅->🙌🏽<-✅--✅-- Suscription
 *                             |- Cancel Suscrption 
 *                                ❌
 * Observable | ---✅--✅--✅->🙌🏽<-✅--✅-- Suscription
 *            | ---✅--✅--✅->🙌🏽<-✅--✅-- Suscription
 *            | ---✅--✅--✅->🙌🏽<-✅--✅-- Suscription
 * 
 * 
 * BehaviorSubject
 *   Like Begin from zero of onces Stream
 */


