import 'package:flutter/material.dart';
import 'package:tiktok_onboarding_flow/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const FormButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size16,
            horizontal: Sizes.size24,
          ),
          decoration: BoxDecoration(
              color: Color(0xFF101418),
              borderRadius: BorderRadius.circular(Sizes.size40)),
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: Sizes.size20)),
        ),
      ),
    );
  }
}
