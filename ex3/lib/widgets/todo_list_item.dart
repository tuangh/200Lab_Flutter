import 'package:ex3/models/todo.dart';
import 'package:ex3/widgets/todo_item_edit_tile.dart';
import 'package:ex3/widgets/todo_item_tile.dart';
import 'package:flutter/material.dart';

class TodoListItem extends StatelessWidget {
  final List<Todo> items;
  final bool isAdding;
  final VoidCallback onAddingComplete;

  const TodoListItem({
    Key key,
    @required this.items,
    bool isAdding,
    this.onAddingComplete,
  }) : this.isAdding = isAdding ?? false;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return _buildRow(items[index], index);
        },
        childCount: items.length,
      ),
    );
  }

  Widget _buildRow(Todo item, int index) {
    return isAdding && index == 0
        ? TodoItemEditTile(
            key: Key(item.id.toString()),
            item: item,
            onEditingComplete: onAddingComplete,
          )
        : TodoItemTile(
            key: Key(item.id.toString()),
            item: item,
          );
  }
}
