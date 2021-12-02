import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:reservee_app/core/exports.dart';
import 'package:flutter/cupertino.dart';
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
          inactiveColorPrimary: AppColors.silver,
          icon: CustomNavBarIcon(
            title: 'Home',
            icon: SvgPicture.asset('home_active'.svg),
          ),
          inactiveIcon: CustomNavBarIcon(
            title: 'Home',
            color: AppColors.silver,
            icon: SvgPicture.asset('home_inactive'.svg),
          ),
        ),
        PersistentBottomNavBarItem(
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
          activeColorPrimary: AppColors.orange,
          icon: CustomNavBarIcon(
            title: 'Location',
            icon: SvgPicture.asset('location_active'.svg),
          ),
          inactiveIcon: CustomNavBarIcon(
            title: 'Location',
            color: AppColors.grey,
            icon: SvgPicture.asset('location_inactive'.svg),
          ),
          inactiveColorPrimary: AppColors.silver,
        ),
        PersistentBottomNavBarItem(
          routeAndNavigatorSettings: const RouteAndNavigatorSettings(
            onGenerateRoute: onGenerateRoute,
          ),
          activeColorPrimary: AppColors.orange,
          inactiveColorPrimary: AppColors.silver,
          icon: CustomNavBarIcon(
            title: 'Location',
            icon: SvgPicture.asset('location_active'.svg),
          ),
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

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, this.onPressed}) : super(key: key);
  final Function? onPressed;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          _isLoading = true;
        });

        if (widget.onPressed != null) {
          await widget.onPressed!();
        }

        setState(() {
          _isLoading = false;
        });
      },
      child: _isLoading
          ? const CircularProgressIndicator()
          : const CustomText('Custom text'),
    );
  }
}

class CustomNavBarIcon extends StatelessWidget {
  final Widget icon;
  final String title;
  final Color? color;
  const CustomNavBarIcon(
      {Key? key, required this.icon, required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        children: [
          icon,
          SizedBox(height: 5.h),
          CustomText(
            title,
            fontSize: 12,
            color: color ?? AppColors.orange,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
