import 'package:flutter/material.dart';
import 'package:smart_rail_tech/constants.dart';
import 'package:smart_rail_tech/widgets/dashboard_body.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      body: Row(
        children: [
          Container(
            width: 250,
            color: primaryBlue,
            padding: const EdgeInsets.all(24),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.train, color: Colors.white, size: 42),
                SizedBox(height: 16),
                Text(
                  "SmartRailTech",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                Text("Dashboard", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          const Expanded(child: DashboardBody(crossAxisCount: 3)),
        ],
      ),
    );
  }
}
