import 'package:flutter/material.dart';

import '../pages/Homepage.dart';

class SignupButton extends StatelessWidget {

  late final Function()? onTap;
  final ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
    minimumSize: const Size(220,50), backgroundColor: Colors.purpleAccent,
    // primary: Colors.amber[900],
    elevation: 0,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50))),

  );

  SignupButton({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: buttonPrimary,
      onPressed:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomePage()));
      },
      child: const Text("Sign Up",
        style: TextStyle(color: Colors.white),),

    );
  }
}