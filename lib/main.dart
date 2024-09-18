// import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttergooglesignin/pages/loginpage.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyB_BIuCKtHIWRqZsaXjAwxyGsVhgDXrrjc",
        appId: "1:869821734609:android:ca94ab72a1a5a41dd1aff0",
        messagingSenderId: "869821734609",
        projectId: "flutter-auth-eaa11"
    ));
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loginpage(),
    );
  }
}
