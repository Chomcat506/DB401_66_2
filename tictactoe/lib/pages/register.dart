import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String _playername;
  late String _password;
  late String _passwordCheck;

  @override
  Widget build(BuildContext context) {
    void gotoChallenge() {
      Navigator.pushNamedAndRemoveUntil(context, 'challenge', (route) => false);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Player'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'images/logo.png',
                height: 100,
              ),
              const SizedBox(
                height: 48,
              ),
              TextField(
                onChanged: (value) {
                  _playername = value;
                },
                keyboardType: TextInputType.name,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter your player name',
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) {
                  _password = value;
                },
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) {
                  _passwordCheck = value;
                },
                obscureText: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: 'Retype your password',
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.blueAccent, width: 1),
                      borderRadius: BorderRadius.circular(30)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              FilledButton(
                onPressed: () async {
                  if (_password == _passwordCheck) {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: '$_playername@tictactoe.com',
                              password: _password);
                      gotoChallenge();
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.code),
                        duration: const Duration(seconds: 10),
                      ));
                    } catch (e) {
                      if (!context.mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(e.toString()),
                        duration: const Duration(seconds: 10),
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Password and Retype password are not identical.'),
                      duration: Duration(seconds: 10),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
