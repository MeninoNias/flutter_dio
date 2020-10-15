import 'dart:convert';

import 'package:flutter_dio/shared/custom_dio/custom_dio.dart';
import 'package:flutter_dio/shared/models/pokemodel.dart';

class HomeRepository {
  final CustomDio _cDio;

  HomeRepository(this._cDio);

  Future<List<PokeModel>> getPokes() async {
    try {
      var respose = await _cDio.dio.get("/pokemon?limit=100&offset=200");
      return (respose.data['results'] as List)
          .map((e) => PokeModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
    }
  }
}
