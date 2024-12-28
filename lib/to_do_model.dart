// To parse this JSON data, do
//
//     final toDoModel = toDoModelFromJson(jsonString);

import 'package:hive/hive.dart';
import 'dart:convert';

part 'to_do_model.g.dart';

ToDoModel toDoModelFromJson(String str) => ToDoModel.fromJson(json.decode(str));

String toDoModelToJson(ToDoModel data) => json.encode(data.toJson());

@HiveType(typeId: 1)
class ToDoModel {
  @HiveField(1)
  List<TodoList>? todoList;

  ToDoModel({
    this.todoList,
  });

  factory ToDoModel.fromJson(Map<String, dynamic> json) => ToDoModel(
        todoList: json["todoList"] == null
            ? []
            : List<TodoList>.from(
                json["todoList"]!.map((x) => TodoList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "todoList": todoList == null
            ? []
            : List<dynamic>.from(todoList!.map((x) => x.toJson())),
      };
}

@HiveType(typeId: 2)
class TodoList {
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? task;
  @HiveField(3)
  bool? completed;
  @HiveField(4)
  DateTime? dueDate;

  TodoList({
    this.id,
    this.task,
    this.completed,
    this.dueDate,
  });

  factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
        id: json["id"],
        task: json["task"],
        completed: json["completed"],
        dueDate:
            json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "task": task,
        "completed": completed,
        "dueDate":
            "${dueDate!.year.toString().padLeft(4, '0')}-${dueDate!.month.toString().padLeft(2, '0')}-${dueDate!.day.toString().padLeft(2, '0')}",
      };
}
