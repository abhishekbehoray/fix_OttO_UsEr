import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/ProfileScreens/PaymentScreen.dart';
import 'package:flutter/material.dart';

class SOSDetailScreen extends StatefulWidget {
  const SOSDetailScreen({super.key});

  @override
  State<SOSDetailScreen> createState() => _SOSDetailScreenState();
}

class _SOSDetailScreenState extends State<SOSDetailScreen> {
  final TextEditingController _remarkController = TextEditingController();

  @override
  void dispose() {
    _remarkController.dispose();
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
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: isDarkMode ? AppColor.getOnboardingGradient(brightness) : null,
          color: isDarkMode ? null : Colors.white,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                    vertical: height * 0.02,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          size: width * 0.06,
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                // Location Address
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Container(
                    padding: EdgeInsets.all(width * 0.03),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.red,
                          size: width * 0.05,
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: Text(
                            'Moti Nagar Rd, DLE Industrial...',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.015),

                // Map Placeholder with Pins
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                  height: height * 0.4,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Map Placeholder
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.map_rounded,
                              size: width * 0.15,
                              color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              'Map View',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Map Location Pins - Random positions
                      Positioned(
                        top: height * 0.04,
                        left: width * 0.05,
                        child: _buildMapPin('MOABIT', '96', isDarkMode, width),
                      ),
                      Positioned(
                        top: height * 0.1,
                        left: width * 0.25,
                        child: _buildMapPin('Brandenburger Tor', '2', isDarkMode, width),
                      ),
                      Positioned(
                        top: height * 0.18,
                        left: width * 0.08,
                        child: _buildMapPin('Kaufhaus des Westens', '1', isDarkMode, width),
                      ),
                      Positioned(
                        top: height * 0.06,
                        right: width * 0.12,
                        child: _buildMapPin('HALENSEE', '100', isDarkMode, width),
                      ),
                      Positioned(
                        top: height * 0.2,
                        right: width * 0.08,
                        child: _buildMapPin('WILMERSDORF', '2', isDarkMode, width),
                      ),
                      Positioned(
                        top: height * 0.28,
                        left: width * 0.12,
                        child: _buildMapPin('SCHÖNEBERG', '1', isDarkMode, width),
                      ),
                      Positioned(
                        bottom: height * 0.15,
                        left: width * 0.05,
                        child: _buildMapPin('SCHMARGENDORF', '100', isDarkMode, width),
                      ),
                      Positioned(
                        bottom: height * 0.08,
                        left: width * 0.2,
                        child: _buildMapPin('FRIEDENAU', '2', isDarkMode, width),
                      ),
                      Positioned(
                        bottom: height * 0.12,
                        right: width * 0.1,
                        child: _buildMapPin('KREUZBERG', '103', isDarkMode, width),
                      ),
                      Positioned(
                        bottom: height * 0.05,
                        right: width * 0.2,
                        child: _buildMapPin('TEMPELHOF', '100', isDarkMode, width),
                      ),
                      Positioned(
                        top: height * 0.32,
                        left: width * 0.3,
                        child: _buildMapPin('BERGMANNKIEZ', '1', isDarkMode, width),
                      ),
                      Positioned(
                        top: height * 0.15,
                        left: width * 0.45,
                        child: _buildMapPin('WRA', '2', isDarkMode, width),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Add Details
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add Details',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                      Text(
                        'Upload Picture (optional)',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          color: AppColor.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.01),

                // Remark Field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Container(
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _remarkController,
                      style: TextStyle(
                        fontSize: width * 0.035,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Enter',
                        hintStyle: TextStyle(
                          fontSize: width * 0.035,
                          color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.015,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Price and Pay Button
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '₹ 99',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w800,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            'Additional service may cost extra',
                            style: TextStyle(
                              fontSize: width * 0.025,
                              color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PaymentScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.06,
                            vertical: height * 0.015,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Pay ₹ 99',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.025),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapPin(String label, String number, bool isDarkMode, double width) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.025,
        vertical: width * 0.012,
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.15) : Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade300,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width * 0.03,
            height: width * 0.03,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontSize: width * 0.018,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: width * 0.015),
          Text(
            label,
            style: TextStyle(
              fontSize: width * 0.022,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}