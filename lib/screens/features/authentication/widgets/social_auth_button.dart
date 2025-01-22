import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_onboarding_flow/constants/gaps.dart';
import 'package:tiktok_onboarding_flow/constants/sizes.dart';

class SocialAuthButton extends StatelessWidget {
  final String text;
  final FaIcon icon;
  final VoidCallback onPressed;

  const SocialAuthButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: Sizes.size1,
            ),
            borderRadius: BorderRadius.circular(
              Sizes.size40,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size16,
            horizontal: Sizes.size24,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              Gaps.h14,
              Text(text,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: Sizes.size20,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
