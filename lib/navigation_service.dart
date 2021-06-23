import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigationService._();

  static final NavigationService _instance = NavigationService._();

  factory NavigationService() {
    return _instance;
  }

  NavigatorState get navigator => navigatorKey.currentState!;
}
