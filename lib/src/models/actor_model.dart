import 'package:json_annotation/json_annotation.dart';

/// This allows the `Actor` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'actor_model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable()
class Actor {

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  @JsonKey(name: 'cast_id')
  int castId;
  String character;

  @JsonKey(name: 'credit_id')
  String creditId;
  int gender;
  int id;
  String name;
  int order;

  @JsonKey(name: 'profile_path')
  String profilePath;

  /// A necessary factory constructor for creating a new Actor instance
  /// from a map. Pass the map to the generated `_$ActorFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Actor.
  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$ActorToJson`.
  Map<String, dynamic> toJson() => _$ActorToJson(this);

  getActorPhoto() {
    if (profilePath == null) {
      return 'https://www.pngfind.com/pngs/m/341-3416003_no-avatar-pic-unknown-person-png-transparent-png.png';
    }
    return 'https://image.tmdb.org/t/p/w500/$profilePath';
  }

}