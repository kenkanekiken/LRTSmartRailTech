// lib/widgets/lrt_card.dart

import 'package:flutter/material.dart';
import 'package:smart_rail_tech/constants.dart';
import 'package:smart_rail_tech/models/lrt_data.dart';

class LrtCard extends StatelessWidget {
  final LrtData lrt;

  const LrtCard({super.key, required this.lrt});

  @override
  Widget build(BuildContext context) {
    final bool isOnline = lrt.status == "Online";
    final bool needCheck = lrt.maintenanceRequired;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardWhite,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LRT ID
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                lrt.lrtId,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: darkText,
                ),
              ),
              Icon(Icons.train, color: primaryBlue, size: 30),
            ],
          ),

          const SizedBox(height: 16),

          _infoRow(Icons.route, "Mileage", "${lrt.mileage} km"),
          _infoRow(
            Icons.wifi,
            "Status",
            lrt.status,
            valueColor: isOnline ? successGreen : Colors.red,
          ),
          _infoRow(Icons.update, "Last Update", lrt.lastUpdate),
          _infoRow(
            Icons.build,
            "Maintenance",
            needCheck ? "Check Required" : "Normal",
            valueColor: needCheck ? warningOrange : successGreen,
          ),
        ],
      ),
    );
  }

  Widget _infoRow(
    IconData icon,
    String label,
    String value, {
    Color valueColor = darkText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 11),
      child: Row(
        children: [
          Icon(icon, size: 20, color: greyText),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: greyText, fontSize: 14),
            ),
          ),
          Text(
            value,
            style: TextStyle(color: valueColor, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
