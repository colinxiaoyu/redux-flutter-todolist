import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

///实现原理是，利用ScrollController监听像素是否到达底部，再注入新数据
///当然还有 一些地方需要修改：
///1、当loading时 下拉加载更多应该无效
///2、当前的手势状态，其实滑动到底部时，是否继续加载，由用户决定
///3、底部插入loading item
class PullOnLoading extends StatefulWidget {
  @override
  _PullOnLoadingState createState() {
    return _PullOnLoadingState();
  }
}

class _PullOnLoadingState extends State<PullOnLoading> {
  List<String> images;
  ScrollController _controller;

  @override
  void initState() {
    images = List();
    _controller = ScrollController();
    fetchTen();

    _controller.addListener((){
      print('_controller.position.pixels:${_controller.position.pixels}');
      print('_controller.position.maxScrollExtent:${_controller.position.maxScrollExtent}');
      if(_controller.position.pixels == _controller.position.maxScrollExtent){
        fetchTen();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PullOnLoading'),
      ),
      body: ListView.builder(
        controller: _controller,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return  Image.network(
                images[index],
                fit: BoxFit.cover,

            );
          }),
    );
  }

  fetch() async {
    final response = await http.get('http://dog.ceo/api/breeds/image/random');
    if (response.statusCode == 200) {
      setState(() {
        images.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  fetchTen() {
    for (int i = 0; i < 10; i++) {
      fetch();
    }
  }
}
