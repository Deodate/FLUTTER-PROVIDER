import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    });
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider API'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {  // Changed 'value' to 'todoProvider'
           if (value.isLoading){
            return const Center(
              child: CircularProgressIndicator(),
            );
           }
           final todos = value.todos;
           return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index){
                final todo = todos[index];
              return ListTile(
                leading: CircleAvatar(
                  child: Text(todo.id.toString()),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    color: todo.completed ? Colors.black : Colors.blue,
                  ),
                  ),
              );
            }
           );
        
         }
      ),
       
    );
  }
}