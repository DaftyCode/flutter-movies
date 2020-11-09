import 'package:json_annotation/json_annotation.dart';

/// This allows the `Movie` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'movie_model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Movie {

  Movie({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });


  String uniqueId;
  double popularity;

  @JsonKey(name: 'vote_count')
  int voteCount;
  bool video;

  @JsonKey(name: 'poster_path')
  String posterPath;
  int id;
  bool adult;

  @JsonKey(name: 'backdrop_path')
  String backdropPath;

  @JsonKey(name: 'original_language')
  String originalLanguage;

  @JsonKey(name: 'original_title')
  String originalTitle;

  @JsonKey(name: 'genre_ids')
  List<int> genreIds;
  String title;

  @JsonKey(name: 'vote_average')
  double voteAverage;
  String overview;

  @JsonKey(name: 'release_date')
  String releaseDate;

  /// A necessary factory constructor for creating a new Movie instance
  /// from a map. Pass the map to the generated `_$MovieFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Movie.
  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$MovieToJson`.
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  getPosterImg() {
    if (posterPath == null) {
      return 'https://cdn.samsung.com/etc/designs/smg/global/imgs/support/cont/NO_IMG_600x600.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  getBackgroundImg() {
    if (backdropPath == null) {
      return 'https://cdn.samsung.com/etc/designs/smg/global/imgs/support/cont/NO_IMG_600x600.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }

}
