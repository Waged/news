import 'package:rxdart/rxdart.dart';
import '../models/ItemModel.dart';
import '../resources/Repository.dart';
import 'dart:async';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>(); //like a broadcast stream
  final _itemsOutput = BehaviorSubject<Map<int,Future<ItemModel>>>(); // emits stream when any new value comes and this all streams will deal with it
  final _itemsFetcher = PublishSubject<int>();



  //Getters to Streams
  Observable<List<int>> get topIds => _topIds.stream;
  Observable<Map<int, Future<ItemModel>>> get items => _itemsOutput.stream  ;

  //Getters to sinks
  Function(int) get fetchItem => _itemsFetcher.sink.add; //_items.sink.add;

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }


  StoriesBloc(){
    _itemsFetcher.stream.transform(_itemsTransformer()).pipe(_itemsOutput);
  }

  //this function invoked every single time a new element comes to the stream.
  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, count) {
        print(count);
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _topIds.close();
    _itemsFetcher.close();
    _itemsOutput.close();

  }

}
