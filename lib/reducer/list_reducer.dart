import 'package:redux/redux.dart';
import 'package:flutter/foundation.dart';

class ToDoState {
  String uniqueId;
  String title;
  String desc;
  bool isDone;

  ToDoState({this.uniqueId, this.title='', this.desc='', this.isDone = false}) {
    uniqueId ??= DateTime.now().toIso8601String();
  }

  @override
  String toString() {
    return 'ToDoState{uniqueId: $uniqueId, title: $title, desc: $desc, isDone: $isDone}';
  }
}

///操作的对象
class TodoList {
  List<ToDoState> list;

  static List<ToDoState> initToDos = <ToDoState>[
    ToDoState(
      uniqueId: '0',
      title: 'Hello world',
      desc: 'Learn how to program.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '1',
      title: 'Hello Flutter',
      desc: 'Learn how to build a flutter application.',
      isDone: true,
    ),
    ToDoState(
      uniqueId: '2',
      title: 'How Fish Redux',
      desc: 'Learn how to use Fish Redux in a flutter application.',
      isDone: false,
    )
  ];

  TodoList({this.list});
}

///定义Action
class AddAction {
  ToDoState todo;

  AddAction({this.todo});
}

///变更是否完成状态
class ChangeAction {
  ToDoState todo;
  ChangeAction({this.todo});
}

class ChangeTitleAction {
  ToDoState todo;
  ChangeTitleAction({this.todo});
}



///将对象与action 绑定
final todoListReducer = combineReducers<TodoList>([
  TypedReducer<TodoList, ChangeAction>(_change),
  TypedReducer<TodoList, ChangeTitleAction>(_changeTitle),
  TypedReducer<TodoList, AddAction>(_addTodo),
]);

TodoList _addTodo(TodoList list, action) {
  list.list.add(action.todo);
  return TodoList(list: list.list);
}

///变更 是否完成的状态
TodoList _change(TodoList list, action) {
  list.list.forEach((item) {
    if (item.uniqueId == action.todo.uniqueId) {
      item.isDone = !item.isDone;
    }
  });
  return TodoList(list: list.list);
}

///变更 填写的title 和 desc
TodoList _changeTitle(TodoList list, action) {
  print('_changeTitle:' + action.todo.title);
  list.list.forEach((item) {
    if (item.uniqueId == action.todo.uniqueId) {
      item.title = action.todo.title;
      item.desc = action.todo.desc;
    }
  });
  return TodoList(list: list.list);
}
