import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool agreedToTOS = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Pajaro Name'),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Pajaro Name is required';
                    }
                  }),
              const SizedBox(height: 16.0),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Full Name'),
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return 'Full Name is required';
                    }
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: agreedToTOS,
                      onChanged: _setAgreedToTOS,
                    ),
                    GestureDetector(
                      onTap: () => _setAgreedToTOS(!agreedToTOS),
                      child: const Text(
                          'I agree to the Terms of Services and Privacy Policy'),
                    )
                  ],
                ),
              ),
              Row(children: <Widget>[
                const Spacer(),
                OutlineButton(
                  highlightedBorderColor: Colors.black,
                  onPressed: _submittable() ? _submit : null,
                  child: const Text('Register'),
                )
              ]),
            ]));
  }

  bool _submittable() {
    return agreedToTOS;
  }

  void _submit(){
    _formKey.currentState.validate();
    print('Form Submitted');
  }

  void _setAgreedToTOS(bool newValue) {
    setState(() {
      agreedToTOS = newValue;
    });
  }
}