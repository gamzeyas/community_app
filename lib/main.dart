import 'package:community_app/common/colors.dart';
import 'package:community_app/features/auth/views/sign_in.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    androidProvider: AndroidProvider.debug,
  );
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent,
            ),
            useMaterial3: true,
            scaffoldBackgroundColor: scaffoldBGColor,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                unselectedLabelStyle: TextStyle(color: greyColor),
                unselectedIconTheme: IconThemeData(color: greyColor),
                selectedItemColor: activeColor,
                type: BottomNavigationBarType.fixed,
                backgroundColor: bottomNavigationBGColor)),
        debugShowCheckedModeBanner: false,
        home: const SignIn());
  }
}
