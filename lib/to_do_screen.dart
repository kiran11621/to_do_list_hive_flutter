import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database_session_management/to_do_model.dart';
import 'package:hive_database_session_management/to_do_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  late ToDoProvider _toDoProvider;

  late Box<ToDoModel> toDoModelBox;

  @override
  void initState() {
    super.initState();

    _toDoProvider = Provider.of<ToDoProvider>(
      context,
      listen: false,
    );

    toDoModelBox = Hive.box<ToDoModel>('todo');
    _toDoProvider.toDoResponse = toDoModelBox.get('ToDoApiResponse');
    _toDoProvider.fetchToDoList();
  }

  @override
  Widget build(BuildContext context) {
    _toDoProvider = Provider.of<ToDoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
        backgroundColor: const Color.fromARGB(255, 247, 210, 253),
      ),
      body: ListView.builder(
        itemCount: _toDoProvider.toDoResponse?.todoList?.length ?? 0,
        itemBuilder: (context, i) => Card(
          margin: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:
                  (_toDoProvider.toDoResponse?.todoList?[i].completed ?? false)
                      ? Colors.greenAccent
                      : Colors.redAccent,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      _toDoProvider.toDoResponse?.todoList?[i].task ?? "",
                    ),
                  ),
                  if (!(_toDoProvider.toDoResponse?.todoList?[i].completed ??
                      false))
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.right,
                        DateFormat('dd/MM/yyy')
                            .format(_toDoProvider
                                .toDoResponse!.todoList![i].dueDate!)
                            .toString(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
