import 'package:flutter/material.dart';
import 'package:fumbaa/src/app/auth/pages/phone.page.dart';
import 'package:fumbaa/src/meta/meta.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SkOnboardingModel> pages = [
      SkOnboardingModel(
          title: "Welcome to Fumbaa",
          description:
              "We cannot wait for you to join the innovative gas provider. With the most competitive prices",
          imagePath: AppImages.WelcomeImage,
          titleColor: AppColors.textColor,
          descripColor: Colors.grey),
      SkOnboardingModel(
          title: "Lightning Fast Deliveries",
          description:
              "Order your gas on demand and it will be delivered within 40 minutes(or less). Guaranteed",
          imagePath: AppImages.DeliveryImage,
          titleColor: AppColors.textColor,
          descripColor: Colors.grey),
      SkOnboardingModel(
          title: "Quality Assured",
          description:
              "We do not compromise on quality. All out gas is obtained from official outlets and delivered straight to you.",
          imagePath: AppImages.EatingFood,
          titleColor: AppColors.textColor,
          descripColor: Colors.grey),
      SkOnboardingModel(
          title: "Let's get Started",
          description:
              "Enough talk. Dive in and see what wonders fumbaa gas has to offer. We promise you\"ll like it",
          imagePath: AppImages.CookingImage,
          titleColor: AppColors.textColor,
          descripColor: Colors.grey)
    ];
    return SKOnboardingScreen(
        pages: pages,
        bgColor: AppColors.backgroundColor,
        themeColor: AppColors.mainColor,
        skipClicked: (skipClicked) {},
        getStartedClicked: (s) => Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return PhonePage();
            })));
  }
}
