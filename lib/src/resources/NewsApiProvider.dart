import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/ItemModel.dart';
import 'dart:async';
import 'Repository.dart';

class NewsApiProvider implements Source {
  Client client = Client();
  final  _root = "https://hacker-news.firebaseio.com/v0";

  Future<List<int>>fetchTopIds() async {
    final response = await client.get(
        "$_root/topstories.json");
    final ids =  json.decode(response.body);
    return ids.cast<int>();
  }

  Future<ItemModel>fetchItem(int id) async {
// https://hacker-news.firebaseio.com/v0/item/8863.json
    final response = await client.get("$_root/item/$id.json");
    final parsedJson =  json.decode(response.body);
    return ItemModel.fromJson(parsedJson);
  }
}
