import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firestore_crud/pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyC6WUU690722qmZMTU9-GDpM4hl3qYRRJI",
      appId: "1:958760400760:android:fbf59c390fb1def26bfa8d",
      messagingSenderId: "958760400760",
      projectId: "fluttercrud-7c36a",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        //check for error
        if (snapshot.hasError) {
          print("Something went Wrong");
        }
        //once completed, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Flutter Firestore crud',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        }
        return CircularProgressIndicator();
      },
    );
}
