// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ToDoModelAdapter extends TypeAdapter<ToDoModel> {
  @override
  final int typeId = 1;

  @override
  ToDoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ToDoModel(
      todoList: (fields[1] as List?)?.cast<TodoList>(),
    );
  }

  @override
  void write(BinaryWriter writer, ToDoModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.todoList);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToDoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoListAdapter extends TypeAdapter<TodoList> {
  @override
  final int typeId = 2;

  @override
  TodoList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TodoList(
      id: fields[1] as int?,
      task: fields[2] as String?,
      completed: fields[3] as bool?,
      dueDate: fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, TodoList obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.task)
      ..writeByte(3)
      ..write(obj.completed)
      ..writeByte(4)
      ..write(obj.dueDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
