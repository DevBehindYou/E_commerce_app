import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class FirebaseStorage {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadUrl(String imgName) async {
    String downlaodURL =
        await storage.ref("category/$imgName").getDownloadURL();

    return downlaodURL;
  }
}
