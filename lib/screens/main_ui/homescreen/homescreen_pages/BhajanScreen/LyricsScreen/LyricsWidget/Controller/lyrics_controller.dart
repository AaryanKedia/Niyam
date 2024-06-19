import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../Model/my_lyrics_model.dart';

class LyricsController extends GetxController {
  final db = FirebaseFirestore.instance;

  Future<int> getNumberOfSongs() async {
    QuerySnapshot querySnapshot = await db.collection('Lyrics').get();
    return (querySnapshot.docs.length);
    // return querySnapshot.size;
  }

  RxList<MyLyricsModel> LyricsList = RxList<MyLyricsModel>([]);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getLyrics();
    super.onInit();
  }

  void getLyrics() async {
    isLoading.value = true;
    LyricsList.clear();

    await db.collection("lyrics").get().then((value) {
      value.docs.forEach((element) {
        LyricsList.add(MyLyricsModel.fromJson(element.data()));
      });
      isLoading.value = false;
    });
  }
}
