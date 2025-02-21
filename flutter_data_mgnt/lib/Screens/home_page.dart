import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';
// Make sure to import your TodoProvider

class HomePage extends StatefulWidget {  // Changed to StatefulWidget
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override  // Added @override
  void initState() {
    super.initState();  // Moved super.initState() inside initState
    
    // Wrap Provider call in a Future to avoid calling build context in initState
    Future.microtask(() {
      Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
      ),
    );
  }
}