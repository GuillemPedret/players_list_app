import 'package:flutter/material.dart';
import 'player_model.dart';
import 'dart:async';

class PlayerDetailPage extends StatefulWidget {
  final Player player;

  PlayerDetailPage(this.player);

  @override
  _PlayerDetailPageState createState() => new _PlayerDetailPageState();
}

class _PlayerDetailPageState extends State<PlayerDetailPage> {
  final double playerAvarterSize = 150.0;
  double _sliderValue = 10.0;

  Widget get addYourRating {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Slider(
                    activeColor: Colors.black,
                  min: 0.0,
                  max: 10.0,
                  value: _sliderValue,
                  onChanged: (newRating) {
                    setState(() {
                      _sliderValue = newRating;
                    });
                  },
                ),
              ),
              Container(
                  width: 50.0,
                  alignment: Alignment.center,
                  child: Text(
                    '${_sliderValue.toInt()}',
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  )),
            ],
          ),
        ),
        submitRatingButton,
      ],
    );
  }

  void updateRating() {
    if (_sliderValue < 5) {
      _ratingErrorDialog();
    } else {
      setState(() {
        widget.player.rating = _sliderValue.toInt();
      });
    }
  }

  Future<Null> _ratingErrorDialog() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: Text("Come on! They're good!"),
            actions: <Widget>[
              TextButton(
                child: const Text('Try Again'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        });
  }

  Widget get submitRatingButton {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
      onPressed: () => updateRating(),
      child: const Text('Submit'),
    );
  }

  Widget get playerImage {
    return Hero(
      tag: widget.player,
      child: Container(
        height: playerAvarterSize,
        width: playerAvarterSize,
        constraints: BoxConstraints(),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                  offset: Offset(1.0, 2.0),
                  blurRadius: 2.0,
                  spreadRadius: -1.0,
                  color: Color(0x33000000)),
              BoxShadow(
                  offset: Offset(2.0, 1.0),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  color: Color(0x24000000)),
              BoxShadow(
                  offset: Offset(3.0, 1.0),
                  blurRadius: 4.0,
                  spreadRadius: 2.0,
                  color: Color(0x1f000000))
            ],
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.player.imageUrl ?? ''))),
      ),
    );
  }

  Widget get rating {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.star,
          size: 40.0,
          color: Colors.black,
        ),
        Text('${widget.player.rating}/10',
            style: TextStyle(color: Colors.black, fontSize: 30.0))
      ],
    );
  }

  Widget get playerProfile {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.0),
      decoration: const BoxDecoration(
        color: Colors.red,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          playerImage,
          Text(widget.player.name,
              style: TextStyle(color: Colors.black, fontSize: 32.0)),
          Text(widget.player.levelDigimon,
              style: TextStyle(color: Colors.black, fontSize: 20.0)),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: rating,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Meet ${widget.player.name}'),
      ),
      body: ListView(
        children: <Widget>[playerProfile, addYourRating],
      ),
    );
  }
}
