import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_todolist/reducer/app_reducer.dart';
import 'package:redux_todolist/reducer/list_reducer.dart';

class TodoEditPage extends StatefulWidget {
  final ToDoState item;

  const TodoEditPage({Key key, this.item}) : super(key: key);


  @override
  _TodoEditPageState createState() {
    if(item == null){
      return _TodoEditPageState(item: ToDoState());
    }else{
      return _TodoEditPageState(item: item);
    }


  }
}

class _TodoEditPageState extends State<TodoEditPage> {
  final ToDoState item;

  _TodoEditPageState({this.item});

  var title;

  var desc;

  @override
  void initState() {
    title = item.title;
    desc = item.desc;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller1 =
        TextEditingController.fromValue(TextEditingValue(text: title));

    var controller2 =
        TextEditingController.fromValue(TextEditingValue(text: desc));

    return Scaffold(
      appBar: AppBar(
          title: Text('MyToDo'),
          leading: CustomLeading(
            title: title,
            desc: desc,
          )),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Text('Title:'),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          controller: controller1,
                          onChanged: (text) {
                            setState(() {
                              title = text;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                          cursorColor: Colors.blue,
                        )))
              ],
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 50.0,
                  child: Text('Desc:'),
                ),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: TextField(
                          controller: controller2,
                          onChanged: (text) {
                            setState(() {
                              desc = text;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          maxLines: 10,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                          cursorColor: Colors.blue,
                          onSubmitted: (text) => controller2.text = text,
                        )))
              ],
            )
          ],
        ),
      ),
      floatingActionButton: StoreConnector<AppState, VoidCallback>(
        converter: (store) {
          return () => store.dispatch(ChangeTitleAction(
              todo: ToDoState(
                  uniqueId: item.uniqueId, title: title, desc: desc)));
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: () {
              if (title == '' || desc == '') {
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('You should edit title and desc')));
                return;
              }
              callback();
            },
            child: Icon(Icons.done),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class CustomLeading extends StatelessWidget {
  final String title;
  final String desc;

  const CustomLeading({Key key, this.title, this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (title == '' || desc == '') {
          if (title == '' || desc == '') {
            Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('You should edit title and desc')));
            return;
          }
        } else {
          Navigator.of(context).pop();
        }
      },
      icon: Icon(Icons.arrow_back_ios),
    );
  }
}
