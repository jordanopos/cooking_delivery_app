import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fumbaa/src/app/main/cart/pages/cart.page.dart';
import 'package:fumbaa/src/app/main/home/pages/home.page.dart';
import 'package:fumbaa/src/app/main/offers/pages/offers.page.dart';
import 'package:fumbaa/src/app/main/orders/pages/order.page.dart';
import 'package:fumbaa/src/app/main/profile/pages/profile.page.dart';
import 'package:fumbaa/src/meta/meta.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int pageIndex = 0;

  late PageController _controller;

  List<Widget> pageList = <Widget>[
    HomePage(),
    OffersPage(),
    OrdersPage(),
    ProfilePage()
  ];

  Color? getColor(int index) {
    return index == pageIndex ? AppColors.mainColor : Colors.grey[700];
  }

  @override
  void initState() {
    _controller = PageController(keepPage: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.backgroundColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: AppColors.backgroundColor,
        statusBarIconBrightness: Brightness.dark));
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "ojangolejordan",
          backgroundColor: AppColors.mainColor,
          child: Center(
            child: SvgPicture.asset(AppImages.ShoppingCartIcon,
                color: Colors.white),
          ),
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (conext) {
            return CartPage();
          })),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 13,
          selectedItemColor: AppColors.mainColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: pageIndex,
          onTap: (int newValue) {
            setState(() {
              pageIndex = newValue;
            });
            _controller.animateToPage(newValue,
                curve: Curves.easeInOut, duration: Duration(milliseconds: 300));
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: "Home",
              icon: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Bouncing(
                  onPress: () {},
                  child: SvgPicture.asset(AppImages.HomeIcon,
                      height: 20, color: getColor(0)),
                ),
              ),
              //    label: 'Home',
            ),
            BottomNavigationBarItem(
              label: "Offers",

              icon: Bouncing(
                onPress: () {},
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: SvgPicture.asset(AppImages.BellIcon,
                      height: 20, color: getColor(1)),
                ),
              ),
              //     label: 'Search',
            ),
            BottomNavigationBarItem(
              label: "Orders",

              icon: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SvgPicture.asset(AppImages.OrderIcon,
                    height: 20, color: getColor(2)),
              ),
              //       label: 'Library',
            ),
            BottomNavigationBarItem(
              label: "Profile",

              icon: Padding(
                padding: const EdgeInsets.only(top: 3),
                child: SvgPicture.asset(AppImages.ProfileIcon,
                    height: 20, color: getColor(3)),
              ),
              //     label: 'Profile',
            ),
          ],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: pageList,
        ),
      ),
    );
  }
}
