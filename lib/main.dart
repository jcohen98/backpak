import 'package:flutter/material.dart';

import './pages/home_screen.dart';
import './pages/rgb_screen.dart';
import './pages/emergency_screen.dart';
import './pages/reset_password.dart';
import './pages/map_screen.dart';
import './custom_route.dart';

void main() {
  String apiKey = "AIzaSyC-ztBAvgn3NpXC0OVM9KLdCPVgBgWPkrQ";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pak Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return new MyCustomRoute(
              builder: (_) => new MyHomePage(),
              settings: settings,
            );
          case '/rgbscreen':
            return new MyCustomRoute(
              builder: (_) => new RgbScreen(),
              settings: settings,
            );
          case '/emergency':
            return new MyCustomRoute(
              builder: (_) => new EmergencyScreen(),
              settings: settings,
            );
          case '/reset':
            return new MyCustomRoute(
              builder: (_) => new ResetPasswordScreen(),
              settings: settings,
            );
          case '/map':
            return new MyCustomRoute(
              builder: (_) => new MapScreen(),
              settings: settings,
            );
          default:
            return new MyCustomRoute(
              builder: (_) => new MyHomePage(),
              settings: settings,
            );
        }
      },
    );
  }
}
