import 'package:flutter/material.dart';
import 'dart:async';

class IMPage extends StatefulWidget {
  @override
  _IMPageState createState() {
    // TODO: implement createState
    return _IMPageState();
  }
}

class _IMPageState extends State<IMPage> {
  StreamController _controllerMessage;
  StreamController _controllerList;
  List<String> list = [];

  TextEditingController _textEditingController;

  @override
  void initState() {
    _controllerMessage = StreamController();
    _controllerList = StreamController();
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerMessage.close();
    _controllerList.close();
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMPage'),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder(
              initialData: list,
              stream: _controllerList.stream,
              builder: (context, snapshot) {
                List<String> list = snapshot.data;
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(list[index]),
                      );
                    });
              },
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  decoration:
                      InputDecoration.collapsed(hintText: "Send your message"),
                  controller: _textEditingController,
                  onChanged: (message) {
                    _controllerMessage.sink.add(message);
                  },
                  onSubmitted: (message) {
                    _submitMessage(message);
                  },
                ),
              ),
              StreamBuilder(
                initialData: '',
                builder: (context, snapshot) {
                  return IconButton(
                    onPressed: () {
                      _submitMessage(snapshot.data);
                    },
                    icon: Icon(Icons.send),
                  );
                },
                stream: _controllerMessage.stream,
              )
            ],
          )
        ],
      )),
    );
  }

  _submitMessage(String message) {
    list.insert(0, message);
    _controllerList.sink.add(list);
  }
}
