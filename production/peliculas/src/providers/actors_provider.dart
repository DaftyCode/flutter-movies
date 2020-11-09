import 'dart:convert';

import 'package:peliculas/src/constants/app_constants.dart';
import 'package:peliculas/src/models/actor_model.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/models/cast_model.dart';

class ActorsProvider {

  Future<List<Actor>> getCast (int movieId) async {

    final url = Uri.https(AppConstants.URL, '${AppConstants.VERSION_API}/movie/$movieId/credits', {
      'api_key': AppConstants.API_KEY,
      'language': AppConstants.LANGUAGE
    });

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodedData['cast']);

    return cast.items;

  }

}