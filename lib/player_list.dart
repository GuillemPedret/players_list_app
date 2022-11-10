import 'nba_card.dart';
import 'package:flutter/material.dart';
import 'player_model.dart';

class PlayerList extends StatelessWidget {
  final List<Player> player;

  const PlayerList(this.player, {super.key});

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
      itemCount: player.length,
      itemBuilder: (context, int) {
        return PlayerCard(player[int]);
      },
    );
  }
}
