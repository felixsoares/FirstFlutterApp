import 'package:applogin/UI/principal.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String email = "felix.soares.ferreira@gmail.com";
  String password = "123456";

  _login(context) {
    if (emailController.text.trim() == email &&
        passwordController.text.trim() == password) {
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Principal()));
    } else {
      final snackbar = SnackBar(
        content: Text("E-mail or Password incorrect"),
        duration: Duration(seconds: 3),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Login"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.network(
                  "https://logodownload.org/wp-content/uploads/2019/07/mini-logo.png"),
              Padding(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 0.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: const OutlineInputBorder(), labelText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: const InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Password"),
                  controller: passwordController,
                  obscureText: true,
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                  child: RaisedButton(
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      _login(context);
                    },
                    color: Colors.purple,
                    textColor: Colors.white,
                    padding: EdgeInsets.all(10.0),
                  )),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: GestureDetector(
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
              ),
            ],
          ),
        ));
  }
}
