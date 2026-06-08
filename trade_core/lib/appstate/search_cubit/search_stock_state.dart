part of 'search_stock_cubit.dart';

@immutable
sealed class SearchStockState {}

final class SearchStockInitial extends SearchStockState {}

final class SearchStockLoading extends SearchStockState {}

final class SearchStockLoaded extends SearchStockState {
  final List<String> stocks;

  SearchStockLoaded(this.stocks);
}

final class SearchStockError extends SearchStockState {
  final String message;

  SearchStockError(this.message);
}
