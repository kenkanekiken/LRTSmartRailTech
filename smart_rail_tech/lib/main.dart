import 'package:flutter/material.dart';
import 'package:smart_rail_tech/responsive/responsive_layout.dart';
import 'package:smart_rail_tech/responsive/desktop_scaffold.dart';
import 'package:smart_rail_tech/responsive/tablet_scaffold.dart';
import 'package:smart_rail_tech/responsive/mobile_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LRT Dashboard',
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: const MobileScaffold(),
        tabletScaffold: const TabletScaffold(),
        desktopScaffold: const DesktopScaffold(),
      ),
    );
  }
}
