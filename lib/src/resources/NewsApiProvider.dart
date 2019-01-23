import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/ItemModel.dart';

class NewsApiProvider {
  Client client = Client();
  final  _root = "https://hacker-news.firebaseio.com/v0";

  fetchTopIds() async {
    final response = await client.get(
        "$_root/topstories.json?print=pretty");
    final ids = json.decode(response.body);
    return ids;
  }

  fetchItem(int id) async {
// https://hacker-news.firebaseio.com/v0/item/8863.json?print=pretty
    final response = await client.get("$_root/item/$id.json");
    final parsedJson =  json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
