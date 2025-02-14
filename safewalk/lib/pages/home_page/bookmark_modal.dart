import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/styles/global_themes.dart';

// ignore: must_be_immutable
class BookmarkModal extends StatefulWidget {
  BookmarkModal(
      {super.key,
      required this.addressController,
      required this.nicknameController});

  TextEditingController addressController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();

  @override
  State<BookmarkModal> createState() => _BookmarkModalState();
}

class _BookmarkModalState extends State<BookmarkModal> {
  var iconColor = ThemeManager().dynamicSecondaryColor;
  var backgroundColor = ThemeManager().dynamicPrimaryColor;
  bool iconTapped = false;

  Widget _bookmarkIcon(IconData iconName) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: _iconSelected,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: backgroundColor, borderRadius: BorderRadius.circular(50)),
          child: Center(
            child: HugeIcon(
              icon: iconName,
              color: iconColor,
              size: 25.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint) {
    return Container(
      width: 320,
      height: 45,
      decoration: BoxDecoration(
        color: ThemeManager().dynamicPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.oxygen(
          color: ThemeManager().dynamicOnPrimaryColor,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          hintText: hint,
          hintStyle: GoogleFonts.oxygen(
            color: ThemeManager().dynamicOnPrimaryColor,
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void _iconSelected() {
    setState(() {
      iconTapped = true;
      if (iconTapped) {
        iconTapped = false;
        if (iconColor == ThemeManager().dynamicSecondaryColor &&
            backgroundColor == ThemeManager().dynamicPrimaryColor) {
          iconColor = ThemeManager().dynamicPrimaryColor;
          backgroundColor = ThemeManager().dynamicSecondaryColor;
        } else {
          iconColor = ThemeManager().dynamicSecondaryColor;
          backgroundColor = ThemeManager().dynamicPrimaryColor;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 400,
        height: 340,
        decoration: BoxDecoration(
            color: surface, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Text(
                "Add Bookmark",
                style: GoogleFonts.oxygen(
                  decoration: TextDecoration.none,
                  color: onSurface,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(widget.addressController, "Address"),
              const SizedBox(height: 25),
              _buildTextField(widget.nicknameController, "Nickname"),
              const SizedBox(height: 14),

              /******************** BOOKMARK ICONS **********************/
              Text(
                "Pick An Icon",
                style: GoogleFonts.oxygen(
                  decoration: TextDecoration.none,
                  color: onSurface,
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _bookmarkIcon(HugeIcons.strokeRoundedBook02),
                  _bookmarkIcon(
                    HugeIcons.strokeRoundedPizza02,
                  ),
                  _bookmarkIcon(
                    HugeIcons.strokeRoundedBookmark02,
                  ),
                  _bookmarkIcon(
                    HugeIcons.strokeRoundedLaptop,
                  ),
                  _bookmarkIcon(
                    HugeIcons.strokeRoundedCar01,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /********************* SAVE BUTTON ****************/
              GestureDetector(
                child: Container(
                  height: 35,
                  width: 110,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      "Save",
                      style: GoogleFonts.oxygen(
                          decoration: TextDecoration.none,
                          color: onSecondaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
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
