// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:diyo_pos/features/home/data/models/table_model.dart';
import 'package:diyo_pos/features/home/data/repositories/table_repository.dart';

part 'detail_table_event.dart';
part 'detail_table_state.dart';

class DetailTableBloc extends Bloc<DetailTableEvent, DetailTableState> {
  final TableRepository tableRepository;
  DetailTableBloc(
    this.tableRepository,
  ) : super(DetailTableInitial()) {
    on<ShowDetailTable>((event, emit) async {
      emit(DetailTableLoading());
      final result = await tableRepository.getTableById(event.id);
      result.fold((error) {
        emit(DetailTableError(message: error));
      }, (table) {
        emit(DetailTableLoaded(table: table));
      });
    });

    on<ChangeStatusTable>((event, emit) async {
      emit(DetailTableLoading());
      final result = await tableRepository.getTableById(event.id);
      result.fold((error) {
        emit(DetailTableError(message: error));
      }, (table) {
        emit(DetailTableLoaded(table: table));
      });
    });
  }
}
