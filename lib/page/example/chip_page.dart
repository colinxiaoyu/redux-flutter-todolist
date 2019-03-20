import 'package:flutter/material.dart';

class ChipPage extends  StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipPage'),
      ),
      body: Center(
        child: Row(
          children: <Widget>[
            Chip(
              label: Text('Chip-Basic'),
              avatar: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('01'),
              ),
              onDeleted: (){},
            )
          ],
        ),
      ),
    );
  }

}