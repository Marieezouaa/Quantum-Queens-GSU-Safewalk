import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage4 extends StatelessWidget {
  const OnboardingPage4({super.key});

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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MediaQuery.platformBrightnessOf(context) == Brightness.light
                  ? Image.asset("assets/images/soswht.png")
                  : Image.asset("assets/images/sosblk.png"),
              const SizedBox(
                height: 90,
              ),
              Text(
                "Hovering SOS",
                style: GoogleFonts.montserrat(
                    color: onSurface,
                    fontSize: 25,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Lorem ipsum dolor sit amet,\n"
                "consectetur adipiscing elit.\n"
                "Vestibulum porta ipsum\n",
                style: GoogleFonts.montserrat(
                    color: onSurface,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
