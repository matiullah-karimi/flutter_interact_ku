import 'package:flutter/material.dart';
import 'package:flutter_interact_ku/example/scholarships.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.blue,
                ),
                //hintText: "Please enter your email...",
                labelText: "Email",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.vpn_key,
                  color: Colors.blue,
                ),
                //hintText: "Please enter your password...",
                labelText: "Password",
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ScholarshipsScreen()
                  ));
                }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
