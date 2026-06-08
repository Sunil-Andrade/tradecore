import 'package:flutter/material.dart';

class StockDetails extends StatelessWidget {
  const StockDetails({super.key, required this.stockName});

  final String stockName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT SECTION
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.arrow_back, size: 18),
                        SizedBox(width: 8),
                        Text("Back to Market"),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      const CircleAvatar(child: Icon(Icons.apple)),

                      const SizedBox(width: 12),

                      Text(
                        stockName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),

                      const Spacer(),

                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "\$173.50",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 36,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "+1.25 (0.72%)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                    ),
                    child: const Center(child: Text("Chart Area")),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      _InfoBox(title: "Market Cap", value: "2.71T"),
                      const SizedBox(width: 12),
                      _InfoBox(title: "Volume", value: "52.4M"),
                      const SizedBox(width: 12),
                      _InfoBox(title: "P/E Ratio", value: "28.45"),
                      const SizedBox(width: 12),
                      _InfoBox(title: "52W High", value: "198.23"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(width: 24),

            // RIGHT SECTION
            SizedBox(
              width: 300,
              child: Column(
                children: [
                  Container(
                    height: 260,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                    ),
                    child: const Center(child: Text("Buy / Sell Panel")),
                  ),

                  const SizedBox(height: 20),

                  Container(
                    height: 260,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey.shade300),
                    ),
                    child: const Center(child: Text("Order Book")),
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

class _InfoBox extends StatelessWidget {
  const _InfoBox({required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
