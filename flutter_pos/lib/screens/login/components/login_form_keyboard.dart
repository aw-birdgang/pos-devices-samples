// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard/flutter_keyboard.dart';
//
// class LoginFormKeyboardPage extends StatefulWidget {
//   const LoginFormKeyboardPage({super.key,});
//   @override
//   State<LoginFormKeyboardPage> createState() => _LoginFormKeyboardState();
// }
//
// class _LoginFormKeyboardState extends State<LoginFormKeyboardPage> {
//
//   final FocusNode _focusNode1 = FocusNode();
//   final FocusNode _focusNode2 = FocusNode();
//   FocusNode? _currentFocusNode;
//
//   var textIdController = TextEditingController();
//   var textPasswordController = TextEditingController();
//
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode1.addListener(() {
//       if (_focusNode1.hasFocus) {
//         setState(() {
//           _currentFocusNode = _focusNode1;
//         });
//       }
//     });
//     _focusNode2.addListener(() {
//       if (_focusNode2.hasFocus) {
//         setState(() {
//           _currentFocusNode = _focusNode2;
//         });
//       }
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         loginForm(),
//         loginKeyboard(),
//       ],
//     );
//   }
//
//
//   void _onTextInput(String text) {
//     if (_currentFocusNode == _focusNode1) {
//       textIdController.text += text;
//     } else if (_currentFocusNode == _focusNode2) {
//       textPasswordController.text += text;
//     }
//   }
//
//   void _onBackspace() {
//     if (_currentFocusNode == _focusNode1 && textIdController.text.isNotEmpty) {
//       textIdController.text =
//           textIdController.text.substring(0, textIdController.text.length - 1);
//     } else if (_currentFocusNode == _focusNode2 && textPasswordController.text.isNotEmpty) {
//       textPasswordController.text =
//           textPasswordController.text.substring(0, textPasswordController.text.length - 1);
//     }
//   }
//
//
//   Widget loginForm() {
//     return Form(
//       key: _formkey,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           TextFormField(
//             focusNode: _focusNode1,
//             controller: textIdController,
//             maxLines: 1,
//             keyboardType: TextInputType.none,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.normal,
//             ),
//             decoration: const InputDecoration(
//               hintText: "ID",
//               hintStyle: TextStyle(color: Colors.grey),
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           TextFormField(
//             focusNode: _focusNode2,
//             controller: textPasswordController,
//             maxLines: 1,
//             keyboardType: TextInputType.none,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.normal,
//             ),
//             decoration: const InputDecoration(
//               hintText: "PWD",
//               hintStyle: TextStyle(color: Colors.grey),
//               border: OutlineInputBorder(),
//             ),
//           ),
//           // Consumer<AuthController>(builder: (context, authcontroller, child) {
//           //   return defaultTextFormField(
//           //     focusNode: _focusNode1,
//           //     suffixIcon: InkWell(
//           //       child: Icon(
//           //         authcontroller.showPassword ? Icons.visibility : Icons.visibility_off,
//           //       ),
//           //       onTap: () {
//           //         authcontroller.onChangePasswordVisibility();
//           //       },
//           //     ),
//           //     obscure: authcontroller.isShowPassword(),
//           //     controller: textPasswordController,
//           //     inputType: TextInputType.none,
//           //     hintText: "Password",
//           //     onValidate: (value) {
//           //       if (value!.isEmpty) return "password must not be empty";
//           //       return null;
//           //     },
//           //   );
//           // }),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//   Widget loginKeyboard () {
//     return FlutterKeyboard(
//       onKeyboardTap: (String value) {
//         setState(() {
//           print("_onKeyboardTap value : $value");
//           _onTextInput(value);
//         });
//       },
//       characters: const ['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0', ''],
//       footerMiddleCharacter: '💡',
//       itemsPerRow: 3,
//       getAllSpace: true,
//       externalPaddingButtons: const EdgeInsets.all(12),
//       buttonsDecoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         color: Colors.blue,
//       ),
//       footerRightAction: () {
//         setState(() {
//           print("footerRightAction");
//         });
//       },
//       footerRightChild: Container(
//         alignment: Alignment.center,
//         width: 50,
//         height: 50,
//         child: const Icon(Icons.backspace),
//       ),
//       footerLeftAction: () {
//         setState(() {
//           print("footerLeftAction");
//         });
//       },
//       footerLeftChild: Container(
//         alignment: Alignment.center,
//         width: 50,
//         height: 50,
//         child: const Icon(Icons.done),
//       ),
//     );
//   }
//
// }