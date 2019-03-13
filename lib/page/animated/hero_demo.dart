import 'package:flutter/material.dart';
import 'package:redux_todolist/page/general_page.dart';

class HeroDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    int count = 20;
    List<String> list = List.generate(count, (index)=>"this is $index item");
    return Scaffold(
      appBar: AppBar(title:Text("HeroDemo")),

      body: ListView.builder(
        itemCount: count,
          itemBuilder: (context,index){
            return ListTile(
              title: Text(list[index]),
            );
          }),
    );
  }

}