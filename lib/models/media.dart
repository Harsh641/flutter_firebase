class Media{
  String? id;
  String? name;
  String? url;
  String? thumb;
  String? icon;
  String? size;

  Media(){
    url = "";
    thumb = "";
    icon = "";
  }

  Media.fromJson(Map<String, dynamic> jsonMap){
    id = jsonMap['id'].toString();
    name = jsonMap['name'].toString();
    url = jsonMap['url'] != null ? jsonMap['url'].toString() : "";
    thumb = jsonMap['thumb'] != null ? jsonMap['thumb'].toString():"";
    icon = jsonMap['icon'].toString();
    size = jsonMap['formated_size'].toString();
  }
}