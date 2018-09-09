import 'package:flutter/material.dart';

import '../drawer.dart';
import '../contact.dart';

class EmergencyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _EmergencyScreenState();
}

class _EmergencyScreenState extends State<EmergencyScreen> {
  final personText = TextEditingController();
  final phoneText = TextEditingController();
  List<ContactEntry> contactList = [
    ContactEntry("John Doee", "570-982-2945"),
  ];
  int index = 0;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    personText.dispose();
    phoneText.dispose();
    super.dispose();
  }

  _entryBox() {
    setState(
      () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text("Enter a new Emergency Contact"),
              children: <Widget>[
                TextFormField(
                  autocorrect: true,
                  maxLength: 26,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: personText,
                ),
                TextFormField(
                  autocorrect: true,
                  maxLength: 26,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  controller: phoneText,
                ),
                FlatButton(
                  child: Text('Submit'),
                  onPressed: () {
                    contactList.add(
                      ContactEntry(personText.text, phoneText.text),
                    );
                    phoneText.clear();
                    personText.clear();

                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  _showEmergency() {
    setState(
      () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Emergency System has been activated",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0),
              ),
              contentPadding: EdgeInsets.all(10.0),
              titlePadding: EdgeInsets.all(10.0),
              actions: <Widget>[
                FlatButton(
                  child: Text("Acknowlege"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          },
        );
      },
    );
  }

  _editBox(ContactEntry contact) {
    TextEditingController editPerson =
        TextEditingController(text: contact.name);
    TextEditingController editPhone =
        TextEditingController(text: contact.phone);

    setState(
      () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text("Edit Emergency Contact"),
              children: <Widget>[
                TextFormField(
                  autocorrect: true,
                  maxLength: 26,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  controller: editPerson,
                ),
                TextFormField(
                  autocorrect: true,
                  maxLength: 26,
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  controller: editPhone,
                ),
                FlatButton(
                  child: Text('Submit'),
                  onPressed: () {
                    contactList
                        .removeWhere((element) => element.name == contact.name);
                    contactList.add(
                      ContactEntry(editPerson.text, editPhone.text),
                    );
                    editPerson.clear();
                    editPhone.clear();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Emergency Settings',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30.0)),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            DataTable(
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      "Recipient",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Phone Number",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20.0),
                    ),
                  ),
                ],
                rows: contactList
                    .map((element) => DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(element.name),
                              onTap: () => _editBox(
                                    ContactEntry(element.name, element.phone),
                                  ),
                            ),
                            DataCell(
                              Text(element.phone),
                              onTap: () => _editBox(
                                    ContactEntry(element.name, element.phone),
                                  ),
                            ),
                          ],
                        ))
                    .toList()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _entryBox();
         //_showEmergency();
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}
