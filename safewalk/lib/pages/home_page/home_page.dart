import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:tempsafewalk/pages/home_page/custom_search_container.dart';
import 'package:tempsafewalk/pages/home_page/incident_report_modal.dart';
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

  @override
  void initState() {
    super.initState();
    // Initialize the circle perimeter
    _circles.add(
      Circle(
        circleId: const CircleId('perimeter'),
        center: _center,
        radius: 500, // 500 meters radius
        strokeColor: Colors.blue,
        fillColor: Colors.blue.withOpacity(0.2),
        strokeWidth: 2,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
      body: Stack(
        children: [
          /* ****************************START OF MAP**************************** */
          GoogleMap(
            onMapCreated: _onMapCreated,
            myLocationButtonEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            circles: _circles, // Add the circles Set to the map
          ),
          /* ****************************END OF MAP******************************* */

          /* ****************************START OF SEARCH BAR********************** */
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  const CustomSearchContainer(),
                  const SizedBox(width: 10),
                  GestureDetector(
                    child: Container(
                      width: 65,
                      height: 65,
                      decoration: BoxDecoration(
                        color: surface,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedMic01,
                          color: onSurface,
                          size: 26.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          /* ****************************START OF BOOKMARKS******************************* */
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Container(
                width: 390,
                height: 370,
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 20),
                        child: Text(
                          "Recent Locations",
                          style: GoogleFonts.oxygen(
                            color: onSurface,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    BookmarkButton(location: location),
                    const SizedBox(height: 15),
                    BookmarkButton(location: location),
                    const SizedBox(height: 15),
                    BookmarkButton(location: location),
                    const SizedBox(height: 15),
                    BookmarkButton(location: location),
                  ],
                ),
              ),
            ),
          ),

          /***************************SOS Button Section*************************/
          TouchAssistive(
            initialOffset: const Offset(350, 350),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return IncidentReportModal();
                },
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
                            decoration: TextDecoration.none,
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