part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {}

class HomeError extends HomeState {
  final String message;
  HomeError({
    required this.message,
  });
}

class HomeTableLoaded extends HomeState {
  final List<Table> tableList;

  HomeTableLoaded({required this.tableList});
}
