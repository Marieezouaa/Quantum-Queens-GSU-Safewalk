import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(
                "Our Goal and \n    Solution",
                style: GoogleFonts.roboto(
                  color: onSurface,
                  fontSize: 42,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.only(left: 30.0),
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
            const SizedBox(height: 100),


            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Image.asset(
                "assets/images/saftwalklogo.png",
                scale: 0.52, 
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
