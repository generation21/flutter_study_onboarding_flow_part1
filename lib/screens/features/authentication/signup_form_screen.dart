import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_onboarding_flow/constants/gaps.dart';
import 'package:tiktok_onboarding_flow/constants/sizes.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/experience_screen.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/widgets/form_button.dart';
import 'package:tiktok_onboarding_flow/screens/features/authentication/widgets/small_form_button.dart';

class SignUpFormScreen extends StatefulWidget {
  const SignUpFormScreen({super.key});

  @override
  State<SignUpFormScreen> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  DateTime initialDate = DateTime.now();
  final TextEditingController _birthdayController = TextEditingController();
  bool _isDatePickerVisible = false;

  bool _isActiveNextButton = false;
  bool completedExperienceScreen = false;

  String _name = "";
  String _email = "";

  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
        _isDatePickerVisible = false;
      });
    });
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
        _isDatePickerVisible = false;
      });
    });
    _isValidFormFunction();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isDatePickerVisible = false;
    });
  }

  void _onDatePickerTap() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isDatePickerVisible = true;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _birthdayController.dispose();
    super.dispose();
  }

  bool _isValidName() {
    return _name.isNotEmpty;
  }

  bool _isValidEmail() {
    if (_email.isEmpty) return false;
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(_email);
  }

  bool _isValidBirthday() {
    return _birthdayController.text.isNotEmpty;
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
    _isValidFormFunction();
  }

  void _isValidFormFunction() {
    if (_isValidName() && _isValidEmail() && _isValidBirthday()) {
      setState(() {
        _isActiveNextButton = true;
      });
      return;
    }

    setState(() {
      _isActiveNextButton = false;
    });
  }

  void _onNextButtonPressed() async {
    if (_isActiveNextButton) {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExperienceScreen()),
      );

      if (result != null) {
        setState(() {
          completedExperienceScreen = result['completedExperienceScreen'];
          _isDatePickerVisible = false;
          FocusScope.of(context).unfocus();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: FaIcon(FontAwesomeIcons.twitter,
              color: Theme.of(context).primaryColor, size: Sizes.size36),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v80,
              Text(
                'Create your account',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: Sizes.size28,
                ),
              ),
              Gaps.v20,
              Column(
                children: [
                  TextField(
                    autocorrect: false,
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: "Name",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      suffixIcon: _isValidName()
                          ? FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                              size: Sizes.size28,
                            )
                          : null,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  Gaps.v16,
                  TextField(
                    autocorrect: false,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      suffixIcon: _isValidEmail()
                          ? FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                              size: Sizes.size28,
                            )
                          : null,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  Gaps.v16,
                  TextField(
                    readOnly: true,
                    showCursor: true,
                    onTap: _onDatePickerTap,
                    controller: _birthdayController,
                    decoration: InputDecoration(
                      hintText: "Date of birth",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      suffixIcon: _isValidBirthday()
                          ? FaIcon(
                              FontAwesomeIcons.solidCircleCheck,
                              color: Colors.green,
                              size: Sizes.size28,
                            )
                          : null,
                    ),
                    cursorColor: Theme.of(context).primaryColor,
                  ),
                  if (_isDatePickerVisible)
                    Padding(
                      padding: const EdgeInsets.only(top: Sizes.size8),
                      child: Text(
                        "This will not be shown publicly. Confirm your own age, even if this account is for a business, a pet, or something else.",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: Sizes.size14,
                        ),
                      ),
                    ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: Sizes.size96 * 4,
          color: Colors.white,
          elevation: 0,
          child: SafeArea(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                MediaQuery.of(context).viewInsets.bottom > 0 &&
                        !_isDatePickerVisible
                    ? Positioned(
                        bottom: MediaQuery.of(context).viewInsets.bottom +
                            Sizes.size8,
                        left: Sizes.size20,
                        child: Text(
                          "Use phone instead",
                          textAlign: TextAlign.left,
                        ),
                      )
                    : SizedBox.shrink(),
                completedExperienceScreen
                    ? FormButton(
                        text: "Sign up",
                        onPressed: () {},
                        isActive: true,
                        backgroundColor: Theme.of(context).primaryColor,
                      )
                    : Positioned(
                        bottom: _isDatePickerVisible
                            ? (Sizes.size96 * 2 + Sizes.size10)
                            : MediaQuery.of(context).viewInsets.bottom,
                        right: Sizes.size20,
                        child: SmallFormButton(
                          text: "Next",
                          onPressed: _onNextButtonPressed,
                          isActive: _isActiveNextButton,
                        ),
                      ),
                _isDatePickerVisible
                    ? Positioned(
                        left: 0,
                        right: 0,
                        bottom: Sizes.size96 * 2 + Sizes.size4,
                        child: Container(
                          height: 1,
                          color: Colors.grey.shade300,
                        ),
                      )
                    : const SizedBox.shrink(),
                _isDatePickerVisible
                    ? SizedBox(
                        height: Sizes.size96 * 2,
                        child: CupertinoDatePicker(
                          backgroundColor: Colors.white,
                          onDateTimeChanged: _setTextFieldDate,
                          mode: CupertinoDatePickerMode.date,
                          maximumDate: initialDate,
                          initialDateTime: initialDate,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
