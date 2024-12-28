import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database_session_management/to_do_model.dart';
import 'package:http/http.dart' as http;

class ToDoProvider extends ChangeNotifier {
  ToDoModel? toDoResponse;
  // Hive Variables
  Box<ToDoModel>? toDoModelBox;

  Future<void> fetchToDoList() async {
    try {
      toDoModelBox = Hive.box<ToDoModel>('todo');

      final response = await http.get(Uri.parse(
          "https://mocki.io/v1/48e7f378-9689-48a5-a5d0-b353048a2270"));

      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);
        toDoResponse = toDoModelFromJson(response.body);
        print(toDoResponse?.todoList?[0].toJson());
        toDoModelBox!.put('ToDoApiResponse', toDoResponse ?? ToDoModel());
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      print('Something went wrong1 $e');
    }

    notifyListeners();
  }
}
