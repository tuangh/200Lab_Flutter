import 'todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guid/flutter_guid.dart';

class TodoListModel extends ChangeNotifier {
  final _items = List<Todo>();

  TodoListModel() {
    var testData = List<Todo>();
    testData.add(Todo('It is a long established'));
    testData.add(Todo('The point of using Lorem'));
    testData.add(Todo('Many desktop publishing packages'));

    _items.addAll(testData);
  }

  List<Todo> get items => _items.toList();

  Todo getById(Guid id) {
    return _items.firstWhere((element) => element.id == id);
  }

  void add(Todo item) {
    _items.add(item);
    notifyListeners();
  }

  void insert(Todo item) {
    _items.insert(0, item);
    notifyListeners();
  }

  void remove(Todo item) {
    _items.removeWhere((element) => element.id == item.id);
    notifyListeners();
  }

  void update(Todo item) {
    var savedItem = getById(item.id);
    savedItem.setTitle(item.title);
    notifyListeners();
  }

  List<Todo> whereTodo() {
    return _items.where((element) => element.status == ToDoStatus.todo).toList();
  }

  List<Todo> whereDone() {
    return _items.where((element) => element.status == ToDoStatus.done).toList();
  }
}

