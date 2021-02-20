import 'package:ex3/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';
import '../models/todo_list_model.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  final Guid itemId;

  const EditPage({Key key, @required this.itemId}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  void _handleEditingComplete() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final todo = context.read<TodoListModel>().getById(widget.itemId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: EditingToDoItem(
        todoItem: todo,
        onEditingComplete: _handleEditingComplete,
      ),
    );
  }
}

class EditingToDoItem extends StatefulWidget {
  final Todo todoItem;
  final VoidCallback onEditingComplete;

  EditingToDoItem({Key key, this.todoItem, this.onEditingComplete}) : super(key: key);

  @override
  _EditingToDoItemState createState() => _EditingToDoItemState();
}

class _EditingToDoItemState extends State<EditingToDoItem> {
  Todo _todo;
  final _titleController = TextEditingController();

  @override
  void initState() {
    _todo = widget.todoItem ?? Todo("");
    _titleController.text = _todo.title;

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
          ),
          ElevatedButton(
            onPressed: () => _handleSubmittedItem(context),
            child: Text('Save'),
          )
        ],
      ),
    );
  }

  void _handleSubmittedItem(BuildContext context) {
    var item = new Todo(_titleController.text, id: _todo.id);
    context.read<TodoListModel>().update(item);
    widget.onEditingComplete();
  }
}
