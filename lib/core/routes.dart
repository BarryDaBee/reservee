import 'package:flutter/material.dart';
import 'package:reservee_app/ui/views/all_restaurants_view.dart';
import 'package:reservee_app/ui/views/base_view.dart';
import 'package:reservee_app/ui/views/change_password_view.dart';
import 'package:reservee_app/ui/views/home_view.dart';
import 'package:reservee_app/ui/views/login_view.dart';
import 'package:reservee_app/ui/views/notification_view.dart';
import 'package:reservee_app/ui/views/onboarding_view.dart';
import 'package:reservee_app/ui/views/reserve_space_view.dart';
import 'package:reservee_app/ui/views/reset_password_view.dart';
import 'package:reservee_app/ui/views/restaurant_info_view.dart';
import 'package:reservee_app/ui/views/sign_up_view.dart';
import 'package:reservee_app/ui/views/splash_view.dart';

import 'route_names.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case changePasswordView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ChangePasswordView());
    case baseView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const BaseView());
    case allRestaurantView:
      return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) => const AllRestaurantsView());
    case loginView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView());
    case restaurantInfoView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const RestaurantInfoView());
    case onboardingView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const OnboardingView());
    case resetPasswordView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ResetPasswordView());
    case signupView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpView());
    case splashView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView());
    case homeView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView());
    case notificationView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const NotificationView());
    case reserveSpaceView:
      return MaterialPageRoute(
          builder: (BuildContext context) => const ReserveSpaceView());
    default:
      return MaterialPageRoute(builder: (BuildContext context) => Container());
  }
}
