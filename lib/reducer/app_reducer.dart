import 'package:redux_todolist/reducer/list_reducer.dart';

class AppState{
  final TodoList todoList;
  AppState({this.todoList});
}

AppState appReducer(AppState state,action){
  return AppState(
    todoList: todoListReducer(state.todoList,action),
  );
}