part of 'detail_table_bloc.dart';

@immutable
abstract class DetailTableState {}

class DetailTableInitial extends DetailTableState {}

class DetailTableLoading extends DetailTableState {}

class DetailTableLoaded extends DetailTableState {
  final Table table;
  DetailTableLoaded({
    required this.table,
  });
}

class DetailTableError extends DetailTableState {
  final String message;
  DetailTableError({
    required this.message,
  });
}
