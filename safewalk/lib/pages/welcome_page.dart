import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tempsafewalk/pages/onboarding_pages/onboarding_stage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {


  final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;


    return Scaffold(
      backgroundColor: surface, //Surface
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Welcome Text and Image
            const Text("Welcome to", style: TextStyle(fontSize: 24),),
            Text(
              "SafeWalk",
              style: GoogleFonts.fredoka(
                  color: onSurface, //onSurface
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            const Image(
              image: AssetImage("assets/images/saftwalklogo.png"),
              height: 300,
              width: 300,
            ),

            //Continue Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const OnboardingStage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Center(
                  child: Text(
                    "Continue",
                    style: GoogleFonts.lato(
                        color: onSecondaryColor, //onSurface
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
