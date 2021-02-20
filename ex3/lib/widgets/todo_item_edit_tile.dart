import 'package:ex3/models/todo.dart';
import 'package:ex3/models/todo_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoItemEditTile extends StatefulWidget {
  final Todo item;
  final VoidCallback onEditingComplete;

  const TodoItemEditTile({Key key, @required this.item, @required this.onEditingComplete}) : super(key: key);

  @override
  _TodoItemEditTileState createState() => _TodoItemEditTileState();
}

class _TodoItemEditTileState extends State<TodoItemEditTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        value: widget.item.isCompleted,
        onChanged: (isChecked) {
          _toggleTodo(context, widget.item, isChecked);
        },
        title: TextFormField(
          initialValue: widget.item.title,
          autofocus: true,
          style: TextStyle(
            decoration: widget.item.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
          onFieldSubmitted: (text) {
            _handleSubmittedItem(context, new Todo(text, id: widget.item.id));
            widget.onEditingComplete();
          },
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  void _toggleTodo(BuildContext context, Todo item, bool isChecked) {
    isChecked ? item.setDone() : item.setTodo();
    var todoList = context.read<TodoListModel>();
    todoList.update(item);
  }

  void _handleSubmittedItem(BuildContext context, Todo item) {
    context.read<TodoListModel>().update(item);
  }
}
