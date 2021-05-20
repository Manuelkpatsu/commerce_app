import 'package:commerceapp/router.dart';
import 'package:commerceapp/view/screens/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
            elevation: 1, iconTheme: IconThemeData(color: Colors.black))
      ),
      home: MainMenu(),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute
    );
  }
}
