import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:red_fin/componants/custombuttonauth.dart';
import 'package:red_fin/componants/customtextfeildadd.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:red_fin/utils.dart';
import 'package:red_fin/resources/save_data.dart';
class AddCategory extends StatefulWidget {
  const AddCategory({super.key});

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  Uint8List? _image;
  void selectedImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
    _image = img;
  }

  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController price = TextEditingController();
  TextEditingController bed = TextEditingController();
  TextEditingController bath = TextEditingController();
  TextEditingController address = TextEditingController();

  CollectionReference homes = FirebaseFirestore.instance.collection('homes');
  // addHome() async {
  //   if (formState.currentState!.validate()) {
  //     try {
  //       DocumentReference response = await homes.add({"names": price.text});
  //       Navigator.of(context).pushReplacementNamed("forsale");
  //     } catch (e) {
  //       print("Error $e");
  //     }
  //   }
  // }
  void SaveHome() async {
    if(formState.currentState!.validate())
      {
        try{
          String homePrice = price.text;
          String homeBed = bed.text;
          String homeBath = bath.text;
          String homeAddress = address.text;
          String resp = await StoreDate().saveData(price: homePrice, bed: homeBed, bath: homeBath, address: homeAddress, file: _image!);
          Navigator.of(context).pushReplacementNamed("forsale");
          print("added");
        } catch(e){
          print("Error $e");

        }
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Home"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Column(
            children: [
              Container(
                height: 20,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://cdn.dribbble.com/users/1210339/screenshots/3766100/media/985c9812c50cdb0302383d9598b3e510.jpg?resize=400x300&vertical=center'),
                        ),
                  Positioned(
                    left: 80,
                    bottom: -10,
                    child: IconButton(
                      onPressed: selectedImage,
                      icon: Icon(Icons.add_a_photo),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: CustomTextFormAdd(
                    hinttext: "Enter Price Of Home",
                    mycontroller: price,
                    validator: (val) {
                      if (val == "") {
                        return "Can't to be Empty";
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: CustomTextFormAdd(
                    hinttext: "Enter Number Of Bed",
                    mycontroller: bed,
                    validator: (val) {
                      if (val == "") {
                        return "Can't to be Empty";
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: CustomTextFormAdd(
                    hinttext: "Enter Number Of Bath",
                    mycontroller: bath,
                    validator: (val) {
                      if (val == "") {
                        return "Can't to be Empty";
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: CustomTextFormAdd(
                    hinttext: "Enter Adress",
                    mycontroller: address,
                    validator: (val) {
                      if (val == "") {
                        return "Can't to be Empty";
                      }
                    }),
              ),
              CustomButton(
                title: "Add",
                onPressed: () {
                  SaveHome();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
