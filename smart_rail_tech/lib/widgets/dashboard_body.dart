import 'package:flutter/material.dart';
import 'package:smart_rail_tech/constants.dart';
import 'package:smart_rail_tech/models/lrt_data.dart';
import 'package:smart_rail_tech/widgets/lrt_card.dart';

class DashboardBody extends StatefulWidget {
  final int crossAxisCount;

  const DashboardBody({super.key, required this.crossAxisCount});

  @override
  State<DashboardBody> createState() => _DashboardBodyState();
}

class _DashboardBodyState extends State<DashboardBody> {
  final TextEditingController _lrtIdController = TextEditingController();
  final TextEditingController _minMileageController = TextEditingController();

  bool _showMaintenanceRequiredOnly = false;

  List<LrtData> get filteredLrtList {
    return lrtList.where((lrt) {
      final lrtIdMatch = lrt.lrtId.toLowerCase().contains(
        _lrtIdController.text.toLowerCase(),
      );

      final minMileage = int.tryParse(_minMileageController.text);
      final mileageMatch = minMileage == null || lrt.mileage >= minMileage;

      final maintenanceMatch =
          !_showMaintenanceRequiredOnly || lrt.maintenanceRequired;

      return lrtIdMatch && mileageMatch && maintenanceMatch;
    }).toList();
  }

  void _clearFilters() {
    setState(() {
      _lrtIdController.clear();
      _minMileageController.clear();
      _showMaintenanceRequiredOnly = false;
    });
  }

  @override
  void dispose() {
    _lrtIdController.dispose();
    _minMileageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = filteredLrtList;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "LRT Fleet Mileage Dashboard",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 53, 53, 53),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            "Track mileage, CAN/TCMS status and maintenance condition for each LRT train.",
            style: TextStyle(color: greyText, fontSize: 15),
          ),
          const SizedBox(height: 24),

          LayoutBuilder(
            builder: (context, constraints) {
              final bool isSmallScreen = constraints.maxWidth < 760;

              if (isSmallScreen) {
                return _mobileFilterBar();
              }

              return _desktopFilterBar();
            },
          ),

          const SizedBox(height: 24),

          Text(
            "Showing ${filteredList.length} LRT train(s)",
            style: const TextStyle(
              color: greyText,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 16),

          Expanded(
            child: filteredList.isEmpty
                ? const Center(
                    child: Text(
                      "No LRT found.",
                      style: TextStyle(color: greyText),
                    ),
                  )
                : GridView.builder(
                    itemCount: filteredList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: widget.crossAxisCount,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                      childAspectRatio: 1.25,
                    ),
                    itemBuilder: (context, index) {
                      return LrtCard(lrt: filteredList[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _desktopFilterBar() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: _lrtIdController,
              onChanged: (_) => setState(() {}),
              decoration: _inputDecoration("Search LRT ID", Icons.search),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            flex: 3,
            child: TextField(
              controller: _minMileageController,
              keyboardType: TextInputType.number,
              onChanged: (_) => setState(() {}),
              decoration: _inputDecoration("Minimum Mileage", Icons.route),
            ),
          ),

          const SizedBox(width: 16),

          Expanded(flex: 2, child: _maintenanceButton()),

          const SizedBox(width: 16),

          Expanded(flex: 2, child: _clearButton()),
        ],
      ),
    );
  }

  Widget _mobileFilterBar() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            controller: _lrtIdController,
            onChanged: (_) => setState(() {}),
            decoration: _inputDecoration("Search LRT ID", Icons.search),
          ),

          const SizedBox(height: 14),

          TextField(
            controller: _minMileageController,
            keyboardType: TextInputType.number,
            onChanged: (_) => setState(() {}),
            decoration: _inputDecoration("Minimum Mileage", Icons.route),
          ),

          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(flex: 2, child: _maintenanceButton()),
              const SizedBox(width: 14),
              Expanded(child: _clearButton()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _maintenanceButton() {
    return SizedBox(
      height: 48,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          setState(() {
            _showMaintenanceRequiredOnly = !_showMaintenanceRequiredOnly;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color: _showMaintenanceRequiredOnly
                ? primaryBlue
                : const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: _showMaintenanceRequiredOnly
                  ? primaryBlue
                  : Colors.grey.shade300,
            ),
          ),
          child: Center(
            child: Text(
              "Maintenance Required",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: _showMaintenanceRequiredOnly ? Colors.white : darkText,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _clearButton() {
    return SizedBox(
      height: 48,
      child: ElevatedButton.icon(
        onPressed: _clearFilters,
        icon: const Icon(Icons.clear),
        label: const Text("Clear"),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      prefixIcon: Icon(icon, color: greyText),
      filled: true,
      fillColor: const Color(0xFFF9FAFB),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primaryBlue, width: 2),
      ),
    );
  }
}
