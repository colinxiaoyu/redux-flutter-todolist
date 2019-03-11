import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_todolist/page/todo_edit_page.dart';
import 'package:redux_todolist/reducer/app_reducer.dart';
import 'package:redux_todolist/reducer/list_reducer.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          'MyToDoList',
        )),
        body: Container(
            padding: EdgeInsets.all(10.0),
            child: StoreConnector<AppState, TodoList>(
                converter: (store) => store.state.todoList,
                builder: (context, todoListReducer) {
                  return Column(
                    children: _getItem(todoListReducer.list),
                  );
                })));
  }

  ///渲染标题
  Widget _getTitle(List<ToDoState> list) {
    int total = list.length;
    int done = 0;
    list.forEach((item){
      if(item.isDone){
        done++;
      }
    });
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.warning,
            size: 15.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text('Total $total tasks,$done done',
                style: TextStyle(
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }

  ///渲染每个Item
  List<Widget> _getItem(List<ToDoState> list) {
    List<Widget> newList = new List();
    newList.add(_getTitle(list));
    list.forEach((item) {
      newList.add(Item(item));
    });

    return newList;
  }
}

class Item extends StatelessWidget {
  final ToDoState item;

  Item(this.item);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
            color: item.isDone ? Colors.green : Colors.red,
            margin: EdgeInsets.only(top: 10.0),
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Icon(Icons.bookmark_border),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      item.title,
                      maxLines: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                StoreConnector<AppState, VoidCallback>(
                  converter: (store) {
                    return () => store.dispatch(ChangeAction(todo: item));
                  },
                  builder: (context, callback) {
                    return GestureDetector(
                      onTap: () {
                        callback();
                      },
                      child: Icon(item.isDone
                          ? Icons.check_box
                          : Icons.check_box_outline_blank),
                    );
                  },
                ),
              ],
            )),
        Container(
          color: Colors.grey,
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  item.desc,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TodoEditPage(item: item,);
                  }));
                },
                child: Icon(Icons.edit),
              )
            ],
          ),
        )
      ],
    );
  }
}
