import 'package:flutter_guid/flutter_guid.dart';

class Todo {
  Guid _id;
  String _title;
  ToDoStatus _status;

  Todo(this._title, {Guid id, ToDoStatus status})
      : this._id = id ?? Guid.newGuid,
        this._status = status ?? ToDoStatus.todo;

  Guid get id => _id;

  String get title => _title;

  ToDoStatus get status => _status;

  bool get isCompleted => _status == ToDoStatus.done;

  void setDone() {
    _status = ToDoStatus.done;
  }

  void setTodo() {
    _status = ToDoStatus.todo;
  }

  Todo.fromJson(Map<String, dynamic> json)
      : _id = Guid(json['id']),
        _title = json['title'];

  Map<String, dynamic> toJson() => {'id': _id.toString(), 'title': _title};

  void setTitle(String title) {
    _title = title;
  }
}

enum ToDoStatus { todo, done, archived }
