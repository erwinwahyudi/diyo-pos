// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:diyo_pos/features/home/data/models/table_model.dart';
import 'package:diyo_pos/features/home/data/repositories/table_repository.dart';
import 'package:diyo_pos/features/order/data/models/menu_model.dart';
import 'package:diyo_pos/features/order/data/repositories/menu_repository.dart';

part 'order_menu_event.dart';
part 'order_menu_state.dart';

class OrderMenuBloc extends Bloc<OrderMenuEvent, OrderMenuState> {
  final MenuRepository menuRepository;
  final TableRepository tableRepository;
  OrderMenuBloc(
    this.menuRepository,
    this.tableRepository,
  ) : super(OrderMenuInitial()) {
    on<LoadMenuData>((event, emit) async {
      final result = await menuRepository.getMenu();
      result.fold((error) {
        emit(OrderMenuError(message: error));
      }, (menuList) {
        emit(OrderMenuLoaded(menuList: menuList));
      });
    });

    on<GetTableData>((event, emit) async {
      final result = await tableRepository.getTableById(event.id);
      result.fold((error) {
        emit(OrderMenuError(message: error));
      }, (tableData) {
        emit(TableDataLoaded(table: tableData));
      });
    });
  }
}
