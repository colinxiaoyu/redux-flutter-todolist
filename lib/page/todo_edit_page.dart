import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_todolist/page/animated/hero_demo.dart';
import 'package:redux_todolist/page/animated/spinner.dart';
import 'package:redux_todolist/page/animated/animated_container_demo.dart';
import 'package:redux_todolist/page/animated/animated_cross_fade_demo.dart';
import 'package:redux_todolist/page/animated/hide_bottom_bar.dart';
import 'package:redux_todolist/page/audio_screen.dart';
import 'package:redux_todolist/page/stream/simple_stream_page.dart';
import 'package:redux_todolist/reducer/app_reducer.dart';
import 'package:redux_todolist/reducer/list_reducer.dart';

class TodoEditPage extends StatefulWidget {
  final ToDoState item;

  const TodoEditPage({Key key, this.item}) : super(key: key);

  @override
  _TodoEditPageState createState() {
    if (item == null) {
      return _TodoEditPageState(item: ToDoState());
    } else {
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
    var controller1 = TextEditingController.fromValue(TextEditingValue(
        text: title,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: title.length))));

    var controller2 = TextEditingController.fromValue(TextEditingValue(
        text: desc,
        selection: TextSelection.fromPosition(TextPosition(
            affinity: TextAffinity.downstream, offset: desc.length))));

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
            ),
            Expanded(
              child: ListView.builder(
                itemCount: item.todo.length,
                padding: EdgeInsets.all(8.0),
                itemBuilder: (BuildContext context, int index) {
                  return RaisedButton(
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(item.todo[index]),
                        Icon(Icons.keyboard_return),
                      ],
                    ),
                    onPressed: () {
                      _toDo(item.todo[index]);
                    },
                  );
                },
              ),
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
              } else {
                Navigator.of(context).pop();
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

  void _toDo(String todo) {
    Future push(Widget widget) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => widget));

    switch (todo) {
      case 'AnimatedContainerDemo':
        push(AnimatedContainerDemo());
        break;
      case 'AnimatedCrossFadeDemo':
        push(AnimatedCrossFadeDemo());
        break;
      case 'HideBottomBarDemo':
        push(HideBottomBarDemo());
        break;
      case 'SpinnerDemo':
        push(SpinnerDemo());
        break;
      case 'HeroDemo':
        push(HeroDemo());
        break;
      case 'AudioScreen':
        push(AudioScreen());
        break;
      case 'SimpleStreamPage':
        push(SimpleStreamPage());
        break;
      default:
        break;
    }
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
