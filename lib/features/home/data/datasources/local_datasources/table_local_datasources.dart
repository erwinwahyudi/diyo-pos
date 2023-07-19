import 'package:diyo_pos/features/home/data/models/table_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TableLocalDataSource {
  static const String _tableListKey = 'tableList';

  Future<List<Table>> getTableList() async {
    final prefs = await SharedPreferences.getInstance();
    final tableJsonList = prefs.getStringList(_tableListKey);

    if (tableJsonList == null || tableJsonList.isEmpty) {
      final dummyTableData = [
        Table(id: 1, name: 'Table 1', status: 'available'),
        Table(id: 2, name: 'Table 2', status: 'available'),
        Table(id: 3, name: 'Table 3', status: 'available'),
        Table(id: 4, name: 'Table 4', status: 'available'),
        Table(id: 5, name: 'Table 5', status: 'available'),
        Table(id: 6, name: 'Table 6', status: 'available'),
      ];
      final tableJsonList =
          dummyTableData.map((table) => json.encode(table.toJson())).toList();
      await prefs.setStringList(_tableListKey, tableJsonList);
      return dummyTableData;
    } else {
      final tableList = tableJsonList
          .map((json) => Table.fromJson(jsonDecode(json)))
          .toList();
      return tableList;
    }
  }

  Future<Table> getTableById(int id) async {
    final tableList = await getTableList();
    return tableList.firstWhere((table) => table.id == id);
  }

  Future<void> updateTableStatus(int tableId, String status) async {
    final prefs = await SharedPreferences.getInstance();
    final tableJsonList = prefs.getStringList(_tableListKey);
    if (tableJsonList != null) {
      final updatedTableList = tableJsonList.map((json) {
        final table = Table.fromJson(jsonDecode(json));
        if (table.id == tableId) {
          return table.copyWith(status: status);
        } else {
          return table;
        }
      }).toList();

      // Ubah data tabel yang telah diperbarui ke dalam bentuk List<String> JSON
      final updatedTableJsonList =
          updatedTableList.map((table) => json.encode(table.toJson())).toList();

      // Simpan kembali data tabel yang telah diperbarui ke dalam Shared Preferences
      await prefs.setStringList(_tableListKey, updatedTableJsonList);
    }
  }
}
