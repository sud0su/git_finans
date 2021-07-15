import 'package:flutter/material.dart';
import 'package:gin_finans/screens/signup/signup_screen.dart';

import 'config/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: SignUpScreen(),
    );
  }
}
