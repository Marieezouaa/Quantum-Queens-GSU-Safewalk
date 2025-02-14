import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/pages/home_page/bookmark_modal.dart';

class BookmarkButton extends StatefulWidget {
  BookmarkButton({super.key, required this.location});

  TextEditingController location;

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
   TextEditingController addressController = TextEditingController();
   TextEditingController nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {


final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;



    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return BookmarkModal(addressController: addressController, nicknameController: nicknameController,);
          },
        );
      },
      child: Container(
        height: 62,
        width: 350,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              const HugeIcon(
                icon: HugeIcons.strokeRoundedAddSquare,
                color: Color(0xff4BB7F3),
                size: 35.0,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Add New Location",
                style: GoogleFonts.oxygen(
                    color: onPrimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
