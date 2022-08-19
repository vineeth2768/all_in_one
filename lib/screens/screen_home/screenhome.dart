import 'package:all_in_one/screens/screen_home/widgets/home_card.dart';
import 'package:all_in_one/screens/screen_home/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("All In One"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      drawer: NavigationDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: HomePageCard(screenSize: _screenSize),
            ),
          ],
        ),
      ),
    );
  }
}
