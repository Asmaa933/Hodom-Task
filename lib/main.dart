import 'package:flutter/material.dart';
import 'package:hodom_task/Views/WelcomeView.dart';

import 'Views/HomeView.dart';
import 'Views/LoginView.dart';

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
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: WelcomeView(),
        routes: {
          ScreenRoutes.welcomeView: (_) => WelcomeView(),
          ScreenRoutes.loginView: (_) => LoginView(),
          ScreenRoutes.homeView: (_) => HomeView(),
        });
  }
}

class ScreenRoutes {
  static const String welcomeView = '/WelcomeView';
  static const String loginView = '/loginView';
  static const String homeView = '/homeView';
}
