import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
var uuid = Uuid();
class StoreDate {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
  Future<String> saveData(
      {required String price, required String bed,required String bath,required String address, required String size,required Uint8List file})async {
    String resp = "Some Error Occured";
    try{

      if(price.isNotEmpty|| bed.isNotEmpty||bath.isNotEmpty||address.isNotEmpty||size.isNotEmpty) {
        String imageUrl = await uploadImageToStorage(uuid.v1(), file);
        await _firestore.collection('HomeDetails').add({
          'price': price,
          'bed': bed,
          'bath': bath,
          'address': address,
          'size': size,

          'imageLink': imageUrl,
        });
        resp = 'success';
      }
    }
    catch(err){
      resp = err.toString();
    }
    return resp;
  }
}


