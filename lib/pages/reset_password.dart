import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../drawer.dart';
import '../post.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
  int _pass = 0;

  void _getValue(String value) {
    if(value.isEmpty){
      return;
    }
    setState(() {
      _pass = int.parse(value);
    });
  }

  Future<Post> fetchPost() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      return Post.fromJson(json.decode(response.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset DPak Lock Pin Number'),
      ),
      backgroundColor: Colors.white,
      body: new Container(
        padding: const EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                  labelText: "Enter your new D Pak pin number"),
              keyboardType: TextInputType.number,
              maxLength: 4,
              maxLines: 1,
              onEditingComplete: () {},
              onSubmitted: (newValue) {
                Navigator.pushNamed(context, '/reset');
                _getValue(newValue);
                // Send the value to the API
              },
            ),
            // FutureBuilder<Post>(
            //   future: fetchPost(),
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       print(snapshot.data.title);
            //       return Text(snapshot.data.title);
            //     } else if (snapshot.hasError) {
            //       return Text("${snapshot.error}");
            //     }
            //     // By default, show a loading spinner
            //     return LinearProgressIndicator();
            //   },
            // )
          ],
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
