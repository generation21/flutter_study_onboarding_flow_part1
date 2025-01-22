import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_onboarding_flow/constants/gaps.dart';
import 'package:tiktok_onboarding_flow/constants/sizes.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/login_screen.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/signup_form_screen.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/widgets/form_button.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/widgets/social_auth_button.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/widgets/terms_of_use.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onCreateAccountPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUpFormScreen(),
      ),
    );
  }

  void _onLogInPressed(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FaIcon(FontAwesomeIcons.twitter,
            color: Theme.of(context).primaryColor, size: Sizes.size36),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.v80,
            Text(
              'See what\'s happening in the world right now.',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: Sizes.size28,
              ),
            ),
            Gaps.v24,
            SocialAuthButton(
              icon: FaIcon(FontAwesomeIcons.google),
              text: "Continue with Google",
              onPressed: () {},
            ),
            Gaps.v16,
            SocialAuthButton(
              icon: FaIcon(FontAwesomeIcons.apple),
              text: "Continue with Apple",
              onPressed: () {},
            ),
            Gaps.v16,
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.grey.shade400,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            Gaps.v16,
            FormButton(
              text: "Create account",
              onPressed: () => _onCreateAccountPressed(context),
              isActive: true,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size96 * 2,
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TermsOfUse(learnMore: false, others: false),
              Gaps.v16,
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizes.size16,
                  ),
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                    ),
                    TextSpan(
                      text: "Log in",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => _onLogInPressed(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
