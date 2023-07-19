import 'dart:convert';

import 'package:diyo_pos/features/order/data/models/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuLocalDataSource {
  static const _menuListKey = 'menuList';

  Future<List<Menu>> getMenuList() async {
    final prefs = await SharedPreferences.getInstance();
    final menuJsonList = prefs.getStringList(_menuListKey);

    if (menuJsonList == null || menuJsonList.isEmpty) {
      final dummyMenuData = [
        Menu(id: 1, name: 'Menu 1', price: 10000.0),
        Menu(id: 2, name: 'Menu 2', price: 15000.0),
        Menu(id: 3, name: 'Menu 3', price: 8000.0),
        Menu(id: 4, name: 'Menu 4', price: 12000.0),
        Menu(id: 5, name: 'Menu 5', price: 20000.0),
        Menu(id: 6, name: 'Menu 6', price: 18000.0),
        Menu(id: 7, name: 'Menu 7', price: 9000.0),
        Menu(id: 8, name: 'Menu 8', price: 11000.0),
        Menu(id: 9, name: 'Menu 9', price: 17000.0),
      ];
      final menuJsonList =
          dummyMenuData.map((menu) => json.encode(menu.toJson())).toList();
      await prefs.setStringList(_menuListKey, menuJsonList);
      return dummyMenuData;
    } else {
      final menuList =
          menuJsonList.map((json) => Menu.fromJson(jsonDecode(json))).toList();
      return menuList;
    }
  }

  Future<Menu> getMenuById(int id) async {
    final menuList = await getMenuList();
    return menuList.firstWhere((menu) => menu.id == id);
  }
}
