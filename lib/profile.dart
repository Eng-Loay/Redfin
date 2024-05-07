import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'landing.dart';
import 'resources/save_person.dart';
import 'package:red_fin/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:io';
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;
  bool _isLoggedIn = false;
  String? firstName;
  String? email;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    _fetchUserData();
  }

  void _checkLoginStatus() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        _isLoggedIn = user != null;
      });
    });
  }

  void _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentSnapshot<Map<String, dynamic>> snapshot =
      await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

      setState(() {
        firstName = snapshot.data()?['firstName'];
        email = user.email;
      });
    } else {
      setState(() {
        email = null;
      });
    }
  }

  void _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    setState(() {
      _isLoggedIn = false;
    });
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => LandingPage()),
    );
  }
  void togglePasswordFieldsVisibility() {
    setState(() {
      showPasswordFields = !showPasswordFields;
    });
  }

  Future<void> selectedImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path).readAsBytesSync();
      });
    }
  }

  Future<void> saveProfile(BuildContext context) async {
    if (formState.currentState!.validate()) {
      try {
        if (_image != null) {
          String resp = await StoreDatePerson().saveDataPerson(file: _image!);
          Navigator.of(context).pushReplacementNamed("landing");
          print("Image added");
        } else {
          print("Error: Image is null");
        }
      } catch (e) {
        print("Error $e");
      }
    }
  }
  Future<void> _deleteAccount(BuildContext context) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        // Delete the user's account
        await user.delete();

        // Navigate to the landing page
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LandingPage()),
        );
      } else {
        // Handle case where user is not authenticated
        print("User not authenticated");
      }
    } catch (e) {
      print("Error deleting account: $e");
      // Handle error if account deletion fails
    }
  }


  bool showPasswordFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    _image != null
                        ? CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                        : CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade300,
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: selectedImage,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (firstName != null) const SizedBox(height: 15),
                Text(
                  '$firstName',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                if (email != null) ...[
                  const SizedBox(height: 15),
                  Text(
                    '$email',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
                const SizedBox(height: 15),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    suffixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: togglePasswordFieldsVisibility,
                  child: Row(
                    children: [
                      const Text(
                        'Change Password',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      const SizedBox(width: 150),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Icon(
                            showPasswordFields
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (showPasswordFields) ...[
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: oldPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Old Password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: newPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'New Password',
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Confirm Delete"),
                                content: Text("Are you sure you want to delete your account?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      // Delete account logic here
                                      await _deleteAccount(context);
                                    },
                                    child: Text("Delete"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          'Delete Account',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                      )
                      ,
                      GestureDetector(
                        onTap: () async {
                          // Check if the form is valid
                          if (formState.currentState!.validate()) {
                            try {
                              // Get the current user
                              User? user = FirebaseAuth.instance.currentUser;
                              if (user != null) {
                                // Re-authenticate the user
                                AuthCredential credential = EmailAuthProvider.credential(
                                  email: user.email!,
                                  password: oldPasswordController.text,
                                );
                                await user.reauthenticateWithCredential(credential);

                                // Update the email in Firebase Authentication
                                await user.updateEmail(emailController.text);
                                await user.updatePassword(newPasswordController.text);

                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(user.uid)
                                    .update({'firstName': usernameController.text});

                                saveProfile(context); // Pass context here
                                // Navigate back to the landing page
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LandingPage()),
                                );

                                print("Profile updated successfully!");
                              }
                            } catch (e) {
                              print("Error updating profile: $e");
                            }
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      GestureDetector(
                        onTap: () => _logout(context),
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
