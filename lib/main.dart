import 'package:flutter/material.dart';
import 'package:fumbaa/src/app/auth/auth.dart';
import 'package:fumbaa/src/app/main/home/pages/home.page.dart';
import 'package:fumbaa/src/meta/meta.dart';
import 'package:fumbaa/src/meta/widgets/navpage.widget.dart';

void main() {
  runApp(Fumbaa());
}

class Fumbaa extends StatelessWidget {
  const Fumbaa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: AppFonts.Regular),
        title: "Fumbaa",
        home: OnBoardingPage());
  }
}
