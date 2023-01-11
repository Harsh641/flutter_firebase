import 'media.dart';

class Restraurant{

  String? name;
  String? address;
  String? latitude;
  String? opening_time;
  String? closing_time;

  Restraurant({required List<dynamic> data_1});

  Restraurant.fromJSON(Map<String, dynamic> jsonMap){
    name = jsonMap['name'] != null ? jsonMap.toString() : "";
    address = jsonMap['address'] != null ? jsonMap.toString() : "";
    latitude = jsonMap['latitude'] != null ? jsonMap.toString() : "";
    opening_time = jsonMap['opening_time'] != null ? jsonMap.toString() : "";
    closing_time = jsonMap['closing_time'] != null ? jsonMap.toString() : "";
  }

  MaptoMap(){
    var map = new Map<String, dynamic>();

    map['name'] = name;
    map['address'] = address;
    map['latitude'] = latitude;
    map['opening_time'] = opening_time;
    map['closing_time'] = closing_time;

    return map;
  }
}