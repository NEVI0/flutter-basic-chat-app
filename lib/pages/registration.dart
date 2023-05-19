import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_chat_app/utils/constants.dart';
import 'package:flutter_chat_app/widgets/rounded_button.dart';

import 'package:flutter_chat_app/pages/chat.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = 'registration';

  const RegistrationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  String email = '';
  String password = '';

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration,
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password')),
            const SizedBox(
              height: 24.0,
            ),
            RoundedButton(
                text: 'Register',
                color: Colors.blueAccent,
                onPressed: () async {
                  try {
                    await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    if (context.mounted) {
                      Navigator.pushNamed(context, ChatPage.id);
                    }
                  } catch (exception) {
                    print(exception);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
