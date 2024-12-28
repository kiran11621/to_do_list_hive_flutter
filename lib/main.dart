import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_database_session_management/to_do_model.dart';
import 'package:hive_database_session_management/to_do_provider.dart';
import 'package:hive_database_session_management/to_do_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ToDoModelAdapter());
  await Hive.openBox<ToDoModel>('todo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ToDoProvider>(
          create: (_) => ToDoProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'To Do',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ToDoScreen(),
      ),
    );
  }
}
