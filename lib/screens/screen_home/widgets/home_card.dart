// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:developer';

import 'package:all_in_one/screens/screen_home/widgets/navigation_drawer.dart';
import 'package:flutter/material.dart';

class HomePageCard extends StatefulWidget {
  const HomePageCard({
    Key? key,
    required Size screenSize,
  })  : _screenSize = screenSize,
        super(key: key);

  final Size _screenSize;

  @override
  State<HomePageCard> createState() => _HomePageCardState();
}

class _HomePageCardState extends State<HomePageCard> {
  final TextEditingController _nameController = TextEditingController();

  //ValuNotfiers

  @override
  Widget build(BuildContext context) {
    log("Build Called");
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: widget._screenSize.height / 3.3,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder(
                valueListenable: NavigationDrawer.nameNotifier,
                builder: (context, String name, _) {
                  log('message');
                  return Text(
                    "Hello $name,",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  );
                },
              ),
              Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        hintText: 'Please enter your name'),
                  ),
                  const SizedBox(height: 3),
                  MaterialButton(
                    onPressed: () {
                      NavigationDrawer.nameNotifier.value =
                          _nameController.text;
                      NavigationDrawer.nameNotifier.notifyListeners();
                      log(NavigationDrawer.nameNotifier.value, name: 'User');
                    },
                    color: Colors.teal,
                    minWidth: double.infinity,
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
