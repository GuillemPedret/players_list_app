import 'player_model.dart';
import 'package:flutter/material.dart';

class AddPlayerFormPage extends StatefulWidget {
  @override
  _AddPlayerFormPageState createState() => _AddPlayerFormPageState();
}

class _AddPlayerFormPageState extends State<AddPlayerFormPage> {
  TextEditingController nameController = TextEditingController();

  void submitPup(BuildContext context) {
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('You forgot to insert the basketball player name'),
        ),
      );
    } else {
      var newDigimon = Player(nameController.text);
      Navigator.of(context).pop(newDigimon);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new basketball player'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: TextField(
                style: TextStyle(decoration: TextDecoration.none),
                //onChanged: (v) => nameController.text = v,
                decoration: InputDecoration(
                  labelText: 'Basketball player name',
                  labelStyle: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(
                builder: (context) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () => submitPup(context),
                    child: const Text('Submit Player'),

                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
