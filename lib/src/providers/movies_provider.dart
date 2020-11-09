import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:peliculas/src/constants/app_constants.dart';
import 'package:peliculas/src/models/movie_model.dart';
import 'package:peliculas/src/models/movies_list_model.dart';

class MoviesProvider {

  int _popularesPage = 0;
  bool _loading = false;
  List<Movie> _populars = new List();
  final _popularsStreamController = StreamController<List<Movie>>.broadcast();
  Function(List<Movie>) get popularSink => _popularsStreamController.sink.add;
  Stream<List<Movie>> get popularStream => _popularsStreamController.stream;

  void disposeStreams() {
    _popularsStreamController?.close();
  }

  Future<List<Movie>> getInCinemas() async {

    final url = Uri.https(AppConstants.URL, '${AppConstants.VERSION_API}/movie/now_playing', {
      'api_key': AppConstants.API_KEY,
      'language': AppConstants.LANGUAGE
    });

    return await _processResponse(url);
  }

  Future<List<Movie>> getPopular() async {

    if (_loading) return [];

    _loading = true;

    _popularesPage++;

    final url = Uri.https(AppConstants.URL, '${AppConstants.VERSION_API}/movie/popular', {
      'api_key': AppConstants.API_KEY,
      'language': AppConstants.LANGUAGE,
      'page': _popularesPage.toString()
    });

    final resp = await _processResponse(url);
    _populars.addAll(resp);
    popularSink(_populars);

    _loading = false;

    return resp;
  }

  Future<List<Movie>> searchMovie(String query) async {

    final url = Uri.https(AppConstants.URL, '${AppConstants.VERSION_API}/search/movie', {
      'api_key': AppConstants.API_KEY,
      'language': AppConstants.LANGUAGE,
      'query': query
    });

    return await _processResponse(url);
  }

  Future<List<Movie>> _processResponse(Uri url) async {

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final movies = new Movies.fromJsonList(decodedData['results']);

    return movies.items;
  }

}