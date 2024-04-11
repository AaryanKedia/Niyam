
class MySongModel {
  int? id;
  String? title;
  String? artist;
  String? data;

  MySongModel({this.id, this.title, this.artist, this.data});

  MySongModel.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["artist"] is String) {
      artist = json["artist"];
    }
    if(json["data"] is String) {
      data = json["data"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["artist"] = artist;
    _data["data"] = data;
    return _data;
  }
}