import 'package:fixotto/Screens/SelectVehicleScreens/SelectVehicleDetailScreen.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class SelectVehicleScreen extends StatefulWidget {
  const SelectVehicleScreen({super.key});

  @override
  State<SelectVehicleScreen> createState() => _SelectVehicleScreenState();
}

class _SelectVehicleScreenState extends State<SelectVehicleScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _vehicles = [
    {'name': 'Tata', 'image': ImageAssets.tata},
    {'name': 'Toyota', 'image': ImageAssets.toyota},
    {'name': 'Nissan', 'image': ImageAssets.bmw},
    {'name': 'Maruti Suzuki', 'image': ImageAssets.marutiSuzuki},
    {'name': 'Maruti Suzuki', 'image': ImageAssets.marutiSuzuki},
    {'name': 'Maruti Suzuki', 'image': ImageAssets.marutiSuzuki},
    {'name': 'KIA', 'image': ImageAssets.bmw},
    {'name': 'Maruti Suzuki', 'image': ImageAssets.marutiSuzuki},
    {'name': 'Maruti Suzuki', 'image': ImageAssets.marutiSuzuki},
    {'name': 'Maruti Suzuki', 'image': ImageAssets.marutiSuzuki},
    {'name': 'Maruti Suzuki', 'image': ImageAssets.marutiSuzuki},
  ];

  List<Map<String, dynamic>> _filteredVehicles = [];

  @override
  void initState() {
    super.initState();
    _filteredVehicles = _vehicles;
    _searchController.addListener(_filterVehicles);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterVehicles);
    _searchController.dispose();
    super.dispose();
  }

  void _filterVehicles() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredVehicles = _vehicles
          .where((vehicle) =>
          vehicle['name'].toLowerCase().contains(query))
          .toList();
    });
  }

  void _navigateToDetail(String vehicleName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectVehicleDetailScreen(vehicleName: vehicleName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: isDarkMode
              ? AppColor.getOnboardingGradient(brightness)
              : null,
          color: isDarkMode ? null : Colors.white,
        ),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header - Centered
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.02,
                ),
                child: Center(
                  child: Text(
                    'Vehicle',
                    style: TextStyle(
                      fontSize: width * 0.055,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode
                          ? AppColor.textPrimary
                          : const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),

              // Search Bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.01,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.08)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.12)
                          : Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                        ),
                        child: Icon(
                          Icons.search_rounded,
                          color: isDarkMode
                              ? AppColor.textTertiary
                              : Colors.grey.shade400,
                          size: width * 0.05,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(
                            color: isDarkMode
                                ? AppColor.textPrimary
                                : Colors.black87,
                            fontSize: width * 0.035,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              color: isDarkMode
                                  ? AppColor.textTertiary
                                  : Colors.grey.shade400,
                              fontSize: width * 0.035,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.018,
                            ),
                          ),
                        ),
                      ),
                      if (_searchController.text.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            _filterVehicles();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.03),
                            child: Icon(
                              Icons.clear_rounded,
                              color: isDarkMode
                                  ? AppColor.textTertiary
                                  : Colors.grey.shade400,
                              size: width * 0.045,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // Vehicle Grid - No Boxes
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                  ),
                  child: _filteredVehicles.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off_rounded,
                          size: width * 0.12,
                          color: isDarkMode
                              ? AppColor.textTertiary
                              : Colors.grey.shade400,
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'No vehicles found',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            color: isDarkMode
                                ? AppColor.textSecondary
                                : Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                      : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: width * 0.03,
                      mainAxisSpacing: height * 0.02,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: _filteredVehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = _filteredVehicles[index];
                      return GestureDetector(
                        onTap: () {
                          _navigateToDetail(vehicle['name']);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Vehicle Image - No Box
                            Image.asset(
                              vehicle['image'],
                              width: width * 0.18,
                              height: width * 0.18,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.directions_car_rounded,
                                  size: width * 0.15,
                                  color: isDarkMode
                                      ? AppColor.textTertiary
                                      : Colors.grey.shade400,
                                );
                              },
                            ),
                            SizedBox(height: height * 0.01),
                            // Vehicle Name - No Box
                            Text(
                              vehicle['name'],
                              style: TextStyle(
                                fontSize: width * 0.032,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode
                                    ? AppColor.textPrimary
                                    : Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}