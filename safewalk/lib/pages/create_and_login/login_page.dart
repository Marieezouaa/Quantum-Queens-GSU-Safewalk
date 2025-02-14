import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/pages/create_and_login/create_account.dart';
import 'package:tempsafewalk/pages/home_page/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool onChange() {
    return true;
  }

  Widget _inputFeild(
      TextEditingController controller,
      String? hintTextString,
      bool makeTextInvisible,
      double containerHeight,
      double containerWidth,
      IconData? icon,
      IconData? secondIcon) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;

    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 2, top: 16, bottom: 16),
                child: HugeIcon(
                  icon: icon!,
                  color: secondaryColor,
                  size: 26.0,
                ),
              ),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: makeTextInvisible,
                decoration: InputDecoration(
                  hintText: hintTextString,
                  hintStyle: GoogleFonts.montserrat(
                    color: onPrimaryColor,
                    fontSize: 16,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(5)), // Rounded corners
                    borderSide: BorderSide.none, // No visible border line
                  ),
                ),
              ),
            ),
            if (secondIcon != null)
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 28, top: 16, bottom: 16),
                child: HugeIcon(
                  icon: secondIcon!,
                  color: secondaryColor,
                  size: 26.0,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;

    return Scaffold(
      backgroundColor: surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Student\nLogin",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              //Names Feilds

              //Email Feild

              _inputFeild(emailController, "School Email", false, 60, 380,
                  HugeIcons.strokeRoundedMail01, null),
              const SizedBox(
                height: 20,
              ),
              //Password Feilds
              _inputFeild(
                  passwordController,
                  "Enter Password",
                  true,
                  60,
                  380,
                  HugeIcons.strokeRoundedSquareLock02,
                  HugeIcons.strokeRoundedEye),

              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  //TODO: We replace navigator push with credential verification
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          HomePage(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 380,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: GoogleFonts.lato(
                          color: onSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const CreateAccount(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an Account? ",
                        style: GoogleFonts.lato(
                          color: onSurface,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: 'Create an Account\n',
                            style: GoogleFonts.lato(
                              color: secondaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

//this logic needs to be changed !!!
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const CreateAccount(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                        text: 'Forgot Your Password?',
                        style: GoogleFonts.lato(
                          color: secondaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
