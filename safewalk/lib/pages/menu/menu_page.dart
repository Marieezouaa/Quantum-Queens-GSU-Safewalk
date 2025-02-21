import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/pages/menu/pages/faq.dart';
import 'package:tempsafewalk/pages/menu/pages/friends_page.dart';
import 'package:tempsafewalk/pages/menu/pages/inbox.dart';
import 'package:tempsafewalk/styles/global_themes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  Widget _settingsCategoryContainer(BuildContext context, String svgPath,
      String sectionTitle, Widget navigateTo) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => navigateTo,
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
      child: Center(
        child: Container(
          height: 60,
          width: 350,
          decoration: BoxDecoration(
            color: ThemeManager().dynamicPrimaryColor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  svgPath,
                  semanticsLabel: 'Dart Logo',
                ),
              ),
              Expanded(
                  child: Text(
                sectionTitle,
                style: GoogleFonts.oxygen(
                    fontSize: 16, color: ThemeManager().dynamicOnPrimaryColor),
              )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                  "assets/images/nxt-arrow.svg",
                  semanticsLabel: 'Dart Logo',
                ),
              )
            ],
          ),
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
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child:  Padding(
                padding: const EdgeInsets.only(left: 30.0, top:55),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowLeft01,
                      color: onSurface,
                      size: 25.0,
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 0, bottom: 9),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: onSurface,
                  ),
                ),
              ),
            ),
            GestureDetector(
                child: Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 46),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "View Profile",
                    style: GoogleFonts.oxygen(
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedPencilEdit01,
                    color: onSurface,
                    size: 12.0,
                  )
                ],
              ),
            )),
            _settingsCategoryContainer(
                context,
                MediaQuery.platformBrightnessOf(context) == Brightness.light
                    ? "assets/images/messages.svg"
                    : "assets/images/messages-blk.svg",
                "Inbox",
                const Inbox()),
            const SizedBox(
              height: 25,
            ),
            _settingsCategoryContainer(context, "assets/images/add-friend.svg",
                "Add Friend", const Friends()),
            const SizedBox(
              height: 25,
            ),
            _settingsCategoryContainer(
                context, "assets/images/gear.svg", "Settings", const SettingsPage()),
            const SizedBox(
              height: 25,
            ),
            _settingsCategoryContainer(context, "assets/images/faq.svg",
                "Help & Feedback", const FAQ()),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 45.0),
                child: Container(
                  height: 60,
                  width: 350,
                  decoration: BoxDecoration(
                    color: ThemeManager().dynamicPrimaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          "assets/images/logout.svg",
                          semanticsLabel: 'Dart Logo',
                        ),
                      ),
                      Text(
                        "Logout",
                        style: GoogleFonts.oxygen(
                            fontSize: 16,
                            color: ThemeManager().dynamicOnPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThemeManager with WidgetsBindingObserver {
  static final ThemeManager _instance = ThemeManager._internal();
  factory ThemeManager() => _instance;
  ThemeManager._internal() {
    WidgetsBinding.instance.addObserver(this);
  }

  Brightness _brightness =
      WidgetsBinding.instance.platformDispatcher.platformBrightness;

  Brightness get brightness => _brightness;

  Color get dynamicPrimaryColor {
    return _brightness == Brightness.dark
        ? GlobalThemeData.darkColorScheme.primary
        : GlobalThemeData.lightColorScheme.primary;
  }

  Color get dynamicOnPrimaryColor {
    return _brightness == Brightness.dark
        ? GlobalThemeData.darkColorScheme.onPrimary
        : GlobalThemeData.lightColorScheme.onPrimary;
  }

  Color get dynamicSecondaryColor {
    return _brightness == Brightness.dark
        ? GlobalThemeData.darkColorScheme.secondary
        : GlobalThemeData.lightColorScheme.secondary;
  }

  Color get dynamicOnSecondaryColor {
    return _brightness == Brightness.dark
        ? GlobalThemeData.darkColorScheme.onSecondary
        : GlobalThemeData.lightColorScheme.onSecondary;
  }

  @override
  void didChangePlatformBrightness() {
    _brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
  }
}
