import 'package:crypto_wallet/injection.dart';
import 'package:crypto_wallet/pages/sign_in/sign_in_page.dart';
import 'package:crypto_wallet/pages/start/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          color: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        )
      ),
      home: StartPage(),
    );
  }
}
