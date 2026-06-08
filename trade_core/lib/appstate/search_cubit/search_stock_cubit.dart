import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_stock_state.dart';

class SearchStockCubit extends Cubit<SearchStockState> {
  SearchStockCubit() : super(SearchStockInitial());

  Timer? _searchDebounce;

  final List<String> allStocks = [
    "AAPL - Apple Inc.",
    "MSFT - Microsoft Corp.",
    "GOOGL - Alphabet Inc.",
    "AMZN - Amazon",
    "TSLA - Tesla",
    "NVDA - NVIDIA",
    "BTC - Bitcoin",
    "ETH - Ethereum",
  ];

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }

  void searchStock(String name) {
    final query = name.trim();

    _searchDebounce?.cancel();

    if (query.isEmpty) {
      emit(SearchStockInitial());
      return;
    }

    emit(SearchStockLoading());

    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      search(query);
    });
  }

  void search(String name) {
    final result = allStocks.where((stock) {
      return stock.toLowerCase().contains(name.toLowerCase());
    }).toList();

    emit(SearchStockLoaded(result));
  }
}
