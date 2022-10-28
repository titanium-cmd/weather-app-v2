import 'package:flutter/material.dart';
import 'package:weather_app_v2/controllers/weather_controller.dart';
import 'package:weather_app_v2/models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherController _weatherController = WeatherController();

  @override
  void initState() {
    _weatherController.getWeatherData();
    super.initState();
  }

  double convertToCelcius({double? val}) {
    return (val! - 272.15).roundToDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: FutureBuilder<WeatherModel?>(
              future: _weatherController.getWeatherData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator.adaptive());
                }

                WeatherModel? weather = snapshot.data;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on),
                        Text(
                          'Accra, Ghana',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('20-Sep-22'),
                    Container(
                      margin: const EdgeInsets.only(top: 40, bottom: 50),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[400]!,
                                offset: const Offset(0, 4),
                                blurRadius: 30)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${convertToCelcius(val: weather?.main?.temp)}°',
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 64),
                              ),
                              const SizedBox(height: 30),
                              Text(
                                'Real feel: ${convertToCelcius(val: weather?.main?.feelsLike?.toDouble())}',
                                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Image.network(
                                  'http://openweathermap.org/img/w/${weather?.weather?[0].icon}.png'),
                              const SizedBox(height: 30),
                              Text(
                                '${weather?.weather?[0].main}',
                                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Weatherlabel(label: 'UV Index'),
                              SizedBox(height: 20),
                              Weatherlabel(label: 'Humidity'),
                              SizedBox(height: 20),
                              Weatherlabel(label: 'Wind Speed'),
                              SizedBox(height: 20),
                              Weatherlabel(label: 'Rain Probability'),
                              SizedBox(height: 20),
                              Weatherlabel(label: 'Pressure'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Weatherlabel(),
                              const SizedBox(height: 20),
                              Weatherlabel(
                                label: weather?.main?.humidity.toString(),
                              ),
                              const SizedBox(height: 20),
                              Weatherlabel(label: '${weather?.wind?.speed} mph'),
                              const SizedBox(height: 20),
                              const Weatherlabel(label: '30%'),
                              const SizedBox(height: 20),
                              Weatherlabel(label: '${weather?.main?.pressure} pa'),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

class Weatherlabel extends StatelessWidget {
  final String? label;
  const Weatherlabel({super.key, this.label = ''});

  @override
  Widget build(BuildContext context) {
    return Text(
      label!,
      style: const TextStyle(fontWeight: FontWeight.w700),
    );
  }
}
