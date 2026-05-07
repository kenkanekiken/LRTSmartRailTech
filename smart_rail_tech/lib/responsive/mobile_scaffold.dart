import 'package:flutter/material.dart';
import 'package:smart_rail_tech/constants.dart';
import 'package:smart_rail_tech/widgets/dashboard_body.dart';

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: AppBar(
        backgroundColor: primaryBlue,
        title: const Text("SmartRailTech"),
      ),
      body: const DashboardBody(crossAxisCount: 1),
    );
  }
}
