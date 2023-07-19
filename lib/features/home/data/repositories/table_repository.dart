// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:diyo_pos/features/home/data/datasources/local_datasources/table_local_datasources.dart';
import 'package:diyo_pos/features/home/data/models/table_model.dart';

class TableRepository {
  final TableLocalDataSource tableLocalDataSource;
  TableRepository({
    required this.tableLocalDataSource,
  });

  Future<Either<String, List<Table>>> getTableList() async {
    try {
      final tableList = await tableLocalDataSource.getTableList();
      return Right(tableList);
    } catch (e) {
      return const Left('Failed to get table list');
    }
  }

  Future<Either<String, Table>> getTableById(int id) async {
    try {
      final table = await tableLocalDataSource.getTableById(id);
      return Right(table);
    } catch (e) {
      return const Left('Failed to get table');
    }
  }

  Future<Either<String, List<Table>>> printQR(int id, String status) async {
    try {
      await tableLocalDataSource.updateTableStatus(id, status);
      final getTableList = await tableLocalDataSource.getTableList();
      return Right(getTableList);
    } catch (e) {
      return const Left('Failed to update table status');
    }
  }
}
