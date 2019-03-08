import 'package:redux_todolist/reducer/list_reducer.dart';
import 'package:redux_todolist/reducer/todo_reducer.dart';

class AppState{
  final ToDo toDo;
  final TodoList todoList;
  AppState({this.toDo,this.todoList});
}

AppState appReducer(AppState state,action){
  return AppState(
    toDo: todoReducer(state.toDo,action),
    todoList: todoListReducer(state.todoList,action),
  );
}