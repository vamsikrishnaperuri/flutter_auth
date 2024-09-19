import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    String res = "An error occurred";  // Default error message

    try {
      // Create a new user with email and password
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      String str = userCredential.user!.uid;
      print("$str");
      if (userCredential.user != null) {
        print("-------------------User ID: ${userCredential.user!.uid}-------------------");

        print("Successfully created user");


        // Add user details to Firestore under 'users' collection
        await _firestore.collection("users").doc(userCredential.user!.uid).set({
          'name': name,
          'email': email,
          // 'uid': userCredential.user!.uid,
        });
        print("User ID: ${userCredential.user!.uid}");

        print("Successfully added to Firestore");

        // Success message
        res = "Successfully executed";
      } else {
        res = "User creation failed";
        print("User is null after sign up");
      }
    } catch (e) {
      // Log detailed error message
      res = "Error: ${e.toString()}";
      print("Error occurred: $res");
    }

    print(
        "<<<-----------------------------------------------: $res--------------------------------------------->>>");
    return res;
  }
}
