import 'package:flutter/material.dart';
import 'package:trade_core/screens/markets_screen.dart';

class MarketNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const MarketNavigator({super.key, required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => const MarketsScreen());
      },
    );
  }
}
