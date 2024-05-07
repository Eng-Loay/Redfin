import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var uuid = Uuid();

class StoreDatePerson {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    try {
      Reference ref = _storage.ref().child(childName);
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (error) {
      // Handle upload error
      print('Error uploading image: $error');
      return '';
    }
  }

  Future<String> saveDataPerson({
    required Uint8List file,
  }) async {
    try {
      String imageUrl = await uploadImageToStorage("profileImage", file);
      await _firestore.collection('users').add({
        'imageLink': imageUrl,
      });
      return 'success';
    } catch (error) {
      // Handle save data error
      print('Error saving data: $error');
      return 'Some Error Occurred';
    }
  }
}
