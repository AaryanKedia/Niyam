class MyLyricsModel {
  // int? id;
  String? name;
  // String? artist;
  String? lyrics;

  MyLyricsModel({ this.name,this.lyrics});

  MyLyricsModel.fromJson(Map<String, dynamic> json) {
    // if (json["id"] is int) {
    //   id = json["id"];
    // }
    if (json["name"] is String) {
      name = json["name"];
    }
    // if (json["artist"] is String) {
    //   artist = json["artist"];
    // }
    if (json["lyrics"] is String) {
      lyrics = json["lyrics"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    // _data["id"] = id;
    _data["name"] = name;
    // _data["artist"] = artist;
    _data["lyrics"] = lyrics;
    return _data;
  }
}
