import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/SelectVehicleScreens/SelectVehicleScreen.dart';
import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({super.key});

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  String _selectedTransmission = 'Manual';
  String _selectedFuel = 'Petrol';
  String _selectedColor = 'Red';
  String _selectedVehicle = 'Honda City';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateStatusBar());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateStatusBar();
  }

  void _updateStatusBar() {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    ));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  final List<String> _transmissionTypes = ['Manual', 'Automatic'];
  final List<String> _fuelTypes = ['Petrol', 'Diesel', 'CNG'];
  final List<Map<String, dynamic>> _colors = [
    {'name': 'Red', 'color': Colors.red},
    {'name': 'Gray', 'color': Colors.grey},
    {'name': 'Blue', 'color': Colors.blue},
    {'name': 'Black', 'color': Colors.black},
    {'name': 'Green', 'color': AppColor.primary},
  ];

  final List<Map<String, dynamic>> _vehicleList = [
    {'name': 'Honda City', 'fuel': 'Petrol', 'status': 'Current', 'image': ImageAssets.bmw},
    {'name': 'Honda City', 'fuel': 'Petrol', 'status': '', 'image': ImageAssets.bmw},
    {'name': 'Honda City', 'fuel': 'Petrol', 'status': '', 'image': ImageAssets.bmw},
  ];

  void _showChangeVehiclePopup() {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        padding: EdgeInsets.all(width * 0.06),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              'Select Vehicle',
              style: TextStyle(
                fontSize: width * 0.05,
                fontWeight: FontWeight.w700,
                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
              ),
            ),
            SizedBox(height: height * 0.015),
            ..._vehicleList.map((vehicle) {
              final isCurrent = vehicle['status'] == 'Current';
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedVehicle = vehicle['name']!;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.015,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.1,
                        height: width * 0.1,
                        decoration: BoxDecoration(
                          color: AppColor.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          vehicle['image'],
                          width: width * 0.06,
                          height: width * 0.06,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicle['name']!,
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w600,
                                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                              ),
                            ),
                            Text(
                              vehicle['fuel']!,
                              style: TextStyle(
                                fontSize: width * 0.035,
                                color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (isCurrent)
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.03,
                            vertical: height * 0.005,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Current',
                            style: TextStyle(
                              fontSize: width * 0.028,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: height * 0.01),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectVehicleScreen()),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.02,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.primary,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.add_rounded,
                        color: AppColor.primary,
                        size: width * 0.05,
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        'Add New Vehicle +',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
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

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainWrapper(initialIndex: 0)),
            (route) => false,
          );
        }
      },
      child: Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: isDarkMode ? AppColor.getOnboardingGradient(brightness) : null,
          color: isDarkMode ? null : Colors.white,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.06,
                vertical: height * 0.02,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Header - Centered
                  Center(
                    child: Text(
                      'My Vehicle',
                      style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Car Image and Name - No Box
                  Column(
                    children: [
                      Image.asset(
                        ImageAssets.carBanner,
                        width: width * 0.7,
                        height: width * 0.50,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: height * 0.01),
                      Text(
                        'Mitsubishi',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.035,
                            height: width * 0.035,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Text(
                            'Red',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.01),
                      GestureDetector(
                        onTap: _showChangeVehiclePopup,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Change Vehicle',
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.025),

                  // Transmission Type
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Car Transmission Type',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  Row(
                    children: _transmissionTypes.map((type) {
                      final isSelected = _selectedTransmission == type;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedTransmission = type),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.015,
                          ),
                          margin: EdgeInsets.only(right: width * 0.03),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColor.primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected ? AppColor.primary : (isDarkMode ? Colors.white.withOpacity(0.15) : Colors.grey.shade300),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * 0.035,
                                height: width * 0.035,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? Colors.white : (isDarkMode ? AppColor.textTertiary : Colors.grey.shade400),
                                    width: 1.5,
                                  ),
                                ),
                                child: isSelected
                                    ? Center(
                                  child: Container(
                                    width: width * 0.015,
                                    height: width * 0.015,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                                    : null,
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                type,
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                  color: isSelected ? Colors.white : (isDarkMode ? AppColor.textPrimary : Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: height * 0.01),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Transmission Type : $_selectedTransmission',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  // Fuel Type
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select Car Fuel Type',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  Row(
                    children: _fuelTypes.map((fuel) {
                      final isSelected = _selectedFuel == fuel;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedFuel = fuel),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.015,
                          ),
                          margin: EdgeInsets.only(right: width * 0.03),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColor.primary : Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected ? AppColor.primary : (isDarkMode ? Colors.white.withOpacity(0.15) : Colors.grey.shade300),
                              width: 1.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * 0.035,
                                height: width * 0.035,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected ? Colors.white : (isDarkMode ? AppColor.textTertiary : Colors.grey.shade400),
                                    width: 1.5,
                                  ),
                                ),
                                child: isSelected
                                    ? Center(
                                  child: Container(
                                    width: width * 0.015,
                                    height: width * 0.015,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                                    : null,
                              ),
                              SizedBox(width: width * 0.02),
                              Text(
                                fuel,
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                  color: isSelected ? Colors.white : (isDarkMode ? AppColor.textPrimary : Colors.black87),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: height * 0.01),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Car Fuel Type : $_selectedFuel',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w500,
                        color: AppColor.primary,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  // Registration Number
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter Car Registration Number',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.015,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '984387436855',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.005,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Verified',
                            style: TextStyle(
                              fontSize: width * 0.03,
                              fontWeight: FontWeight.w600,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  // Change Color
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Change Color',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.01),

                  Row(
                    children: _colors.map((colorData) {
                      final isSelected = _selectedColor == colorData['name'];
                      return GestureDetector(
                        onTap: () => setState(() => _selectedColor = colorData['name']!),
                        child: Container(
                          margin: EdgeInsets.only(right: width * 0.03),
                          padding: EdgeInsets.all(isSelected ? 3 : 0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(
                              color: AppColor.primary,
                              width: 2,
                            )
                                : null,
                          ),
                          child: Container(
                            width: width * 0.065,
                            height: width * 0.065,
                            decoration: BoxDecoration(
                              color: colorData['color'],
                              shape: BoxShape.circle,
                              border: colorData['name'] == 'Gray'
                                  ? Border.all(
                                color: isDarkMode ? Colors.white.withOpacity(0.3) : Colors.grey.shade300,
                                width: 1,
                              )
                                  : null,
                            ),
                            child: isSelected
                                ? Center(
                              child: Icon(
                                Icons.check_rounded,
                                color: colorData['name'] == 'Gray' ? Colors.black : Colors.white,
                                size: width * 0.03,
                              ),
                            )
                                : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
