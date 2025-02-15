import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/pages/home_page/bookmark_modal.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({
    super.key, 
    required this.location,
    required this.onBookmarkAdded,
  });

  final TextEditingController location;
  final Function(String address, String nickname, IconData icon) onBookmarkAdded;

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  void _showBookmarkModal() {
    showDialog(
      context: context,
      builder: (context) {
        return BookmarkModal(
          onSave: _handleBookmarkSave,
        );
      },
    );
  }

  void _handleBookmarkSave(String address, String nickname, IconData icon) {
    widget.onBookmarkAdded(address, nickname, icon);
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    return GestureDetector(
      onTap: _showBookmarkModal,
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
              const SizedBox(width: 10),
              Text(
                "Add New Location",
                style: GoogleFonts.oxygen(
                  color: onPrimaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}