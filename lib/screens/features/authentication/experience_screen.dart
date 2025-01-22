import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_onboarding_flow/constants/gaps.dart';
import 'package:tiktok_onboarding_flow/constants/sizes.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/widgets/form_button.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/widgets/terms_of_use.dart';

class ExperienceScreen extends StatefulWidget {
  const ExperienceScreen({super.key});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  bool _isToggled = false;

  void _onChangeToggle(bool value) {
    setState(() {
      _isToggled = value;
    });
  }

  void _onNextButtonPressed() {
    Navigator.of(context).pop({
      'hasCustomizedExperience': _isToggled,
      'completedExperienceScreen': true,
    });
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
              'Customize your experience',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: Sizes.size28,
              ),
            ),
            Gaps.v24,
            Text(
              'Track where you see Twitter content across the web',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: Sizes.size20,
              ),
            ),
            Gaps.v16,
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Text(
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w600,
                        ),
                        "Twitter uses this data to personalize your experience. This web browsing history will never be stored with your name, email, or phone number.")),
                Expanded(
                  flex: 1,
                  child: Switch(
                    value: _isToggled, // bool 값
                    onChanged: (value) => _onChangeToggle(value),
                    // 선택적 스타일링
                    activeColor: Colors.white, // 켜졌을 때 색상
                    activeTrackColor: const Color(0xFF52B580), // 켜졌을 때 트랙 색상
                    inactiveThumbColor: Colors.grey, // 꺼졌을 때 색상
                    inactiveTrackColor: Colors.grey.shade300, // 꺼졌을 때 트랙 색상
                  ),
                )
              ],
            ),
            Gaps.v40,
            TermsOfUse(learnMore: true, others: false)
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: Sizes.size96,
        color: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size40,
        ),
        child: Center(
          child: FormButton(
            text: "Next",
            onPressed: _onNextButtonPressed,
            isActive: true,
          ),
        ),
      ),
    );
  }
}
