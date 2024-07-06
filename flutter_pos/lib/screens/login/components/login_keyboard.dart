// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard/flutter_keyboard.dart';
//
// class LoginKeyboardPage extends StatefulWidget {
//   const LoginKeyboardPage({super.key,});
//   @override
//   State<LoginKeyboardPage> createState() => _LoginKeyboardState();
// }
//
// class _LoginKeyboardState extends State<LoginKeyboardPage> {
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return FlutterKeyboard(
//       onKeyboardTap: _onKeyboardTap,
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
//         });
//       },
//       footerRightChild: Container(
//         alignment: Alignment.center,
//         width: 50,
//         height: 50,
//         child: const Icon(Icons.backspace),
//       ),
//       footerLeftAction: () {},
//       footerLeftChild: Container(
//         alignment: Alignment.center,
//         width: 50,
//         height: 50,
//         child: const Icon(Icons.done),
//       ),
//     );
//   }
//
//   _onKeyboardTap(String value) {
//     setState(() {
//       print("_onKeyboardTap value : $value");
//     });
//   }
//
// }