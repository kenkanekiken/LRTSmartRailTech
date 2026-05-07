class LrtData {
  final String lrtId;
  final int mileage;
  final String status;
  final String lastUpdate;

  const LrtData({
    required this.lrtId,
    required this.mileage,
    required this.status,
    required this.lastUpdate,
  });

  bool get maintenanceRequired => mileage >= 13000;
}

final List<LrtData> lrtList = [
  LrtData(
    lrtId: "LRT-001",
    mileage: 12480,
    status: "Online",
    lastUpdate: "2s ago",
  ),
  LrtData(
    lrtId: "LRT-002",
    mileage: 9820,
    status: "Online",
    lastUpdate: "4s ago",
  ),
  LrtData(
    lrtId: "LRT-003",
    mileage: 15230,
    status: "Offline",
    lastUpdate: "10 min ago",
  ),
];
