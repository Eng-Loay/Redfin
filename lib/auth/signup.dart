import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_fin/componants/custombuttonauth.dart';
import 'package:red_fin/componants/textformfeild.dart';

import 'package:red_fin/componants/cutomlogoauth.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey <FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 50,),
                  const CustomLogoAuth(),
                  Container(height:20,),
                  const Text("SignUp",style: TextStyle(fontSize: 29),),
                  Container(height: 10,),
                  const Text("Discover Your Dream Home",style: TextStyle(color: Colors.grey),),
                  Container(height: 20,),
                  const Text("Username",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  CustomTextForm(hinttext:"Enter Your username",mycontroller:username,validator: (val){
                    if(val=="")
                    {
                      return "Can't To be Empty";
                    }
                  }),

                  const Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  CustomTextForm(hinttext:"Enter Your Email",mycontroller:email,validator: (val){
                    if(val=="")
                    {
                      return "Can't To be Empty";
                    }
                  }),
                  Container(height: 10,),
                  Container(height: 10,),

                  const Text("Password",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  CustomTextForm(hinttext:"Enter Your Password",mycontroller:password,validator: (val){
                    if(val=="")
                    {
                      return "Can't To be Empty";
                    }
                  }),

                  Container(height: 10,),
                  Container(
                    margin: const EdgeInsets.only(top: 10,bottom: 20),
                    alignment: Alignment.topRight,
                    child: const Text(
                      "Forgot Password ?",
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 14),),
                  ),

                ],

              ),
            ),
            CustomButton(title: "SignUp",onPressed: () async{
              if(formState.currentState!.validate())
              {
                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email:email.text ,
                    password: password.text,
                  );
                  FirebaseAuth.instance.currentUser!.sendEmailVerification();
                  Navigator.of(context).pushReplacementNamed("login");
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'The password provided is too weak.',
                    ).show();
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.error,
                      animType: AnimType.rightSlide,
                      title: 'Error',
                      desc: 'The account already exists for that email.',
                    ).show();
                  }
                } catch (e) {
                  print(e);
                }
              }
            },
            ),
            Container(height: 20,),
            Container(height: 20,),
            // Text("Don't Have An Account ? Register",textAlign: TextAlign.center,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacementNamed("login");
              },
              child: const Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Have An Account ? "),
                  TextSpan(
                    text: "Login",
                    style: TextStyle(
                      color: Color(0xFF90CAF9),
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}