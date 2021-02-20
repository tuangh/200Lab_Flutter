import 'package:ex3/models/todo.dart';
import 'package:ex3/models/todo_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import 'package:provider/provider.dart';

class TodoItemTile extends StatefulWidget {
  final Todo item;

  const TodoItemTile({Key key, @required this.item}) : super(key: key);

  @override
  _TodoItemTileState createState() => _TodoItemTileState();
}

class _TodoItemTileState extends State<TodoItemTile> {
  bool _isCompleted;
  bool _isDirty = false;

  @override
  void initState() {
    _isCompleted ??= widget.item.isCompleted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _executeAfterBuild(context));

    return Card(
      child: CheckboxListTile(
        value: _isCompleted,
        onChanged: (isChecked) {
          _toggleTodo(context, widget.item, isChecked);
        },
        title: Text(
          widget.item.title,
          style: TextStyle(
            fontWeight: _isCompleted ? FontWeight.w200 : FontWeight.w500,
            decoration:
                _isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
        secondary: IconButton(
          icon: Icon(Icons.navigate_next),
          iconSize: 16.0,
          onPressed: () => _edit(context, widget.item.id),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  _toggleTodo(BuildContext context, Todo item, bool isChecked) {
    setState(() {
      _isCompleted = isChecked;
      _isDirty = true;
    });
  }

  _edit(BuildContext context, Guid itemId) {
    Navigator.pushNamed(context, '/edit', arguments: itemId);
  }

  _executeAfterBuild(BuildContext context) {
    if (_isDirty) {
      print('hello');
      Future.delayed(const Duration(milliseconds: 1000), () {
        _isCompleted ? widget.item.setDone() : widget.item.setTodo();
        var todoList = context.read<TodoListModel>();
        todoList.update(widget.item);

        setState(() {
          _isDirty = false;
        });
      });
    }
  }
}
