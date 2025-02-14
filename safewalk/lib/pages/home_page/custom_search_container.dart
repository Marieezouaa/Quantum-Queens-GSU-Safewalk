import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomSearchContainer extends StatefulWidget {
  const CustomSearchContainer({Key? key}) : super(key: key);

  @override
  State<CustomSearchContainer> createState() => _CustomSearchContainerState();
}

class _CustomSearchContainerState extends State<CustomSearchContainer> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isExpanded = false;

  final List<String> searchList = [
    "25 Park Place",
    "40 Pryor Building",
    "55 Park Place",
    "75 Piedmont",
    "Aderhold Learning Center",
    "Alpharetta Center II",
    "Alumni Center",
    "Andrew Young School of Policy Studies",
    "Aquatics Building",
    "Classroom South",
    "College of Education",
    "Courtland Building",
    "Dahlberg Hall",
    "General Classroom Building",
    "Haas-Howell Building",
    "Helen M. Aderhold Learning Center",
    "Langdale Hall",
    "Library North",
    "Library South",
    "Natural Science Center",
    "One Park Place",
    "Parker H. Petit Science Center",
    "Rialto Center for the Arts",
    "Sparks Hall",
    "Sports Arena",
    "Standard Building",
    "Student Center East",
    "Student Center West",
    "Student Recreation Center",
    "University Bookstore Building",
    "University Lofts",
    "Urban Life Building"
];

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
          child: Container(
            width: 320,
            height: 65, 
            decoration: BoxDecoration(
              color: surface,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedSearch01,
                    color: onSurface,
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
                      icon:  Icon(Icons.clear, color:onSurface),
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
                        icon: HugeIcons.strokeRoundedVolumeHigh,
                        color: surface,
                        size: 24.0,
                      ),
                    ),
                ],
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
