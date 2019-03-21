import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
