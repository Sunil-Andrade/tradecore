import 'package:flutter/material.dart';
import 'package:trade_core/screens/dashboard_screen.dart';
import 'package:trade_core/screens/history_screen.dart';
import 'package:trade_core/screens/portfolio_screen.dart';
import 'package:trade_core/widgets/market_navigator.dart' show MarketNavigator;
import 'package:trade_core/widgets/nav_button.dart' show NavButton;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final GlobalKey<NavigatorState> contentNavigatorKey =
      GlobalKey<NavigatorState>();

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget getCurrentPage() {
    if (selectedIndex == 0) {
      return const DashboardScreen();
    } else if (selectedIndex == 1) {
      return MarketNavigator(navigatorKey: contentNavigatorKey);
    } else if (selectedIndex == 2) {
      return const PortfolioScreen();
    } else {
      return const HistoryScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TradeCore"),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(height: 2, color: Colors.grey[300]),
        ),
      ),
      body: Row(
        children: [
          Container(
            width: 220,
            decoration: BoxDecoration(
              color: const Color.fromARGB(154, 229, 229, 229),
              border: BoxBorder.fromLTRB(
                right: BorderSide(width: 2, color: Colors.grey[300]!),
              ),
            ),
            child: Column(
              children: [
                NavButton(
                  isClicked: selectedIndex == 0,
                  iconData: Icons.dashboard,
                  label: "Dashboard",
                  fun: () => changePage(0),
                ),
                NavButton(
                  isClicked: selectedIndex == 1,
                  iconData: Icons.trending_up,
                  label: "Market",
                  fun: () => changePage(1),
                ),
                NavButton(
                  isClicked: selectedIndex == 2,
                  iconData: Icons.account_balance,
                  label: "Portfolio",
                  fun: () => changePage(2),
                ),
                NavButton(
                  isClicked: selectedIndex == 3,
                  iconData: Icons.history,
                  label: "History",
                  fun: () => changePage(3),
                ),
              ],
            ),
          ),

          Expanded(child: getCurrentPage()),
        ],
      ),
    );
  }
}
