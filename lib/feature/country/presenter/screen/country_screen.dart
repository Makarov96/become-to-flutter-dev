import 'package:become_to_flutter_dev/core/models/country_model.dart';
import 'package:become_to_flutter_dev/feature/country/presenter/bloc/country_bloc.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryScreen extends ConsumerStatefulWidget {
  const CountryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country App Bar'),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ref.watch(controllerNotifierProvider).when(
                    data: (data) {
                      final List<CountryModel> countries = data;
                      return SizedBox(
                        height: 350,
                        child: Center(
                            child: Swiper(
                          layout: SwiperLayout.STACK,
                          itemWidth: 350.00,
                          itemCount: countries.length,
                          itemBuilder: (context, index) {
                            final country = countries[index];
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(country.commonName,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        "Official Name: ${country.officialName}"),
                                    Text(
                                        "Capital: ${country.capitals.join(', ')}"),
                                    Text(
                                        "Continents: ${country.continents.join(', ')}"),
                                    Image.network(
                                      country.flagImageUrl,
                                      fit: BoxFit.fill,
                                      height: 200,
                                      width: 330,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )),
                      );
                    },
                    error: (e, s) => Text('Ah pasado un error $e'),
                    loading: () => const CircularProgressIndicator(),
                  ),
            ]),
      ),
    );
  }
}
