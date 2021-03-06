import 'package:flutter_test/flutter_test.dart';

//import 'package:test/test.dart';
import 'package:news/src/resources/NewsApiProvider.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('FetchTopIds returs a list of ids', () async {
    //setup Test Case
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async {
      return Response(json.encode([1, 2, 3, 5]), 200);
    });
    final ids = await newsApi.fetchTopIds();
    expect(ids, [1, 2, 3, 5]);
  });

  test("FetchItem returns an itemModel", ()
  async {
    final newsApi = NewsApiProvider();
    newsApi.client = MockClient((request) async{
      final jsonMap = {'id':123};
      return Response(json.encode(jsonMap),200);
    });
    final item = await newsApi.fetchItem(999);
    expect(item.id, 123);
  });
}