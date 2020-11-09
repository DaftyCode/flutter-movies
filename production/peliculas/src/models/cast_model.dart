import 'actor_model.dart';

class Cast {

  List<Actor> items = new List();

  Cast();

  Cast.fromJsonList( List<dynamic> jsonList  ) {

    if ( jsonList == null ) return;

    for ( var item in jsonList  ) {
      final actor = new Actor.fromJson(item);
      items.add( actor );
    }

  }

}