import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/data/school_buildings.dart';

class CustomSearchContainer extends StatefulWidget {
  const CustomSearchContainer({Key? key}) : super(key: key);

  @override
  State<CustomSearchContainer> createState() => _CustomSearchContainerState();
}

class _CustomSearchContainerState extends State<CustomSearchContainer> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isExpanded = false;

  final List<String> searchList = SchoolBuildingList;

  List<String> _getSuggestions(String query) {
    return query.isEmpty
        ? []
        : searchList
            .where((item) => item.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isExpanded = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color onPrimaryColor = Theme.of(context).colorScheme.onPrimary;

    final Color secondaryColor = Theme.of(context).colorScheme.secondary;
    final Color onSecondaryColor = Theme.of(context).colorScheme.onSecondary;

    final suggestions = _getSuggestions(_searchController.text);

    return Stack(
      clipBehavior: Clip.none, // Allow overflow
      children: [
        // Main Search Bar
        Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Container(
              width: 400,
              height: 65,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedSearch01,
                      color: onPrimaryColor,
                      size: 24.0,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        focusNode: _focusNode,
                        style: GoogleFonts.oxygen(
                          fontSize: 17,
                          color: onSurface,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: "Where are you going?",
                          hintStyle: GoogleFonts.oxygen(
                            fontSize: 17,
                            color: onSurface,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                    if (_searchController.text.isNotEmpty)
                      IconButton(
                        icon: Icon(Icons.clear, color: onSurface),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                        },
                      )
                    else
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: HugeIcon(
                            icon: HugeIcons.strokeRoundedMic01,
                            color: onPrimaryColor,
                            size: 26.0,
                          ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),

        if (_isExpanded && suggestions.isNotEmpty)
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(20),
              color: surface,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200, // Limit max height
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        suggestions[index],
                        style: GoogleFonts.oxygen(
                          color: onSurface,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _searchController.text = suggestions[index];
                          _focusNode.unfocus();
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
