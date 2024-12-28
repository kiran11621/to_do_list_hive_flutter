import 'package:flutter/material.dart';
import 'package:hive_database_session_management/to_do_model.dart';
import 'package:http/http.dart' as http;

class ToDoProvider extends ChangeNotifier {
  ToDoModel? toDoResponse;

  Future<void> fetchToDoList() async {
    try {
      final response = await http.get(Uri.parse(
          "https://mocki.io/v1/48e7f378-9689-48a5-a5d0-b353048a2270"));

      if (response.statusCode == 200) {
        toDoResponse = toDoModelFromJson(response.body);
      }
    } catch (e) {
      print('Something went wrong $e');
    }

    notifyListeners();
  }
}
