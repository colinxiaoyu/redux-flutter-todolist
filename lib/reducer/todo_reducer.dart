import 'package:redux/redux.dart';

///操作对象
class ToDo {
  String title;
  String desc;

  ToDo({this.title = '', this.desc = ''});
}

class ChangeTitleAction {
  ToDo toDo;
  ChangeTitleAction(this.toDo);
}

class ChangeDescAction {
  ToDo toDo;
  ChangeDescAction(this.toDo);
}

///将对象与action 绑定
final todoReducer = combineReducers<ToDo>([
  TypedReducer<ToDo, ChangeTitleAction>(_changeTitle),
  TypedReducer<ToDo, ChangeDescAction>(_changeDesc),
]);

ToDo _changeTitle(ToDo toDo, action) {
  toDo = action.toDo;
  return ToDo(title: toDo.title);
}

ToDo _changeDesc(ToDo toDo, action) {
  toDo = action.toDo;
  return ToDo(title: toDo.desc);
}

