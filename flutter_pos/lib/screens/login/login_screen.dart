import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../../shared/responsive.dart';
import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: secondaryColor,
        padding: EdgeInsets.all(!Responsive.isMobile(context) ? defaultPadding : 8),
        child: LoginForm(),
      )
    );
  }
}