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
    String res = "An error occurred";  // Updated error message
    try {
      // Create a new user with email and password
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Add user details to Firestore under 'users' collection
      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
        'uid': userCredential.user!.uid,
      });

      // Success message
      res = "Successfully executed";
    } catch (e) {
      // Set error message to return it
      res = e.toString();
      print(e);
    }
    return res;
  }
}
