import 'dart:convert';
import 'dart:io';
import 'dart:async';

class Player {
  final String name;
  late String imageUrl;
  late String apiname;
  late String levelDigimon;

  int rating = 10;

  Player(this.name);

  Future getImageUrl() async {
    HttpClient http = HttpClient();
    try {
      apiname = name;
      var uri =
          Uri.https('www.mockachino.com', '/44ec429c-0123-4b/$apiname');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      List data = json.decode("[$responseBody]");
      imageUrl = data[0]["image"];
      levelDigimon = data[0]["name"];

      print(levelDigimon);
    } catch (exception) {
      print(exception);
    }
  }
}
