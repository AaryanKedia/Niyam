import 'package:get/get.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/LyricsScreen/LyricsWidget/Model/my_lyrics_model.dart';

class LyricsContentController extends GetxController{

  RxString lyricsName = "".obs;
  RxString lyrics = "".obs;


  Future<void> loadLyrics(MyLyricsModel lyricsModel) async{
    lyricsName.value = lyricsModel.name!;
    lyrics.value = lyricsModel.lyrics!;
  }
}