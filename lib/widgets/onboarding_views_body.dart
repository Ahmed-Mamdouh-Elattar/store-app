import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:store_app/helper/navigation.dart';
import 'package:store_app/views/login_view.dart';

class OnboardingViewsbody extends StatelessWidget {
  const OnboardingViewsbody({
    super.key,
    required this.onboardingViews,
  });

  final List<PageViewModel> onboardingViews;

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      bodyPadding: const EdgeInsets.only(top: 32),
      pages: onboardingViews,
      done: const Text("Done"),
      onDone: () {
        Navigation().push(context, view: const LoginView());
      },
      next: const Text("Next"),
      skip: const Text("Skip"),
      showSkipButton: true,
    );
  }
}
