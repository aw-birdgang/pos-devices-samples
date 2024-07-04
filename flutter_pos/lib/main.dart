import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'screens/main/main_screen.dart';
import 'services/configure/http_configuration_provider.dart';
import 'shared/constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // print("load dotenv!!");
  // await dotenv.load(fileName: "assets/env/.env.dev");
  // String envFbProjectId = dotenv.get('FIREBASE_PROJECT_ID');
  // print("envFbProjectId :: " + envFbProjectId);
  HttpConfigurationProvider provider = HttpConfigurationProvider();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AuthController(),
    ),
    ChangeNotifierProxyProvider<AuthController, AuthController>(
      update: (context, auth, previousMenu) => AuthController(),
      create: (BuildContext context) => AuthController(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
      },
    );
  }
}