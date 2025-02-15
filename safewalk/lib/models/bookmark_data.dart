// lib/models/bookmark_data.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class BookmarkData {
  final String address;
  final String nickname;
  final IconData icon;

  BookmarkData({
    required this.address,
    required this.nickname,
    required this.icon,
  });
}

class SavedBookmarkContainer extends StatelessWidget {
  final BookmarkData bookmark;
  final VoidCallback onTap;

  const SavedBookmarkContainer({
    Key? key,
    required this.bookmark,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              HugeIcon(
                icon: bookmark.icon,
                color: const Color(0xff4BB7F3),
                size: 35.0,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      bookmark.nickname,
                      style: GoogleFonts.oxygen(
                        color: onPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      bookmark.address,
                      style: GoogleFonts.oxygen(
                        color: onPrimaryColor.withOpacity(0.7),
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}