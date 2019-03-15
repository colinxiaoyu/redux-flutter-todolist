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
                    reverse: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      if (index % 3 == 0) {
                        return _buildOtherMessageWidget(list[index]);
                      } else {
                        return _buildMyMessageWidget(list[index]);
                      }
                    });
              },
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "Send your message"),
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
            ),
          )
        ],
      )),
    );
  }

  _submitMessage(String message) {
    _textEditingController.clear();
    if (message != '') {
      list.insert(0, message);
      _controllerList.sink.add(list);
    }
    _controllerMessage.sink.add("");
    FocusScope.of(context).requestFocus(FocusNode()); //关闭软键盘
  }

  Widget _buildMyMessageWidget(message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("colin", style: Theme.of(context).textTheme.subhead),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue.withOpacity(0.2)),
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: CircleAvatar(
              child: Text("colin"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherMessageWidget(message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      width: MediaQuery.of(context).size.width / 2,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16.0, left: 8.0),
            child: CircleAvatar(
              child: Text("xyx"),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("xyx", style: Theme.of(context).textTheme.subhead),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.blue.withOpacity(0.2)),
                  margin: const EdgeInsets.only(top: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      message,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 4,
          ),
        ],
      ),
    );
  }
}
