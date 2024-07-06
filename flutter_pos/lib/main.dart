import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'controllers/auth_controller.dart';
import 'controllers/sidemenu_controller.dart';
import 'screens/login/login_screen.dart';
import 'screens/main/main_screen.dart';
import 'screens/splash/splash_screen.dart';
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
    ChangeNotifierProxyProvider<AuthController, SideMenuController>(
      update: (context, auth, previousMenu) => SideMenuController(auth),
      create: (BuildContext context) => SideMenuController(null),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainScreen(),
      },
    );
  }
}