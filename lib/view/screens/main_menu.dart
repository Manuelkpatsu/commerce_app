import 'package:commerceapp/view/screens/account/account_screen.dart';
import 'package:commerceapp/view/screens/cart_screen.dart';
import 'package:commerceapp/view/screens/home_screen.dart';
import 'package:commerceapp/view/screens/sales_screen.dart';
import 'package:commerceapp/view/screens/search_screen.dart';
import 'package:commerceapp/view/widgets/custom_navbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(),
      SalesScreen(),
      CartScreen(),
      AccountScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Image.asset(
              'assets/images/navigation-bar-icons/home-active.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover),
          inactiveIcon: Image.asset(
              'assets/images/navigation-bar-icons/home.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover)),
      PersistentBottomNavBarItem(
          icon: Image.asset(
              'assets/images/navigation-bar-icons/search-active.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover),
          inactiveIcon: Image.asset(
              'assets/images/navigation-bar-icons/search.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover)),
      PersistentBottomNavBarItem(
          icon: Image.asset(
              'assets/images/navigation-bar-icons/sale-active.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover),
          inactiveIcon: Image.asset(
              'assets/images/navigation-bar-icons/sale.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover)),
      PersistentBottomNavBarItem(
          icon: Image.asset(
              'assets/images/navigation-bar-icons/cart-active.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover),
          inactiveIcon: Image.asset(
              'assets/images/navigation-bar-icons/cart.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover)),
      PersistentBottomNavBarItem(
          icon: Image.asset(
              'assets/images/navigation-bar-icons/account-active.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover),
          inactiveIcon: Image.asset(
              'assets/images/navigation-bar-icons/account.png',
              height: 20,
              width: 20,
              fit: BoxFit.cover))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView.custom(
        context,
        controller: _controller,
        screens: _buildScreens(),
        itemCount: 5,
        confineInSafeArea: true,
        handleAndroidBackButtonPress: true,
        stateManagement: true,
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        customWidget: CustomNavBarWidget(
            items: _navBarsItems(),
            onItemSelected: (index) {
              setState(() {
                _controller.index = index;
              });
            },
            selectedIndex: _controller.index),
      ),
    );
  }
}
