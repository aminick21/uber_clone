
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:provider/provider.dart';
import 'package:uber_clone/globalvariables.dart';
import 'package:uber_clone/screens/loginpage.dart';
import 'package:uber_clone/screens/mainpage.dart';
import 'package:uber_clone/screens/registrationpage.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'db2',
    options: Platform.isIOS
        ? const FirebaseOptions(
      googleAppID: '1:169450788828:ios:94b60468db3510b6f9a119',
      gcmSenderID: '169450788828',
      databaseURL: 'https://geetaxi-9c60a.firebaseio.com',
    )
        : const FirebaseOptions(
      googleAppID: '1:169450788828:android:418ca150b8799c9ef9a119',
      apiKey: 'AIzaSyDQSm22dfjceA0OiQ9XL-0tQ0d7_XZTXpQ',
      databaseURL: 'https://geetaxi-9c60a.firebaseio.com',
    ),
  );

  currentFirebaseUser = await FirebaseAuth.instance.currentUser();

  runApp(MyApp());

}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Brand-Regular',
          primarySwatch: Colors.blue,
        ),
        initialRoute: (currentFirebaseUser == null) ? LoginPage.id : MainPage.id,
        routes: {
          RegistrationPage.id: (context) => RegistrationPage(),
          LoginPage.id: (context) => LoginPage(),
          MainPage.id: (context) => MainPage(),
        },
      ),
    );
  }
}
