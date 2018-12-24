import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pajarogram/services/auth.dart';
import 'package:pajarogram/pages/register_page.dart';

class SignInFab extends StatelessWidget {
  const SignInFab({@required this.auth});

  final Auth auth;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () => _handleSignIn(context),
        icon: Image.asset('assets/google_logo.png', height: 24.0),
        label: const Text('Sign in with Google'));
  }

  void _handleSignIn(BuildContext context) {

      if (_existingUser()) {
        auth.signInWithGoogle().then((FirebaseUser user) =>
            _showSnackBar(context, 'Welcome ${user.displayName}')
        );
      } else {
        _navigateToRegistration(context);
      }

  }

  bool _existingUser(){
    return false;
  }

  void _navigateToRegistration(BuildContext context){
    Navigator.pushNamed(context, RegisterPage.routeName);
  }

  void _showSnackBar(BuildContext context, String msg) {
    final SnackBar snackBar = SnackBar(content: Text(msg));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
