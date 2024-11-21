import 'package:base/navigation/app_routes.dart';
import 'package:flutter/material.dart';

import '../screens/test_screen.dart';

_createRoute(Widget page){
  return MaterialPageRoute(builder: (context) => page);
}

Route generateRoute (settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return _createRoute(SizedBox());
    case AppRoutes.main:
      return _createRoute(SizedBox());
    default:
      return _createRoute(TestScreen());
  }
}