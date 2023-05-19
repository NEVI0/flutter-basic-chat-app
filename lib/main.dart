import 'package:flutter/material.dart';

import 'package:flutter_chat_app/pages/chat.dart';
import 'package:flutter_chat_app/pages/login.dart';
import 'package:flutter_chat_app/pages/registration.dart';
import 'package:flutter_chat_app/pages/welcome.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomePage.id,
      routes: {
        WelcomePage.id: (context) => const WelcomePage(),
        RegistrationPage.id: (context) => const RegistrationPage(),
        LoginPage.id: (context) => const LoginPage(),
        ChatPage.id: (context) => const ChatPage(),
      },
    );
  }
}
