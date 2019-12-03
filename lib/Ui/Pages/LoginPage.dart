import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:quickdrop/Ui/Pages/HomePage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:quickdrop/ViewModel.dart';

class LoginPage extends StatelessWidget {
  Future<String> _loginUser(LoginData loginData, ViewModel model) {
    print(
        'Name: ${loginData.name}, Password: ${loginData.password}, Email: ${loginData.email}');
    return model.login(loginData.name, loginData.password).then((data) {
      if (data != "Success") {
        print("IF");
        return data;
      } else {
        print("ELSE");
        return null;
      }
    });
  }

  Future<String> _createUser(LoginData loginData, ViewModel model) {
    print(
      'Name: ${loginData.name}, Password: ${loginData.password}, Email: ${loginData.email}',
    );

    return model
        .createUser(loginData.email, loginData.name, loginData.password)
        .then((data) {
      if (data != "Success") {
        return data;
      } else {
        return null;
      }
    });
  }

  Function(String) usernameValidator = (String username) {
    if (username.isEmpty) {
      return 'Field empty';
    } else if (username.length < 3) {
      return 'Field too short';
    }

    return null;
  };
  Function(String) passwordValidator = (String password) {
    if (password.isEmpty) {
      return 'Password empty';
    } else if (password.length < 3) {
      return 'Password Short';
    }
    return null;
  };

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>(
        rebuildOnChange: true,
        builder: (context, child, model) => FlutterLogin(
              title: 'Quick Drop',
              titleTag: "titleTag",
              logo: 'assets/logo.png',
              logoTag: "logoTag",
              onLogin: (data) => _loginUser(data, model),
              onSignup: (data) => _createUser(data, model),
              //onSignup: _authUser,
              onSubmitAnimationCompleted: () {
                print("TEST");
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
              },
              // onRecoverPassword: _recoverPassword,
              messages: LoginMessages(
                usernameHint: "Username",
                confirmPasswordHint: "Email",
              ),
              emailValidator: usernameValidator,
              passwordValidator: passwordValidator,

              theme: LoginTheme(
                primaryColor: Color(0xff48c6ef),
              ),
              onRecoverPassword: (_) {
                return null;
              },
            ));
  }
}
