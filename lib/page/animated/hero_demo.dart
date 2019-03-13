import 'package:flutter/material.dart';

///https://flutterchina.club/animations/hero-animations/#standard-hero-animation-code
class HeroDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int count = 20;
    List<String> list = List.generate(count, (index) => "this is $index item");
    return Scaffold(
      appBar: AppBar(title: Text("HeroDemo")),
      body: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(list[index]),
            );
          }),
      floatingActionButton: Hero(
          tag: "floatingActionButton",
          child: FloatingActionButton(
              backgroundColor: Colors.red,
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              })),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondScreen"),
      ),
      body: Center(
        child: Text("SecondScreen"),
      ),
      floatingActionButton: Hero(
          tag: "floatingActionButton",
          child: Padding(
            padding: EdgeInsets.all(10.00),
            child: ButtonTheme(
              height: 48.0,
              minWidth: double.infinity,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.red,
                splashColor:Colors.blue,
                highlightElevation:10.00,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
