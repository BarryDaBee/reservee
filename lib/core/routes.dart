import 'package:flutter/material.dart';
import 'package:reservee_app/ui/views/all_restaurants_view.dart';
import 'package:reservee_app/ui/views/base_view.dart';
import 'package:reservee_app/ui/views/change_password_view.dart';
import 'package:reservee_app/ui/views/home_view.dart';
import 'package:reservee_app/ui/views/login_view.dart';
import 'package:reservee_app/ui/views/onboarding_view.dart';
import 'package:reservee_app/ui/views/reset_password_view.dart';
import 'package:reservee_app/ui/views/sign_up_view.dart';
import 'package:reservee_app/ui/views/splash_view.dart';
import 'route_names.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case CHANGE_PASSWORD_VIEW:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ChangePasswordView());
    case BASE_VIEW:
      return MaterialPageRoute(
          builder: (BuildContext context) => const BaseView());
    case ALL_RESTAURANTS_VIEW:
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const AllRestaurantsView());
    case LOGIN_VIEW:
      return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView());
    case ONBOARDING_VIEW:
      return MaterialPageRoute(
          builder: (BuildContext context) => const OnboardingView());
    case RESET_PASSWORD_VIEW:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ResetPasswordView());
    case SIGN_UP_VIEW:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpView());
    case SPLASH_VIEW:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView());
    case HOME_VIEW:
      return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (BuildContext context) => Container());
  }
}
