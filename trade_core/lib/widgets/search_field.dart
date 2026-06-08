import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_core/appstate/search_cubit/search_stock_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: const InputDecoration(
            hintText: "Search stock...",
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            context.read<SearchStockCubit>().searchStock(value);
          },
        ),

        BlocBuilder<SearchStockCubit, SearchStockState>(
          builder: (context, state) {
            if (state is SearchStockLoading) {
              return const Padding(
                padding: EdgeInsets.all(12),
                child: CircularProgressIndicator(),
              );
            }

            if (state is SearchStockLoaded) {
              if (state.stocks.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.all(12),
                  child: Text("No stocks found"),
                );
              }

              return Container(
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.stocks.length,
                  itemBuilder: (context, index) {
                    final stock = state.stocks[index];

                    return ListTile(
                      title: Text(stock),
                      onTap: () {
                        print("Selected: $stock");
                      },
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
