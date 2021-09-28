import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_characters/app/config/api.dart';
import 'package:marvel_characters/app/modules/model/character.dart';

class HomeRepository extends Disposable {
  final Dio _client;

  HomeRepository(this._client);

  Future fatchChars() async {
    API api = API();
    final response = await _client.get(api.gerarURL('characters'));
    return (response.data["data"]["results"] as List)
        .map((e) => CharacterModel.fromJson(e))
        .toList();
  }

  @override
  void dispose() {}
}
