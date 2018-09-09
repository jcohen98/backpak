import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../drawer.dart';

enum RgbModes { flash, emergency, shift, solid }

class RgbScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RgbScreenState();
}

class _RgbScreenState extends State<RgbScreen> {
  // create some value
  Color pickerColor = new Color(0xff06ED5B);
  Color currentColor = new Color(0xff06ED5B);
  ValueChanged<Color> onColorChanged;
  RgbModes _selection;

// bind some values with [ValueChanged<Color>] callback
  changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          'RGB Customizer',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 30.0),
        ),
      ),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pickerColor = currentColor;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Select a new Color for your Pak'),
                content: SingleChildScrollView(
                  child: ColorPicker(
                    pickerColor: pickerColor,
                    onColorChanged: changeColor,
                    colorPickerWidth: 1000.0,
                    pickerAreaHeightPercent: 0.7,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text('Got it'),
                    onPressed: () {
                      setState(() => currentColor = pickerColor);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: new Icon(Icons.color_lens),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(50.0),
          ),
          RadioListTile<RgbModes>(
            title: Text(
              "Solid Color",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            value: RgbModes.solid,
            groupValue: _selection,
            onChanged: (RgbModes value) {
              setState(
                () {
                  _selection = value;
                },
              );
            },
          ),
          RadioListTile<RgbModes>(
            title: Text(
              "Flashing",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            value: RgbModes.flash,
            groupValue: _selection,
            onChanged: (RgbModes value) {
              setState(
                () {
                  _selection = value;
                },
              );
            },
          ),
          RadioListTile<RgbModes>(
            title: Text(
              "Color Shift",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            value: RgbModes.shift,
            groupValue: _selection,
            onChanged: (RgbModes value) {
              setState(
                () {
                  _selection = value;
                },
              );
            },
          ),
          RadioListTile<RgbModes>(
            title: Text(
              "Emergency SOS",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontSize: 24.0),
            ),
            value: RgbModes.emergency,
            groupValue: _selection,
            onChanged: (RgbModes value) {
              setState(
                () {
                  _selection = value;
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
