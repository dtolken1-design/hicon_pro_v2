import 'package:flutter/material.dart';

import 'modules/auth/pin_login_screen.dart';
import 'shared/theme.dart';

void main() {
  runApp(const HiconProApp());
}

class HiconProApp extends StatelessWidget {
  const HiconProApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hicon Pro',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const PinLoginScreen(),
    );
  }
}
