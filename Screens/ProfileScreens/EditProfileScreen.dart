import 'package:fixotto/Utils/AppColor.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String _selectedGender = 'Male';

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
                        'My Profile',
                        style: TextStyle(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.025),

                  // Big Box Container
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(width * 0.05),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Personal Details - Centered
                        Text(
                          'Personal Details',
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          ),
                        ),

                        SizedBox(height: height * 0.025),

                        // Profile Picture with Change Option
                        Stack(
                          children: [
                            Container(
                              width: width * 0.2,
                              height: width * 0.2,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green.withOpacity(0.1),
                                border: Border.all(
                                  color: Colors.green,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.person_rounded,
                                  size: width * 0.1,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: EdgeInsets.all(width * 0.015),
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isDarkMode ? Colors.black : Colors.white,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  color: Colors.white,
                                  size: width * 0.04,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.025),

                        // Name
                        _buildTextField(
                          'Name',
                          'Shubham Sharma',
                          isDarkMode,
                          width,
                          height,
                        ),

                        SizedBox(height: height * 0.015),

                        // Email
                        _buildTextField(
                          'Email',
                          'Shubham@gmail.com',
                          isDarkMode,
                          width,
                          height,
                        ),

                        SizedBox(height: height * 0.015),

                        // Phone Number
                        _buildTextField(
                          'Phone Number',
                          '+91 80398409838',
                          isDarkMode,
                          width,
                          height,
                        ),

                        SizedBox(height: height * 0.015),

                        // Gender
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Gender',
                              style: TextStyle(
                                fontSize: width * 0.035,
                                fontWeight: FontWeight.w500,
                                color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                              ),
                            ),
                            SizedBox(height: height * 0.008),
                            Row(
                              children: [
                                _buildGenderOption('Male', width, height, isDarkMode),
                                SizedBox(width: width * 0.05),
                                _buildGenderOption('Female', width, height, isDarkMode),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: height * 0.025),

                        // Save Button - Green
                        SizedBox(
                          width: double.infinity,
                          height: height * 0.06,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Delete Account
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.01),

                  // Version
                  Center(
                    child: Text(
                      'v3.1.1.0',
                      style: TextStyle(
                        fontSize: width * 0.025,
                        color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label,
      String hint,
      bool isDarkMode,
      double width,
      double height,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.035,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
          ),
        ),
        SizedBox(height: height * 0.005),
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
              width: 1,
            ),
          ),
          child: TextField(
            style: TextStyle(
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                horizontal: width * 0.04,
                vertical: height * 0.016,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGenderOption(String label, double width, double height, bool isDarkMode) {
    final bool isSelected = _selectedGender == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedGender = label),
      child: Row(
        children: [
          Container(
            width: width * 0.05,
            height: width * 0.05,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected
                    ? Colors.green
                    : isDarkMode
                    ? AppColor.textTertiary
                    : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
              child: Container(
                width: width * 0.025,
                height: width * 0.025,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                ),
              ),
            )
                : null,
          ),
          SizedBox(width: width * 0.02),
          Text(
            label,
            style: TextStyle(
              fontSize: width * 0.035,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}