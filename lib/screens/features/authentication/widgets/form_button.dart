import 'package:flutter/material.dart';
import 'package:tiktok_onboarding_flow/constants/sizes.dart';

class FormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color foregroundColor;
  final Color backgroundColor;

  final bool isActive;

  const FormButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isActive,
    this.foregroundColor = Colors.white,
    this.backgroundColor = const Color(0xFF101418),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onPressed : null,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size16,
            horizontal: Sizes.size24,
          ),
          decoration: BoxDecoration(
              color: isActive ? backgroundColor : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(Sizes.size40)),
          child: Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: isActive ? foregroundColor : Colors.grey.shade800,
                  fontWeight: FontWeight.w900,
                  fontSize: Sizes.size20)),
        ),
      ),
    );
  }
}
