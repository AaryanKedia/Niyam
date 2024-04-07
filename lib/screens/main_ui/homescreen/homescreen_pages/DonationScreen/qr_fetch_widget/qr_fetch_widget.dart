import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class QrFetchWidget {
  String? downloadUrl ;

  Future getData() async{

    try{
      await downloadURLExample();
      return downloadUrl;
    }catch(e){
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async{
    downloadUrl = await FirebaseStorage.instance
        .ref()
        .child("barcode.png")
        .getDownloadURL();
    debugPrint(downloadUrl.toString());
  }
}