import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

class PullToRefresh extends StatefulWidget {
  @override
  _PullToRefreshState createState() {
    return _PullToRefreshState();
  }
}

class _PullToRefreshState extends State<PullToRefresh> {
  List<String> images;

  @override
  void initState() {
    images = List();
    fetchTen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PullToRefresh'),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await  Future.delayed(const Duration(seconds: 1));
            images.clear();
            fetchTen();
          },
          child: ListView.builder(
            itemCount: images.length,
              itemBuilder: (context, index) {
            return Image.network(
              images[index],
              fit: BoxFit.cover,
            );
          }),
        ));
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
