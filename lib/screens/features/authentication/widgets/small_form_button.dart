import 'package:flutter/material.dart';
import 'package:tiktok_onboarding_flow/constants/sizes.dart';

class SmallFormButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;

  const SmallFormButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isActive ? onPressed : null,
      child: AnimatedDefaultTextStyle(
        duration: const Duration(milliseconds: 300),
        style: TextStyle(
          color: isActive ? Colors.white : Colors.white.withAlpha(100),
          fontWeight: FontWeight.w900,
          fontSize: Sizes.size20,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size24,
          ),
          decoration: BoxDecoration(
              color: isActive ? Color(0xFF101418) : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(Sizes.size40)),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
