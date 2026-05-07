import 'package:flutter/material.dart';
import 'package:smart_rail_tech/constants.dart';
import 'package:smart_rail_tech/widgets/dashboard_body.dart';

class TabletScaffold extends StatelessWidget {
  const TabletScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text("SmartRailTech"),
      ),
      body: const DashboardBody(crossAxisCount: 2),
    );
  }
}
