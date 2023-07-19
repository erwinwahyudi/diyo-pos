// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_menu_bloc.dart';

@immutable
abstract class OrderMenuEvent {}

class LoadMenuData extends OrderMenuEvent {}

class GetTableData extends OrderMenuEvent {
  final int id;
  GetTableData({
    required this.id,
  });
}
