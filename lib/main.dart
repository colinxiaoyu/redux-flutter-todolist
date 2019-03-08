import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_todolist/page/todo_list_page.dart';
import 'package:redux_todolist/reducer/app_reducer.dart';
import 'package:redux_todolist/reducer/list_reducer.dart';
import 'package:redux_todolist/reducer/todo_reducer.dart';

void main(){
final store = Store<AppState>(appReducer,initialState: AppState(toDo: ToDo(),todoList: TodoList(list: TodoList.initToDos)));
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp(this.store);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: TodoListPage(),
      ),
    );
  }
}


