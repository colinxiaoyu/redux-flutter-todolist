///**
/// * 实现原理是利用form自带的onWillPop属性，其余与will_pop_scope_demo中一致。
/// */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class FormPopDemo extends StatefulWidget {

  @override
  _FormPopDemoState createState() =>  _FormPopDemoState();
}

class _FormPopDemoState extends State<FormPopDemo> {
  final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();
  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('FormPopDemo'),
      ),
      body:  SafeArea(
          top: false,
          bottom: false,
          child:  Form(
            onWillPop: _onBackPressed,
              key: _formKey,
              autovalidate: true,
              child:  ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                   TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your first and last name',
                      labelText: 'Name',
                    ),
                  ),
                   TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter your date of birth',
                      labelText: 'Dob',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                   TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                   TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                   InputDecorator(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.color_lens),
                      labelText: 'Color',
                    ),
                    isEmpty: _color == '',
                    child:  DropdownButtonHideUnderline(
                      child:  DropdownButton<String>(
                        value: _color,
                        isDense: true,
                        onChanged: (String newValue) {
                          setState(() {
                            _color = newValue;
                          });
                        },
                        items: _colors.map((String value) {
                          return  DropdownMenuItem<String>(
                            value: value,
                            child:  Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                   Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child:  RaisedButton(
                        child: const Text('Submit'),
                        onPressed: null,
                      )),
                ],
              ))),
    );
  }
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Do you really want to exit the app?'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(context, false),
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ));
  }
}