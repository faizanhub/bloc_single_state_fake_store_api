import 'dart:io';

import 'package:bloc_fake_store_api/routes.dart';
import 'package:bloc_fake_store_api/ui/screens/all_products/all_products_screen.dart';
import 'package:bloc_fake_store_api/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global =  MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          title: 'Bloc Fake Store API Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          // home: const AllProductsScreen(),
          initialRoute: LoginScreen.routeName,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//       (X509Certificate cert, String host, int port) => true;
//   }
// }
