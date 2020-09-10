import 'package:flutter/material.dart';
import 'package:hodom_task/LoginView.dart';
import 'package:hodom_task/WelcomeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hodom',
        home: WelcomeView(),
        routes: {
          ScreenRoutes.welcomeView: (_) => WelcomeView(),
          ScreenRoutes.loginView: (_) => LoginView(),
        });
  }
}

class ScreenRoutes {
  static const String welcomeView = '/WelcomeView';
  static const String loginView = '/loginView';
}
