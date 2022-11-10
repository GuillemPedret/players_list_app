import 'package:flutter/material.dart';
import 'dart:async';
import 'player_model.dart';
import 'player_list.dart';
import 'new_player_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NBA 1998 Bulls',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(
        title: 'NBA 1998 Bulls',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Player> initialPlayers = []
    ..add(Player('Michael'))
    ..add(Player('Pippen'))
    ..add(Player('Ron'))
    ..add(Player('Rodman'))
    ..add(Player('Steve'))
    ..add(Player('Randy'));

  Future _showNewDigimonForm() async {
    Player players = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddPlayerFormPage();
    }));
    //print(players);
    if (players != null) {
      initialPlayers.add(players);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showNewDigimonForm,
          ),
        ],
      ),
      body: Container(
          color: Colors.red,
          child: Center(
            child: PlayerList(initialPlayers),
          )),
    );
  }
}
