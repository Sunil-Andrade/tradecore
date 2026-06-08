import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_core/appstate/search_cubit/search_stock_cubit.dart';
import 'package:trade_core/screens/dashboard_screen.dart';
import 'package:trade_core/screens/stock_details.dart';
import 'package:trade_core/widgets/search_field.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Market Expolorer",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            SizedBox(height: 20),
            SearchField(),

            SizedBox(height: 30),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    "Popular",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    "Live Price",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 90,
                  child: Text(
                    "Change",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const Divider(),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (builder) => StockDetails(stockName: "Apple INC"),
                  ),
                );
              },
              child: Row(
                children: const [
                  Expanded(child: Text("AAPL  Apple Inc.")),
                  SizedBox(width: 120, child: Text("\$173.50")),
                  SizedBox(
                    width: 90,
                    child: Text(
                      "+0.72%",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
