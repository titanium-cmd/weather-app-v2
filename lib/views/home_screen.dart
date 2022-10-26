import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
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
                          color: Colors.grey[400]!, offset: const Offset(0, 4), blurRadius: 30)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '20°',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 64),
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Real feel: 20',
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
                        )
                      ],
                    ),
                    Column(
                      children: const [
                        Icon(Icons.sunny, size: 64),
                        SizedBox(height: 30),
                        Text(
                          'Cloudy',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
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
                      children: const [
                        Weatherlabel(),
                        SizedBox(height: 20),
                        Weatherlabel(label: '55',),
                        SizedBox(height: 20),
                        Weatherlabel(label: '5.00 mph'),
                        SizedBox(height: 20),
                        Weatherlabel(label: '30%'),
                        SizedBox(height: 20),
                        Weatherlabel(label: '1023.1 pa'),
                      ],
                    ),
                    // Weatherlabel(
                    //   label: 'UV Index',
                    // ),
                    // SizedBox(height: 20),
                    // Weatherlabel(
                    //   label: 'Humidity',
                    //   value: '55',
                    // ),
                    // SizedBox(height: 20),
                    // Weatherlabel(
                    //   label: 'Wind Speed',
                    //   value: '5.00 mph',
                    // ),
                    // SizedBox(height: 20),
                    // Weatherlabel(
                    //   label: 'Rain Probability',
                    //   value: '30%',
                    // ),
                    // SizedBox(height: 20),
                    // Weatherlabel(
                    //   label: 'Pressure',
                    //   value: '1023.1 pa',
                    // )
                  ],
                ),
              )
            ],
          ),
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
