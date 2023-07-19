// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_menu_bloc.dart';

@immutable
abstract class OrderMenuState {}

class OrderMenuInitial extends OrderMenuState {}

class OrderMenuLoading extends OrderMenuState {}

class OrderMenuLoaded extends OrderMenuState {
  final List<Menu> menuList;
  OrderMenuLoaded({
    required this.menuList,
  });
}

class OrderMenuError extends OrderMenuState {
  final String message;
  OrderMenuError({
    required this.message,
  });
}

class TableDataLoaded extends OrderMenuState {
  final Table table;
  TableDataLoaded({
    required this.table,
  });
}
