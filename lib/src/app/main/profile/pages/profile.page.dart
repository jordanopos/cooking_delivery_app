import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fumbaa/src/app/main/home/pages/home.page.dart';
import 'package:fumbaa/src/meta/meta.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          title: headerTitle("My Account")),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            CircleAvatar(
                backgroundColor: AppColors.lightColor,
                radius: 70,
                child: Center(
                    child: SvgPicture.asset(
                  AppImages.ProfileIcon,
                  height: 50,
                ))),
            Container(height: 10),
            Text("Ojangole Jordan",
                style: TextStyle(fontFamily: AppFonts.Medium, fontSize: 20)),
            Container(height: 3),
            Text("+256771866101", style: TextStyle(fontSize: 15)),
            Container(height: 30),
            ListView(
              shrinkWrap: true,
              children: [
                TileItem(icon: AppImages.HelpIcon, name: "Help"),
                TileItem(icon: AppImages.InfoIcon, name: "About Fumbaa"),
                TileItem(icon: AppImages.StarIcon, name: "Rate App"),
                TileItem(icon: AppImages.ShareIcon, name: "Share App"),
              ],
            )
          ])),
    );
  }
}

class TileItem extends StatelessWidget {
  final String name;
  final String icon;
  const TileItem({Key? key, required this.icon, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(icon, color: Colors.black),
      title: Text(name),
      trailing: SvgPicture.asset(AppImages.FrontIcon),
    );
  }
}
