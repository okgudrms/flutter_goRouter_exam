import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class CustomNavigationObserver extends FirebaseAnalyticsObserver {
  CustomNavigationObserver({required super.analytics});

  @override
  void didPush(Route route, Route? previousRoute) {
    final String? screenName = nameExtractor(route.settings);
    print("didPush : $screenName");

    print(route.settings.arguments);

    if (screenName == 'path_parm/:id' || screenName == ':name') {
      print("넘어갑니다");
      return;
    }
    print("끝이냐");
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    final String? screenName = nameExtractor(previousRoute!.settings);
    print("didPop : $screenName");
    print(route.settings);
    if (screenName == 'path_parm/:id') {
      print("넘어갑니다");
      return;
    }
    print("끝이냐");
    super.didPop(route, previousRoute);
  }
}
