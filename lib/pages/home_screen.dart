import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool lockVal = true;
  int temp = 71;
  int battery = 76;

  Text _setLockText(bool val) {
    if (val) {
      return Text(
        'Lock On',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0),
      );
    }
    return Text(
      'Lock Off',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w700, fontSize: 34.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Got your back, Pak!',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30.0)),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        children: <Widget>[
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Unlock your Pak',
                          style: TextStyle(color: Colors.blueAccent)),
                      _setLockText(lockVal),
                    ],
                  ),
                  Switch(
                    value: lockVal,
                    inactiveTrackColor: Colors.red,
                    inactiveThumbColor: Colors.grey[100],
                    onChanged: (changed) {
                      setState(() {
                        lockVal = changed;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Material(
                            color: Colors.teal,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.flare,
                                  color: Colors.white, size: 30.0),
                            )),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            '$temp' + 'F',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 30.0),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Conditions',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text('Right from the Pak!',
                        style: TextStyle(color: Colors.black45)),
                  ]),
            ),
          ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Material(
                            color: Colors.teal,
                            shape: CircleBorder(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Icon(Icons.battery_charging_full,
                                  color: Colors.white, size: 30.0),
                            )),
                        Container(
                          margin: EdgeInsets.all(10.0),
                          child: Text(
                            '$battery' + '%',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 30.0),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Battery',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text('Need a charge?',
                        style: TextStyle(color: Colors.black45)),
                  ]),
            ),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(1, 230.0),
          StaggeredTile.extent(1, 230.0),
        ],
      ),
      drawer: MyDrawer(),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }
}
