import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class BookmarkModal extends StatefulWidget {
  final Function(String address, String nickname, IconData icon) onSave;

  const BookmarkModal({
    Key? key,
    required this.onSave,
  }) : super(key: key);

  @override
  State<BookmarkModal> createState() => _BookmarkModalState();
}

class _BookmarkModalState extends State<BookmarkModal> {
  final TextEditingController addressController = TextEditingController();
  final TextEditingController nicknameController = TextEditingController();
  IconData selectedIcon = HugeIcons.strokeRoundedBook02;
  int selectedIconIndex = 0;

  final List<IconData> icons = [
    HugeIcons.strokeRoundedBook02,
    HugeIcons.strokeRoundedPizza02,
    HugeIcons.strokeRoundedBookmark02,
    HugeIcons.strokeRoundedLaptop,
    HugeIcons.strokeRoundedCar01,
  ];

  Widget _bookmarkIcon(IconData iconData, int index) {
    final bool isSelected = selectedIconIndex == index;
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;

    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIconIndex = index;
            selectedIcon = iconData;
          });
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: isSelected ? secondaryColor : primaryColor,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: HugeIcon(
              icon: iconData,
              color: isSelected ? primaryColor : secondaryColor,
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
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        style: GoogleFonts.oxygen(
          color: Theme.of(context).colorScheme.onPrimary,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          hintText: hint,
          hintStyle: GoogleFonts.oxygen(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;
    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;

    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 400,
        height: 340,
        decoration: BoxDecoration(
          color: surface,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Text(
                "Add Bookmark",
                style: GoogleFonts.oxygen(
                  color: onSurface,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              _buildTextField(addressController, "Address"),
              const SizedBox(height: 25),
              _buildTextField(nicknameController, "Nickname"),
              const SizedBox(height: 14),
              Text(
                "Pick An Icon",
                style: GoogleFonts.oxygen(
                  color: onSurface,
                  fontSize: 16.5,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  icons.length,
                  (index) => _bookmarkIcon(icons[index], index),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (addressController.text.isNotEmpty &&
                      nicknameController.text.isNotEmpty) {
                    widget.onSave(
                      addressController.text,
                      nicknameController.text,
                      selectedIcon,
                    );
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  height: 35,
                  width: 110,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Save",
                      style: GoogleFonts.oxygen(
                        color: onSecondaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
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