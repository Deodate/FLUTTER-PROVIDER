import 'package:flutter/material.dart';
import 'package:flutter_data_mgnt/Screens/home_page.dart';
import 'package:flutter_data_mgnt/provider/todo_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => TodoProvider(),
    child: const MaterialApp(
      home: HomePage(),
    ),
    );
  }
}
