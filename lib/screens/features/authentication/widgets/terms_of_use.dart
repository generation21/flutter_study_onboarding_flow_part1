import 'package:flutter/material.dart';
import 'package:tiktok_onboarding_flow/constants/sizes.dart';

class TermsOfUse extends StatelessWidget {
  final bool learnMore;
  final bool others;
  const TermsOfUse({super.key, required this.learnMore, required this.others});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: Sizes.size14,
        ),
        children: [
          const TextSpan(
            text: "By signing up, you agree to our ",
          ),
          TextSpan(
            text: "Terms",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: ", "),
          TextSpan(
            text: "Privacy Policy",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const TextSpan(text: ", and "),
          TextSpan(
            text: "Cookie Use",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (learnMore)
            TextSpan(
                text:
                    ". Twitter may use your contact information, including your email address and phone number for purposed outlined in our Privacy Policy"),
          if (others)
            TextSpan(
              text:
                  ", like keeping your account secure and personalizing our services, including ads",
            ),
          if (learnMore) const TextSpan(text: ". "),
          if (learnMore)
            TextSpan(
              text: "Learn more",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          if (others)
            TextSpan(
                text:
                    "Others will be able to find you by email or phone number, when provided, unless you choose otherwise "),
          if (others)
            TextSpan(
              text: "here",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
