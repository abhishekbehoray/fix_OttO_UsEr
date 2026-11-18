import 'package:fixotto/Utils/AppColor.dart';
import 'package:flutter/material.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.06,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
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
                      'Address',
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.025),

                Text(
                  'Select Address',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Home Address
                _buildAddressCard(
                  'Home',
                  '112/23, Rajouri Garden, New Delhi, Delhi',
                  isDarkMode,
                  width,
                  height,
                ),

                SizedBox(height: height * 0.015),

                // Office Address
                _buildAddressCard(
                  'Office',
                  '112/23, Rajouri Garden, New Delhi, Delhi',
                  isDarkMode,
                  width,
                  height,
                ),

                SizedBox(height: height * 0.025),

                // Add Address Button - Green
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                            size: width * 0.05,
                          ),
                          SizedBox(width: width * 0.02),
                          Text(
                            'Add another address',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
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
      ),
    );
  }

  Widget _buildAddressCard(
      String title,
      String address,
      bool isDarkMode,
      double width,
      double height,
      ) {
    return Container(
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
          Container(
            width: width * 0.1,
            height: width * 0.1,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              title == 'Home' ? Icons.home_rounded : Icons.work_rounded,
              color: Colors.green,
              size: width * 0.05,
            ),
          ),
          SizedBox(width: width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                ),
                SizedBox(height: height * 0.003),
                Text(
                  address,
                  style: TextStyle(
                    fontSize: width * 0.032,
                    color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.radio_button_checked_rounded,
            color: Colors.green,
            size: width * 0.05,
          ),
        ],
      ),
    );
  }
}