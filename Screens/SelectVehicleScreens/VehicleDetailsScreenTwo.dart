import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class VehicleDetailsScreenTwo extends StatefulWidget {
  final String vehicleName;

  const VehicleDetailsScreenTwo({
    super.key,
    required this.vehicleName,
  });

  @override
  State<VehicleDetailsScreenTwo> createState() =>
      _VehicleDetailsScreenTwoState();
}

class _VehicleDetailsScreenTwoState extends State<VehicleDetailsScreenTwo> {
  static const Color _accentGreen = Color(0xFF2FA84F);

  int _selectedColorIndex = 0;
  String _selectedTransmission = 'Manual';
  String _selectedFuelType = 'Petrol';

  final TextEditingController _registrationController =
  TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  final List<Color> _colors = [
    const Color(0xFFE53935), // red
    const Color(0xFFE0E0E0), // white / silver
    const Color(0xFF1E3A8A), // blue
    const Color(0xFF1A1A1A), // black
    const Color(0xFF2E7D32), // green
  ];

  final String _brandName = 'Tata';

  final List<String> _transmissionTypes = ['Manual', 'Automatic'];
  final List<String> _fuelTypes = ['Petrol', 'Diesel', 'CNG', 'EV'];

  @override
  void dispose() {
    _registrationController.dispose();
    _yearController.dispose();
    super.dispose();
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
          bottom: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: height * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ===== Header + vehicle preview =====
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05,
                    vertical: height * 0.015,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
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

                      SizedBox(height: height * 0.015),

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
                        children: List.generate(_colors.length, (index) {
                          final isSelected = _selectedColorIndex == index;
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
                              padding: EdgeInsets.all(isSelected ? 3 : 0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: isSelected
                                    ? Border.all(
                                  color: const Color(0xFF0E97A7),
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
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  thickness: 1,
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.08)
                      : Colors.grey.shade200,
                ),

                // ===== Transmission Type =====
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    width * 0.05,
                    height * 0.02,
                    width * 0.05,
                    height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Car Transmission Type',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode
                              ? AppColor.textPrimary
                              : const Color(0xFF1A1A1A),
                        ),
                      ),
                      SizedBox(height: height * 0.012),
                      Wrap(
                        spacing: width * 0.03,
                        runSpacing: height * 0.01,
                        children: _transmissionTypes.map((type) {
                          final isSelected = _selectedTransmission == type;
                          return _OptionPill(
                            label: type,
                            selected: isSelected,
                            accentColor: _accentGreen,
                            isDarkMode: isDarkMode,
                            width: width,
                            height: height,
                            onTap: () {
                              setState(() {
                                _selectedTransmission = type;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: height * 0.012),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: width * 0.033,
                            color: isDarkMode
                                ? AppColor.textSecondary
                                : Colors.black54,
                          ),
                          children: [
                            const TextSpan(text: 'Transmission Type : '),
                            TextSpan(
                              text: _selectedTransmission,
                              style: const TextStyle(
                                color: _accentGreen,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  thickness: 1,
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.08)
                      : Colors.grey.shade200,
                ),

                // ===== Fuel Type =====
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    width * 0.05,
                    height * 0.02,
                    width * 0.05,
                    height * 0.02,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Car Fuel Type',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode
                              ? AppColor.textPrimary
                              : const Color(0xFF1A1A1A),
                        ),
                      ),
                      SizedBox(height: height * 0.012),
                      Wrap(
                        spacing: width * 0.03,
                        runSpacing: height * 0.01,
                        children: _fuelTypes.map((fuel) {
                          final isSelected = _selectedFuelType == fuel;
                          return _OptionPill(
                            label: fuel,
                            selected: isSelected,
                            accentColor: _accentGreen,
                            isDarkMode: isDarkMode,
                            width: width,
                            height: height,
                            onTap: () {
                              setState(() {
                                _selectedFuelType = fuel;
                              });
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(height: height * 0.012),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: width * 0.033,
                            color: isDarkMode
                                ? AppColor.textSecondary
                                : Colors.black54,
                          ),
                          children: [
                            const TextSpan(text: 'Car Fuel Type : '),
                            TextSpan(
                              text: _selectedFuelType,
                              style: const TextStyle(
                                color: _accentGreen,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Divider(
                  height: 1,
                  thickness: 1,
                  color: isDarkMode
                      ? Colors.white.withOpacity(0.08)
                      : Colors.grey.shade200,
                ),

                // ===== Registration details + Done button =====
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    width * 0.05,
                    height * 0.02,
                    width * 0.05,
                    0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter Car Registration Number (Optional)',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode
                              ? AppColor.textPrimary
                              : const Color(0xFF1A1A1A),
                        ),
                      ),
                      SizedBox(height: height * 0.012),
                      Container(
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.06)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.1)
                                : Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _registrationController,
                          textCapitalization: TextCapitalization.characters,
                          style: TextStyle(
                            fontSize: width * 0.038,
                            color: isDarkMode
                                ? AppColor.textPrimary
                                : Colors.black87,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Registration number',
                            hintStyle: TextStyle(
                              fontSize: width * 0.038,
                              color: isDarkMode
                                  ? AppColor.textSecondary
                                  : Colors.grey.shade500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.016,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.022),

                      Text(
                        'Year of Registration (optional)',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode
                              ? AppColor.textPrimary
                              : const Color(0xFF1A1A1A),
                        ),
                      ),
                      SizedBox(height: height * 0.012),
                      Container(
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.06)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.1)
                                : Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: TextField(
                          controller: _yearController,
                          keyboardType: TextInputType.number,
                          maxLength: 4,
                          style: TextStyle(
                            fontSize: width * 0.038,
                            color: isDarkMode
                                ? AppColor.textPrimary
                                : Colors.black87,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Enter',
                            hintStyle: TextStyle(
                              fontSize: width * 0.038,
                              color: isDarkMode
                                  ? AppColor.textSecondary
                                  : Colors.grey.shade500,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                              vertical: height * 0.016,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: height * 0.03),

                      // Continue Button
                      SizedBox(
                        width: double.infinity,
                        height: height * 0.065,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const MainWrapper(initialIndex: 0),
                              ),
                              (route) => false,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _accentGreen,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Selectable pill used for transmission type and fuel type options.
class _OptionPill extends StatelessWidget {
  final String label;
  final bool selected;
  final Color accentColor;
  final bool isDarkMode;
  final double width;
  final double height;
  final VoidCallback onTap;

  const _OptionPill({
    required this.label,
    required this.selected,
    required this.accentColor,
    required this.isDarkMode,
    required this.width,
    required this.height,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: width * 0.035,
          vertical: height * 0.012,
        ),
        decoration: BoxDecoration(
          color: selected
              ? accentColor.withOpacity(0.1)
              : (isDarkMode ? Colors.white.withOpacity(0.05) : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? accentColor
                : (isDarkMode
                ? Colors.white.withOpacity(0.15)
                : Colors.grey.shade300),
            width: 1.2,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: width * 0.045,
              height: width * 0.045,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? accentColor
                      : (isDarkMode
                      ? Colors.white.withOpacity(0.3)
                      : Colors.grey.shade400),
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Center(
                child: Container(
                  width: width * 0.022,
                  height: width * 0.022,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: accentColor,
                  ),
                ),
              )
                  : null,
            ),
            SizedBox(width: width * 0.02),
            Text(
              label,
              style: TextStyle(
                fontSize: width * 0.037,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected
                    ? accentColor
                    : (isDarkMode ? AppColor.textPrimary : Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }
}