import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class AuthController extends ChangeNotifier {
  bool isloadingSignIn = false;
  String errorMessage = "";

  User? currentuserModel;

  AuthController();


  Future<User?> signIn(String email, String password) async {
    print("email : " + email + " , password : " + password);
    User? userModel;
    isloadingSignIn = true;
    notifyListeners();
    try {
      // UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      // userModel = User(
      //     email: userCredential.user?.email,
      //     name: userCredential.user?.displayName,
      // );
      isloadingSignIn = false;
      currentuserModel = userModel;
      notifyListeners();
    } catch (e) {
      isloadingSignIn = false;
      errorMessage = e.toString();
      notifyListeners();
      print(e.toString());
    }
    return currentuserModel;
  }

  bool showPassword = false;
  onChangePasswordVisibility() {
    showPassword = !showPassword;
    notifyListeners();
  }

  bool isShowPassword () {
    return (showPassword) ? false : true;
  }

  Future SignOut() async {
    currentuserModel = null;
    notifyListeners();
  }
}