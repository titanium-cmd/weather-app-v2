import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_v2/views/fourth_screen.dart';
import 'package:weather_app_v2/views/home_screen.dart';
import 'package:weather_app_v2/views/news_screen.dart';
import 'package:weather_app_v2/views/second_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [HomeScreen(), SecondScreen(), NewsScreen(), FourthScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      backgroundColor: const Color(0xffFAFCFC),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 10, right: 10),
          currentIndex: _currentIndex,
          dotIndicatorColor: Colors.white,
          unselectedItemColor: const Color(0xff414B5A),
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            /// Home
            DotNavigationBarItem(
              icon: const Icon(Icons.cloud),
              selectedColor: const Color.fromARGB(184, 141, 187, 255),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: const Icon(Icons.auto_graph),
              selectedColor: const Color.fromARGB(184, 141, 187, 255),
            ),

            /// Search
            DotNavigationBarItem(
              icon: const Icon(Icons.newspaper),
              selectedColor: const Color.fromARGB(184, 141, 187, 255),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: const Icon(Icons.location_on),
              selectedColor: const Color.fromARGB(184, 141, 187, 255),
            ),
          ],
        ),
      ),
    );
  }
}
