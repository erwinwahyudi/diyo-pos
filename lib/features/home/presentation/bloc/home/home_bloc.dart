// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:diyo_pos/features/home/data/models/table_model.dart';
import 'package:diyo_pos/features/home/data/repositories/table_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TableRepository tableRepository;
  HomeBloc(
    this.tableRepository,
  ) : super(HomeInitial()) {
    on<LoadTableData>((event, emit) async {
      final result = await tableRepository.getTableList();
      emit(HomeLoading());
      result.fold((error) {
        emit(HomeError(message: error));
      }, (tableList) {
        emit(HomeTableLoaded(tableList: tableList));
      });
    });

    on<PrintQR>((event, emit) async {
      final result = await tableRepository.printQR(event.id, 'seated');
      emit(HomeLoading());
      result.fold((error) {
        emit(HomeError(message: error));
      }, (updatedTableList) async {
        emit(HomeTableLoaded(tableList: updatedTableList));
      });
    });
  }
}
