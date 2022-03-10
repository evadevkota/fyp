import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 20, 0),
      child: Column(children: <Widget>[
        const ListTile(
          contentPadding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/home.png',
            color: const Color.fromRGBO(53, 6, 102, 1),
            height: 30,
          ),
          onTap: () {},
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'Notification',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/notification.png',
            color: const Color.fromRGBO(53, 6, 102, 1),
            height: 30,
          ),
          onTap: () {},
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'Profile',
            style: TextStyle(fontSize: 20),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/user.png',
            color: const Color.fromRGBO(53, 6, 102, 1),
            height: 30,
          ),
          onTap: () {},
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
          title: const Text(
            'About us',
            style: TextStyle(fontSize: 20),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/information-button.png',
            color: const Color.fromRGBO(53, 6, 102, 1),
            height: 30,
          ),
          onTap: () {},
        ),
        ListTile(
          contentPadding: const EdgeInsets.fromLTRB(20, 150, 0, 0),
          title: const Text(
            'log Out',
            style: TextStyle(fontSize: 20),
          ),
          hoverColor: const Color.fromRGBO(194, 236, 255, 1),
          leading: Image.asset(
            'images/logout.png',
            color: const Color.fromRGBO(53, 6, 102, 1),
            height: 30,
          ),
          onTap: () {},
        ),
      ]),
    ));
  }
}
