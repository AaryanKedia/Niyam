import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:niyam/screens/main_ui/homescreen/homescreen_pages/BhajanScreen/model/my_song_model.dart';

class CloudStorageController extends GetxController{
  final db = FirebaseFirestore.instance;

  RxList<MySongModel> cloudSongList = RxList<MySongModel>([]);
  RxBool isLoading = true.obs;
  @override
  void onInit() {
    getCloudSound();
    super.onInit();

  }

  void getCloudSound() async{
    isLoading.value = true;
    cloudSongList.clear();

    await db.collection("songs").get().then((value){
      value.docs.forEach((element){
        cloudSongList.add(MySongModel.fromJson(element.data()));
      });
      isLoading.value = false;
    });
  }

}