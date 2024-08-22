import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'package:store_app/widgets/onboarding_views_body.dart';

class OnboardingViews extends StatefulWidget {
  const OnboardingViews({super.key});

  @override
  State<OnboardingViews> createState() => _OnboardingViewsState();
}

class _OnboardingViewsState extends State<OnboardingViews> {
  final List<PageViewModel> onboardingViews = [
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
        imageAlignment: Alignment.center,
      ),
      image: Image.asset(
        "assets/images/welcome.gif",
      ),
      titleWidget: const Icon(FontAwesomeIcons.faceLaugh),
      body: "Hi,welcome in the online store",
    ),
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
        imageAlignment: Alignment.center,
      ),
      image: Image.asset("assets/images/products.gif"),
      titleWidget: const Icon(FontAwesomeIcons.bagShopping),
      body: "You can find all types of products in home screen",
    ),
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
        imageAlignment: Alignment.center,
      ),
      image: Image.asset("assets/images/category.gif"),
      titleWidget: const Icon(FontAwesomeIcons.magnifyingGlass),
      body:
          "We divided the products into categories to make the search process easier for you",
    ),
    PageViewModel(
      decoration: const PageDecoration(
        imageFlex: 2,
        imageAlignment: Alignment.center,
      ),
      image: Image.asset("assets/images/goodbye.gif"),
      titleWidget: const Icon(FontAwesomeIcons.handHoldingHeart),
      body: "I hope you enjoy,bye",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OnboardingViewsbody(onboardingViews: onboardingViews),
      ),
    );
  }
}
