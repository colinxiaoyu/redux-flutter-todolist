import 'package:flutter/material.dart';

class ChipPage extends StatelessWidget {
  var _scaffoldkey =  GlobalKey<ScaffoldState>();

  void showSnackBar(String message) {
    var snackBar = SnackBar(content: Text(message));
    _scaffoldkey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('ChipPage'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Chip(
              label: Text('Chip-Basic'),
              avatar: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text('01'),
              ),
              onDeleted: () {},
            ),
            ActionChip(
                label: Text('ACTION CHIP'),
                onPressed: () {
                  showSnackBar('ON TAP');
                }),
            ChoiceChipDemo(),
            FilterChipDemo(),
            InputChip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('Aaron Burr'),
              onPressed: () {
                print('I am the one thing in life.');
              },
              onDeleted: (){},
            ),
          ],
        ),
      ),
    );
  }
}

class ChoiceChipDemo extends StatefulWidget {
  @override
  _ChoiceChipDemoState createState() {
    return _ChoiceChipDemoState();
  }
}

class _ChoiceChipDemoState extends State<ChoiceChipDemo> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        'choice chip',
      ),
      labelStyle: TextStyle(color: _isSelected ? Colors.white : Colors.black),
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Colors.blue.shade400,
    );
  }
}

class FilterChipDemo extends StatefulWidget {
  @override
  _FilterChipDemoState createState() => _FilterChipDemoState();
}

class _FilterChipDemoState extends State<FilterChipDemo> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text('FILTER CHIP'),
      selected: _isSelected,
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
      },
      selectedColor: Colors.blue.shade400,
    );
  }
}
