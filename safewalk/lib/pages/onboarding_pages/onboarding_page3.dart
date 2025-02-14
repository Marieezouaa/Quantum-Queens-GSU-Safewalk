import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {

  final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;


    return Scaffold(
      backgroundColor:surface,
      body: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 60),
            child: Image.asset("assets/images/safewalkstop.png"),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 200, left: 150),
              child: MediaQuery.platformBrightnessOf(context) == Brightness.light
                  ? Image.asset("assets/images/safewalkarrow.png")
                  : Image.asset("assets/images/safewalkarrowblk.png")),
          Padding(
            padding: const EdgeInsets.only(top: 480, left: 50),
            child: Text(
              "    How our app\n"
              "  promotes safety",
              style: GoogleFonts.roboto(
                color: onSurface,
                fontSize: 42,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 610, left: 25),
            child: Text(
              "         Lorem ipsum dolor sit amet, consectetur\n"
              "     adipiscing elit. Vestibulum porta ipsumLorem\n"
              "   ipsum dolor sit amet, consectetur adipiscing elit.\n"
              "                 Vestibulum porta ipsum",
              style: GoogleFonts.roboto(
                color: onSurface,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
