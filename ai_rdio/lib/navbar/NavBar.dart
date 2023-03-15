import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screen/RegLoginUi.dart';

class NavBar extends StatefulWidget {
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Gymmate',
              style: TextStyle(
                  color: Color.fromARGB(255, 3, 3, 3),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(
              'gymatian.com',
              style:
                  TextStyle(color: Color.fromARGB(255, 7, 7, 7), fontSize: 15),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'asset/images/logo.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(132, 160, 104, 239),
                image: DecorationImage(
                  image: AssetImage(
                    'asset/images/',
                  ),
                  fit: BoxFit.cover,
                )),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorite'),
            onTap: () => print('Fav'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Info'),
            onTap: () => print('info'),
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Friends'),
            onTap: () => print('f'),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => print('share'),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => print('notifications'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => print('settings'),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => print('Policies'),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove('Verified');
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegLoginUi()));
            },
          ),
        ],
      ),
    );
  }
}
