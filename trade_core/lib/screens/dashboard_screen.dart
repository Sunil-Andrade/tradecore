import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Market Overview",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),

              const SizedBox(height: 20),

              Container(
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: DataTable(
                  
                  headingRowColor: WidgetStateProperty.all(
                    Colors.grey.shade100,
                  ),
                  columns: const [
                    DataColumn(label: Text("Symbol")),
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Price")),
                    DataColumn(label: Text("Change %")),
                    DataColumn(label: Text("Market Cap")),
                  ],
                  rows: const [
                    DataRow(
                      cells: [
                        DataCell(Text("AAPL")),
                        DataCell(Text("Apple Inc.")),
                        DataCell(Text("\$173.50")),
                        DataCell(Text("+0.72%")),
                        DataCell(Text("2.71T")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
