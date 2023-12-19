
import 'package:bloc_fake_store_api/core/models/product.dart';
import 'package:bloc_fake_store_api/ui/screens/all_products/all_products_screen.dart';
import 'package:bloc_fake_store_api/ui/screens/login/login_screen.dart';
import 'package:bloc_fake_store_api/ui/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case AllProductsScreen.routeName:
        return MaterialPageRoute(builder: (_) => const AllProductsScreen());

      case ProductDetailsScreen.routeName:
        final args = settings.arguments as Product;
        return MaterialPageRoute(
            builder: (_) => ProductDetailsScreen(
              product: args,
            ));

      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
