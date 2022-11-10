import 'player_model.dart';
import 'player_detail_page.dart';
import 'package:flutter/material.dart';

class PlayerCard extends StatefulWidget {
  final Player player;


  const PlayerCard(this.player, {super.key});

  @override
  _PlayerCardState createState() => _PlayerCardState(player);
}

class _PlayerCardState extends State<PlayerCard> {
  Player player;
  late String renderUrl;

  _PlayerCardState(this.player);

  void initState() {

    super.initState();
    renderPlayerPic();
  }

  Future <void> renderPlayerPic() async {
    await player.getImageUrl();
    if (mounted) {
      setState(() {

        renderUrl = player.imageUrl;
        print(renderUrl);
      });
    }
  }

  Widget get playerCard {
    return Positioned(
      right: 0.0,
      child: Container(
        width: 290,
        height: 115,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Colors.white54,
          child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8, left: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  widget.player.name,
                  style:
                      const TextStyle(color:Colors.black, fontSize: 27.0),
                ),
                Row(
                  children: <Widget>[
                    const Icon(Icons.star, color: Color(0xFF000600)),
                    Text(': ${widget.player.rating}/10',
                        style: const TextStyle(
                            color: Color(0xFF000600), fontSize: 14.0))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  showPlayerDetailPage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return PlayerDetailPage(player);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showPlayerDetailPage(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              playerCard,
              Positioned(
                top: 8.0,
                  width: 100.0,
                  height: 100.0,
                  child: Hero(
                tag: player,
                child: CircleAvatar(
                  backgroundImage:NetworkImage(renderUrl ?? '') ,
                  backgroundColor: Colors.black38,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
