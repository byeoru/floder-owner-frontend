import 'dart:convert';
import 'dart:io';

import 'package:floder_owner/features/store/models/menu_list_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class MenuRepository {
  Future<List<MenuListModel>> getMenus() async {
    final response = await http.get(
      Uri.http("192.168.1.2:8080", "/restaurants/1/foods"),
    );
    if (response.statusCode == HttpStatus.ok) {
      final jsonMap =
          jsonDecode(utf8.decode(response.bodyBytes)) as List<dynamic>;
      return jsonMap.map((food) => MenuListModel.fromJson(food)).toList();
    } else {
      throw Exception("api error");
    }
  }
}

final menuRepository = Provider((ref) => MenuRepository());
