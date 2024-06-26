import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:red_fin/componants/custombuttonauth.dart';
import 'package:red_fin/componants/textformfeild.dart';
import 'package:red_fin/componants/cutomlogoauth.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey <FormState> formState = GlobalKey<FormState>();
  bool isLoading =false;

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser==null)
      {
        return ;
      }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushNamedAndRemoveUntil("homepage",(route) => false);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:isLoading? Center(child: CircularProgressIndicator()): Container(
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
                  const Text("Login",style: TextStyle(fontSize: 29),),
                  Container(height: 10,),
                  const Text("Discover Your Dream Home",style: TextStyle(color: Colors.grey),),
                  Container(height: 20,),
                  const Text("Email",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  CustomTextForm(hinttext:"Enter Your Email",mycontroller:email,validator: (val)
                  {
                    if(val=="")
                    {
                      return "Can't To be Empty";
                    }
                  },),
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
                  InkWell(
                    onTap: ()async{
                    if(email.text == "")
                      {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.rightSlide,
                          title: 'warning',
                          desc: 'Please Write Your Email Then Enter Forget Password',
                        ).show();
                        return ;
                      }
                    try{
                      await FirebaseAuth.instance.sendPasswordResetEmail(email:email.text );
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.success,
                        animType: AnimType.rightSlide,
                        title: 'success',
                        desc: 'A link has been sent to reset the password',
                      ).show();
                    }catch(e){
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Please make sure that the email entered is correct',
                      ).show();
                    }


                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10,bottom: 20),
                      alignment: Alignment.topRight,
                      child: const Text(
                        "Forgot Password ?",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 14),),
                    ),
                  ),

                ],

              ),
            ),
            CustomButton(title: "Login",
              onPressed: ()async{
                if(formState.currentState!.validate())
                {
                  try {
                    isLoading=true;
                    setState(() {

                    });
                    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email.text,
                        password: password.text

                    );
                    isLoading=false;
                    setState(() {

                    });
                    if(credential.user!.emailVerified)
                    {
                      Navigator.of(context).pushReplacementNamed("homepage");
                    }
                    else
                    {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Please Verify Your Email',
                      ).show();
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'No user found for that email.',
                      ).show();
                    } else if (e.code == 'wrong-password') {
                      // print('Wrong password provided for that user.');
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: 'Wrong password provided for that user.',
                      ).show();
                    } else {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.error,
                        animType: AnimType.rightSlide,
                        title: 'Error',
                        desc: e.code,
                      ).show();
                    }
                  }
                }
                else
                {
                  print("not valid");
                }
              }
              ,)
            ,
            Container(height: 20,),
            const Text("OR Login",textAlign: TextAlign.center,),
            MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: Colors.red[700],
              textColor: Colors.white,
              onPressed: (){
                signInWithGoogle();
              },child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login With Google"),
                Image.asset('images/google_icon.png',width: 30,)
              ],
            ),
            ),
            Container(height: 20,),
            // Text("Don't Have An Account ? Register",textAlign: TextAlign.center,),
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacementNamed("signup");

              },
              child: const Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Don't Have An Account ? "),
                  TextSpan(text: "Register",style: TextStyle(color: Color(0xFF90CAF9),fontWeight: FontWeight.bold))
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}