import 'package:flutter/material.dart';
import 'package:phenx/presentation/routers/routes.dart';
import 'package:phenx/presentation/screens/dashboard/dashboard.dart';
import 'package:phenx/presentation/screens/forgotPassword/forgot_password.dart';
import 'package:phenx/presentation/screens/login/login.dart';
import 'package:phenx/presentation/screens/registration/registration_screen.dart';
import 'package:phenx/presentation/screens/splash/splash_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    // final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.registration:
        return MaterialPageRoute(
          builder: (_) => const RegistrationScreen(),
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginUserIdScreen(),
        );
      case Routes.dashboard:
        return MaterialPageRoute(
          builder: (_) => const Dashboard(),
        );
      case Routes.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => const ForgotPassword(),
        );
      // case Routes.verifyEmailScreen:
      //   return MaterialPageRoute(
      //     builder: (_) => const VerifyEmailScreen(),
      //   );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text("Empty Screen"),
            ),
          ),
        );
    }
  }
}
