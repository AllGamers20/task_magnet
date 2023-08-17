import 'package:flutter/material.dart';
import 'package:taskmagnet/Constant/color.dart';
import 'package:taskmagnet/Constant/controller.dart';
import 'package:taskmagnet/Widgets/about_us.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Todo {
  final String title;
  bool isDone;

  Todo({
    required this.title,
    this.isDone = false,
  });
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? todoStrings = prefs.getStringList('todos');

    if (todoStrings != null) {
      setState(() {
        todos = todoStrings.map((todo) => Todo(title: todo)).toList();
      });
    }
  }

  void _saveTodos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todoStrings = todos.map((todo) => todo.title).toList();
    prefs.setStringList('todos', todoStrings);
  }

  void _addTodo() {
    if (txt.text.isNotEmpty) {
      setState(() {
        todos.add(Todo(title: txt.text));
        txt.clear();
        _saveTodos();
      });
    }
  }

  void _toggleTodoStatus(int index) {
    setState(() {
      todos[index].isDone = !todos[index].isDone;
      _saveTodos();
    });
  }

  void _removeTodo(int index) {
    setState(() {
      todos.removeAt(index);
      _saveTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List',
            style: TextStyle(
              color: scolor,
            )),
        actions: [
          IconButton(
            onPressed: () {
              about_us(context);
            },
            icon: const Icon(
              Icons.account_circle,
              size: 30,
              color: scolor,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  leading: Checkbox(
                    value: todos[index].isDone,
                    onChanged: (_) => _toggleTodoStatus(index),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => _removeTodo(index),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txt,
                    decoration: const InputDecoration(labelText: 'Add a task'),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: pcolor,
                  onPressed: _addTodo,
                  child: const Icon(Icons.add, color: scolor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
