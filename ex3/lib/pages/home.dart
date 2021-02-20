import 'package:ex3/models/todo.dart';
import 'package:ex3/models/todo_list_model.dart';
import 'package:ex3/widgets/todo_header.dart';
import 'package:ex3/widgets/todo_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isAdding = false;
  String _mode = "Group";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          PopupMenuButton(
            onSelected: _handleClick,
            itemBuilder: (context) {
              return {'Group', 'All'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SafeArea(
        child: Consumer<TodoListModel>(
          builder: (context, todoList, widget) {
            return CustomScrollView(
              slivers: _mode == 'Group' ? _buildSliversByStatus(todoList) : _buildMixSlivers(todoList),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: !_isAdding,
        child: FloatingActionButton(
          onPressed: () => _add(context),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  List<Widget> _buildSliversByStatus(TodoListModel todoList) {
    final slivers = List<Widget>();

    slivers.add(TodoHeader('To do'));
    slivers.add(TodoListItem(
      items: todoList.whereTodo(),
      isAdding: _isAdding,
      onAddingComplete: _handleAddingComplete,
    ));

    var doneList = todoList.whereDone();
    if (doneList.length > 0) {
      slivers.add(TodoHeader('Completed'));
      slivers.add(TodoListItem(items: todoList.whereDone()));
    }

    return slivers;
  }

  List<Widget> _buildMixSlivers(TodoListModel todoList) {
    final slivers = List<Widget>();

    slivers.add(TodoListItem(
      items: todoList.items,
      isAdding: _isAdding,
      onAddingComplete: _handleAddingComplete,
    ));

    return slivers;
  }

  void _add(BuildContext context) {
    setState(() {
      _isAdding = true;
      var todo = Todo('');
      context.read<TodoListModel>().insert(todo);
    });
  }

  void _handleAddingComplete() {
    setState(() {
      _isAdding = false;
    });
  }

  void _handleClick(String value) {
    setState(() {
      _mode = value;
    });
  }
}
