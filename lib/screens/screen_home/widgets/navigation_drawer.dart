import 'dart:developer';

import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({
    Key? key,
  }) : super(key: key);

  final List titles = [
    'Home',
    'Favorite',
    'About',
    'Logout',
  ];

  final List icons = [
    Icons.home,
    Icons.favorite,
    Icons.info,
    Icons.logout,
  ];

  static final ValueNotifier<String> nameNotifier = ValueNotifier('User');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
          children: List.generate(5, (index) {
        if (index == 0) {
          return UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.teal),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person),
            ),
            accountName: ValueListenableBuilder(
                valueListenable: nameNotifier,
                builder: (context, String name, _) {
                  return Text(name);
                }),
            accountEmail: const Text('user@gmail.com'),
          );
        }
        return InkWell(
          onTap: () {
            switch (index) {
              case 1:
                log(titles[0]);
                break;
              case 2:
                log(titles[1]);
                break;
              case 3:
                log(titles[2]);
                break;
              case 4:
                log(titles[3]);
                break;
              default:
            }
          },
          child: DrawerTiles(
            title: titles[index - 1],
            icon: icons[index - 1],
          ),
        );
      })),
    );
  }
}

class DrawerTiles extends StatelessWidget {
  const DrawerTiles({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
    );
  }
}
