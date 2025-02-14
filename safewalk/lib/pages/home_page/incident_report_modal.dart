import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class IncidentReportModal extends StatefulWidget {
  const IncidentReportModal({super.key});

  @override
  State<IncidentReportModal> createState() => _IncidentReportModalState();
}

class _IncidentReportModalState extends State<IncidentReportModal> {
  TextEditingController controller = TextEditingController();

  Widget _reportDropdownTemplate(
      String title, List<String> items, double rightPadding) {
    return Container(
      width: 320,
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xff424242),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: DropdownButton<String>(
          dropdownColor: const Color(0xff424242),
          borderRadius: BorderRadius.circular(20),
          underline: const SizedBox(),
          icon: const RotatedBox(
            quarterTurns: 2,
            child: HugeIcon(
              icon: HugeIcons.strokeRoundedTriangle,
              color: Color(0xff4BB7F3),
              size: 16.0,
            ),
          ),
          hint: Padding(
            padding: EdgeInsets.only(right: rightPadding),
            child: Text(
              title,
              style: GoogleFonts.oxygen(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 15,
              ),
            ),
          ),
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: GoogleFonts.oxygen(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 15,
                ),
              ),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        width: 400,
        height: 470,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 21, 21, 21),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              Text(
                "Incident Report",
                style: GoogleFonts.oxygen(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Container(
                width: 320,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xff424242),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 19.0),
                      child: TextField(
                        maxLines: 4,
                        controller: controller,
                        style: GoogleFonts.oxygen(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          hintText: "Incident Description",
                          hintStyle: GoogleFonts.oxygen(
                            color: Colors.white54,
                            fontSize: 15,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "150 Characters",
                            style: GoogleFonts.oxygen(
                              color: Colors.white54,
                              fontSize: 15,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              _reportDropdownTemplate(
                  "Incident Level", ["Low", "Medium", "High"], 165),
              const SizedBox(
                height: 15,
              ),
              _reportDropdownTemplate(
                  "Location", ["Current Location", "5 mi", "10 mi"], 200),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Request Police Presence?",
                style: GoogleFonts.oxygen(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xff424242),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: GoogleFonts.oxygen(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                        color: const Color(0xff424242),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        "No",
                        style: GoogleFonts.oxygen(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 45,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 207, 33, 21),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    "Report Incident",
                    style: GoogleFonts.oxygen(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 16,
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
