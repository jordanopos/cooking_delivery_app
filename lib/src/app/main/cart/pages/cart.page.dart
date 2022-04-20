import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fumbaa/src/app/main/home/pages/home.page.dart';
import 'package:fumbaa/src/meta/meta.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "ojangolejordan",
      child: Scaffold(
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset(AppImages.GetBackIcon),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: AppColors.backgroundColor,
            title: headerTitle("Cart", padding: EdgeInsets.only())),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.ShoppingCartIcon, height: 90),
                  Container(height: 30),
                  Text("Your Cart is Empty",
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.textColor,
                          fontFamily: AppFonts.Medium)),
                  Container(height: 5),
                  Text("Add Items to your cart then check back here",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textColor,
                          fontFamily: AppFonts.Regular))
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Spacer(),
                  Container(
                      color: Colors.white,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(children: [
                          Text("Total: UGX 0",
                              style: TextStyle(
                                  fontFamily: AppFonts.Medium, fontSize: 16)),
                          Spacer(),
                          Bouncing(
                            onPress: () {},
                            child: new Container(
                              height: 30.0,
                              decoration: new BoxDecoration(
                                  color: AppColors.mainColor,
                                  borderRadius: new BorderRadius.all(
                                      Radius.circular(24.0))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: new Center(
                                  child: new Text(
                                    'Send Order',
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                        fontFamily: AppFonts.Medium),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
