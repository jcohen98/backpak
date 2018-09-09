import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 34.0),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              border: Border.all(
                color: Colors.black38,
                width: 2.0,
              ),
            ),
          ),
          ListTile(
            title: Text(
              'Home',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            trailing: Icon(Icons.home),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: Text(
              'RGB Picker',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            trailing: Icon(Icons.color_lens),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/rgbscreen');
            },
          ),
          ListTile(
            title: Text(
              'Map',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            trailing: Icon(Icons.my_location),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/map');
            },
          ),
          ListTile(
            title: Text(
              'Emergency Settings',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            trailing: Icon(Icons.assignment_late),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/emergency');
            },
          ),
          ListTile(
            title: Text(
              'Reset Password',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            trailing: Icon(Icons.restore),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/reset');
            },
          ),
        ],
      ),
    );
  }
}
