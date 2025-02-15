import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/models/bookmark_data.dart';
import 'package:tempsafewalk/pages/home_page/custom_search_container.dart';
import 'package:tempsafewalk/pages/home_page/incident_report_modal.dart';
import 'package:tempsafewalk/pages/menu/menu_page.dart';
import 'package:tempsafewalk/styles/templates/bookmark_container.dart';
import 'package:touch_assistive/touch_assistive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(33.75327, -84.38527);
  TextEditingController location = TextEditingController();
  Set<Circle> _circles = {};
  DraggableScrollableController _dragController =
      DraggableScrollableController();
  List<BookmarkData> bookmarks = [];

  @override
  void initState() {
    super.initState();
    _circles.add(
      Circle(
        circleId: const CircleId('perimeter'),
        center: _center,
        radius: 500,
        strokeColor: Colors.blue,
        fillColor: Colors.blue.withOpacity(0.2),
        strokeWidth: 2,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _addBookmark(String address, String nickname, IconData icon) {
    setState(() {
      bookmarks.add(BookmarkData(
        address: address,
        nickname: nickname,
        icon: icon,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color surface = Theme.of(context).colorScheme.surface;
    final Color onSurface = Theme.of(context).colorScheme.onSurface;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            circles: _circles,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled:
                        true, // Allows the sheet to take full height if needed
                    backgroundColor: Colors
                        .transparent, // Ensures rounded corners appear properly
                    builder: (context) {
                      return DraggableScrollableSheet(
                        initialChildSize: 1,
                        minChildSize: 1,
                        maxChildSize: 1,
                        expand:
                            false, // Ensures it behaves like a proper bottom sheet
                        builder: (context, scrollController) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: SettingsPage(), // Your Settings Page content
                          );
                        },
                      );
                    },
                  );
                },
                child: Container(
                  width: 65,
                  height: 65,
                  decoration: BoxDecoration(
                    color: surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedMenu01,
                    color: onSurface,
                    size: 24.0,
                  ),
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            controller: _dragController,
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 12),
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: CustomSearchContainer(),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Recent Locations",
                                style: GoogleFonts.oxygen(
                                  color: onSurface,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index == bookmarks.length) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: BookmarkButton(
                                location: location,
                                onBookmarkAdded: _addBookmark,
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SavedBookmarkContainer(
                              bookmark: bookmarks[index],
                              onTap: () {
                                // Handle bookmark tap
                              },
                            ),
                          );
                        },
                        childCount: bookmarks.length + 1,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          TouchAssistive(
            initialOffset: const Offset(350, 350),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => IncidentReportModal(),
              );
            },
            disableOpacity: .8,
            buttonSize: 65,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(67, 236, 14, 14),
              ),
              child: Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: const Color.fromARGB(138, 118, 118, 118),
                  ),
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: const Color.fromARGB(255, 240, 25, 25),
                      ),
                      child: Center(
                        child: Text(
                          "SOS",
                          style: GoogleFonts.anton(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: .5,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
