import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:reservee_app/core/exports.dart';

import 'home_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({Key? key}) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  final PersistentTabController _controller = PersistentTabController();

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [
        HomeView(),
        HomeView(),
        HomeView(),
        HomeView(),
      ],
      backgroundColor: Colors.white,
      popAllScreensOnTapOfSelectedTab: true,
      navBarStyle: NavBarStyle.style3,
      onItemSelected: (_) {
        setState(() {});
      },
      items: [
        PersistentBottomNavBarItem(
            routeAndNavigatorSettings: const RouteAndNavigatorSettings(
              onGenerateRoute: onGenerateRoute,
            ),
            activeColorPrimary: AppColors.orange,
            icon: const Icon(Icons.home)),
        PersistentBottomNavBarItem(
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
          activeColorPrimary: AppColors.orange,
          icon: const Icon(Icons.home),
        ),
        PersistentBottomNavBarItem(
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
          activeColorPrimary: AppColors.orange,
          icon: const Icon(Icons.home),
        ),
        PersistentBottomNavBarItem(
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
          activeColorPrimary: AppColors.orange,
          icon: const Icon(Icons.home),
        ),
      ],
      popActionScreens: PopActionScreensType.all,
    );
  }
}
