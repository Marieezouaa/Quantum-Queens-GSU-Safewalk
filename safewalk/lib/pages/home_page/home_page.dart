import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hugeicons/hugeicons.dart';
import 'custom_search_container.dart';
import 'incident_report_modal.dart';
import 'package:tempsafewalk/pages/menu/pages/settings_pages.dart';
import 'package:tempsafewalk/pages/menu/pages/friends_page.dart';
import 'package:tempsafewalk/pages/menu/pages/inbox.dart';
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
  List<String> _notifications = [];

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

  void _showAssistiveTouchMenu() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.warning, color: Colors.red),
                title: const Text('Report an Incident'),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => const IncidentReportModal(),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_pin, color: Colors.blue),
                title: const Text('Share Location with Contacts'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.call, color: Colors.green),
                title: const Text('Call Campus Security'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.people, color: Colors.orange),
                title: const Text('Notify Friends'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: const CustomSearchContainer(),
          ),
          TouchAssistive(
            initialOffset: const Offset(350, 350),
            onPressed: _showAssistiveTouchMenu,
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
        ],
      ),
    );
  }
}
