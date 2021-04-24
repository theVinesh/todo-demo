import 'package:flutter/material.dart';
import 'package:todo_demo/create_dialog.dart';
import 'package:todo_demo/todo_model.dart';

class TodoListPage extends StatefulWidget {
  final List<TodoModel> todos = [
    TodoModel(title: "First task", isDone: false),
    TodoModel(title: "Second task", isDone: true),
    TodoModel(title: "Third task"),
    TodoModel(),
  ];

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
      ),
      body: ListView.builder(
        itemCount: widget.todos.length,
        itemBuilder: (_, int index) {
          final todo = widget.todos[index];
          return Dismissible(
            key: Key(todo.hashCode.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: const EdgeInsets.only(right: 16.0),
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(Icons.delete_forever),
            ),
            onDismissed: (_) => _deleteTodo(todo),
            child: ListTile(
              title: Text(todo.title),
              leading: Checkbox(
                value: todo.isDone,
                onChanged: (bool value) {
                  setState(() {
                    todo.isDone = value;
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewTodo(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _createNewTodo(BuildContext context) async {
    final String title =
        await showDialog(context: context, builder: (_) => CreateDialog());
    if (title?.isNotEmpty == true) {
      setState(() {
        widget.todos.add(TodoModel(title: title));
      });
    }
  }

  void _deleteTodo(TodoModel todoToBeDeleted) {
    setState(() {
      widget.todos.remove(todoToBeDeleted);
    });
  }
}
