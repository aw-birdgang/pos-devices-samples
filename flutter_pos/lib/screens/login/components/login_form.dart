import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/default_button.dart';
import '../../../components/default_text_form.dart';
import '../../../controllers/auth_controller.dart';

class LoginForm extends StatelessWidget {
  var textIdController = TextEditingController();
  var textPasswordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          defaultTextFormField(
            controller: textIdController,
            inputType: TextInputType.number,
            hintText: "ID",
            onValidate: (value) {
              print("ID value : $value");
              if (value!.isEmpty) return "id must not be empty";
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Consumer<AuthController>(builder: (context, authcontroller, child) {
            return defaultTextFormField(
              suffixIcon: InkWell(
                child: Icon(
                  authcontroller.showPassword ? Icons.visibility : Icons.visibility_off,
                ),
                onTap: () {
                  authcontroller.onChangePasswordVisibility();
                },
              ),
              obscure: authcontroller.isShowPassword(),
              controller: textPasswordController,
              inputType: TextInputType.number,
              hintText: "PWD",
              onValidate: (value) {
                print("Password value : $value");
                if (value!.isEmpty) return "password must not be empty";
              },
            );
          }),
          const SizedBox(
            height: 10,
          ),
          context.watch<AuthController>().isloadingSignIn
              ? const CircularProgressIndicator()
              : DefaultButton(
              text: "Quick Sign In",
              height: 50,
              onPressed: () async {
                print("Quick");
                // if (_formkey.currentState!.validate()) {
                //   String id = textIdController.text.toString();
                //   String pwd = textPasswordController.text.toString();
                //   // User? userModel = await context.read<AuthController>().signIn(id, pwd);
                // }
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const GameScreen()));
                Navigator.pushReplacementNamed(context, '/home');
              }),
        ],
      ),
    );
  }
}