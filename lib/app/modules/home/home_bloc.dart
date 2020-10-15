import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dio/app/modules/home/home_repository.dart';
import 'package:flutter_dio/shared/models/pokemodel.dart';
import 'package:rxdart/subjects.dart';

class HomeBloc extends BlocBase {
  //dispose will be called automatically by closing its streams

  final HomeRepository repo;

  HomeBloc(this.repo);

  var listPost = BehaviorSubject<List<PokeModel>>();
  Sink<List<PokeModel>> get resposeIn => listPost.sink;
  Stream<List<PokeModel>> get resposeOut => listPost.stream;

  getPokemos() async {
    try {
      var res = await repo.getPokes();
      resposeIn.add(res);
    } catch (e) {
      listPost.addError(e);
    }
  }

  @override
  void dispose() {
    listPost.close();
    super.dispose();
  }
}
