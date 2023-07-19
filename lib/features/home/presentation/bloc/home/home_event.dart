part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadTableData extends HomeEvent {}

class PrintQR extends LoadTableData {
  final int id;
  PrintQR({
    required this.id,
  });
}
