// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_table_bloc.dart';

@immutable
abstract class DetailTableEvent {}

class ShowDetailTable extends DetailTableEvent {
  final int id;
  ShowDetailTable({
    required this.id,
  });
}

class ChangeStatusTable extends DetailTableEvent {
  final int id;
  ChangeStatusTable({
    required this.id,
  });
}
