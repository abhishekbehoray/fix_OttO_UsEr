import 'package:fixotto/Screens/SelectVehicleScreens/VehicleDetailsScreenTwo.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class SelectVehicleDetailScreen extends StatefulWidget {
  final String vehicleName;

  const SelectVehicleDetailScreen({
    super.key,
    required this.vehicleName,
  });

  @override
  State<SelectVehicleDetailScreen> createState() =>
      _SelectVehicleDetailScreenState();
}

class _SelectVehicleDetailScreenState
    extends State<SelectVehicleDetailScreen> {
  late String _selectedVehicle;
  int _selectedColorIndex = 0;
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  final List<Color> _colors = [
    const Color(0xFFE53935), // red
    const Color(0xFFE0E0E0), // white / silver
    const Color(0xFF1E3A8A), // blue
    const Color(0xFF1A1A1A), // black
    const Color(0xFF2E7D32), // green
  ];

  final String _brandName = 'Tata';

  final List<String> _vehicleModels = [
    'Tata Nexon',
    'Tata Sierra',
    'Tata Harrier',
    'Tata Altroz',
    'Tata Punch',
  ];

  @override
  void initState() {
    super.initState();
    _selectedVehicle = widget.vehicleName;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool get _isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;

  List<String> get _filteredVehicles {
    if (_searchQuery.trim().isEmpty) return _vehicleModels;
    return _vehicleModels
        .where((v) =>
        v.toLowerCase().contains(_searchQuery.trim().toLowerCase()))
        .toList();
  }

  void _navigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleDetailsScreenTwo(
          vehicleName: _selectedVehicle,
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

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: isDarkMode
              ? AppColor.getOnboardingGradient(brightness)
              : const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFCE4E4),
              Color(0xFFFFF6ED),
              Color(0xFFFFFFFF),
            ],
          ),
        ),
        child: SafeArea(
          top: true,
          bottom: false,
          child: Column(
            children: [
              // ===== Top fixed section =====
              // Header (always visible, even when keyboard is open)
              Padding(
                padding: EdgeInsets.fromLTRB(
                  width * 0.05,
                  height * 0.015,
                  width * 0.05,
                  0,
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(width * 0.025),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.08)
                              : Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: isDarkMode
                              ? AppColor.textPrimary
                              : Colors.black87,
                          size: width * 0.055,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(right: width * 0.1),
                          child: Text(
                            'Vehicle',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w700,
                              color: isDarkMode
                                  ? AppColor.textPrimary
                                  : const Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Vehicle preview: image, brand, colors, Select button.
              // Collapses out of the way when the keyboard opens so the
              // "Select the vehicle" card can rise above the keyboard.
              AnimatedSize(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                alignment: Alignment.topCenter,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 180),
                  opacity: _isKeyboardOpen ? 0 : 1,
                  child: _isKeyboardOpen
                      ? const SizedBox(width: double.infinity)
                      : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: height * 0.01),

                        // Vehicle Image
                        Image.asset(
                          ImageAssets.carBanner,
                          width: width * 0.75,
                          height: width * 0.5,
                          fit: BoxFit.contain,
                        ),

                        SizedBox(height: height * 0.01),

                        // Brand Name
                        Text(
                          _brandName,
                          style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode
                                ? AppColor.textPrimary
                                : const Color(0xFF1A1A1A),
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        // Color Selection
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          List.generate(_colors.length, (index) {
                            final isSelected =
                                _selectedColorIndex == index;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColorIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: width * 0.02,
                                ),
                                padding:
                                EdgeInsets.all(isSelected ? 3 : 0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: isSelected
                                      ? Border.all(
                                    color:
                                    const Color(0xFF0E97A7),
                                    width: 2,
                                  )
                                      : null,
                                ),
                                child: Container(
                                  width: width * 0.06,
                                  height: width * 0.06,
                                  decoration: BoxDecoration(
                                    color: _colors[index],
                                    shape: BoxShape.circle,
                                    border: _colors[index] ==
                                        const Color(0xFFE0E0E0)
                                        ? Border.all(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    )
                                        : null,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),

                        SizedBox(height: height * 0.02),

                        // Select Button - Navigates to VehicleDetailsScreenTwo
                        SizedBox(
                          width: width * 0.45,
                          height: height * 0.055,
                          child: OutlinedButton(
                            onPressed: _navigateToDetails,
                            style: OutlinedButton.styleFrom(
                              backgroundColor: isDarkMode
                                  ? Colors.white.withOpacity(0.06)
                                  : Colors.white,
                              side: const BorderSide(
                                color: Color(0xFF0E97A7),
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Select',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF0E97A7),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.01),
                      ],
                    ),
                  ),
                ),
              ),

              // ===== Bottom sheet-style vehicle list =====
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? const Color(0xFF121212)
                        : Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 16,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      width * 0.06,
                      height * 0.025,
                      width * 0.06,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select the vehicle',
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode
                                ? AppColor.textPrimary
                                : const Color(0xFF1A1A1A),
                          ),
                        ),
                        SizedBox(height: height * 0.015),

                        // Search bar
                        Container(
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.06)
                                : const Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            controller: _searchController,
                            onChanged: (value) {
                              setState(() {
                                _searchQuery = value;
                              });
                            },
                            style: TextStyle(
                              fontSize: width * 0.038,
                              color: isDarkMode
                                  ? AppColor.textPrimary
                                  : Colors.black87,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              hintStyle: TextStyle(
                                fontSize: width * 0.038,
                                color: isDarkMode
                                    ? AppColor.textSecondary
                                    : Colors.grey.shade500,
                              ),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: isDarkMode
                                    ? AppColor.textSecondary
                                    : Colors.grey.shade500,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: height * 0.016,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.01),

                        // Vehicle list
                        Expanded(
                          child: _filteredVehicles.isEmpty
                              ? Center(
                            child: Text(
                              'No vehicles found',
                              style: TextStyle(
                                fontSize: width * 0.038,
                                color: isDarkMode
                                    ? AppColor.textSecondary
                                    : Colors.grey.shade500,
                              ),
                            ),
                          )
                              : ListView.builder(
                            padding: EdgeInsets.only(
                              bottom: height * 0.02,
                            ),
                            itemCount: _filteredVehicles.length,
                            itemBuilder: (context, index) {
                              final model = _filteredVehicles[index];
                              final isSelected =
                                  _selectedVehicle == model;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedVehicle = model;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                    bottom: height * 0.012,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.03,
                                    vertical: height * 0.01,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFF0E97A7)
                                        .withOpacity(0.08)
                                        : Colors.transparent,
                                    borderRadius:
                                    BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: width * 0.11,
                                        height: width * 0.11,
                                        decoration: BoxDecoration(
                                          color: isDarkMode
                                              ? Colors.white
                                              .withOpacity(0.08)
                                              : const Color(0xFFF0F0F3),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          Icons.directions_car_rounded,
                                          color: isSelected
                                              ? const Color(0xFF0E97A7)
                                              : Colors.grey.shade500,
                                          size: width * 0.06,
                                        ),
                                      ),
                                      SizedBox(width: width * 0.04),
                                      Expanded(
                                        child: Text(
                                          model,
                                          style: TextStyle(
                                            fontSize: width * 0.04,
                                            fontWeight: isSelected
                                                ? FontWeight.w600
                                                : FontWeight.w500,
                                            color: isSelected
                                                ? const Color(
                                                0xFF0E97A7)
                                                : isDarkMode
                                                ? AppColor
                                                .textPrimary
                                                : const Color(
                                                0xFF1A1A1A),
                                          ),
                                        ),
                                      ),
                                      if (isSelected)
                                        Icon(
                                          Icons.check_circle_rounded,
                                          color:
                                          const Color(0xFF0E97A7),
                                          size: width * 0.05,
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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