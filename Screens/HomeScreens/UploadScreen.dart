import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Screens/HomeScreens/OdometerDetailScreen.dart';
import 'package:flutter/material.dart';

class UploadScreen extends StatelessWidget {
  final bool fromOdometer;
  const UploadScreen({super.key, this.fromOdometer = false});

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
                        'Upload Document',
                        style: TextStyle(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.03),

                  // Upload Area with Camera Icon
                  GestureDetector(
                    onTap: () {
                      // Navigate to Camera Scan Screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CameraScanScreen(),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      height: height * 0.2,
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade300,
                          width: 2,

                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.12,
                            height: width * 0.12,
                            decoration: BoxDecoration(
                              color: AppColor.primary.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.camera_alt_rounded,
                              color: AppColor.primary,
                              size: width * 0.06,
                            ),
                          ),
                          SizedBox(height: height * 0.015),
                          Text(
                            'Tap to scan document',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                            ),
                          ),
                          Text(
                            'Camera will open to scan',
                            style: TextStyle(
                              fontSize: width * 0.028,
                              color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  // Certificate of Insurance


                  SizedBox(height: height * 0.025),

                  if (fromOdometer)
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.06,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const OdometerDetailScreen()),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text(
                          'View Odometer Details',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                    ),

                  SizedBox(height: height * 0.025),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, bool isDarkMode, double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.3,
            child: Text(
              '$label :',
              style: TextStyle(
                fontSize: width * 0.032,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.008,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade400,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: width * 0.032,
                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldRow(String label, String value, bool isDarkMode, double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.005),
      child: Row(
        children: [
          SizedBox(
            width: width * 0.2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: width * 0.032,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.008,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade400,
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                value,
                style: TextStyle(
                  fontSize: width * 0.032,
                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckboxItem(String label, bool isDarkMode, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.005),
      child: Row(
        children: [
          Container(
            width: width * 0.04,
            height: width * 0.04,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey.shade400,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          SizedBox(width: width * 0.02),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: width * 0.028,
                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTermItem(String text, bool isDarkMode, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              fontSize: width * 0.03,
              color: AppColor.primary,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.03,
                color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Camera Scan Screen
class CameraScanScreen extends StatelessWidget {
  const CameraScanScreen({super.key});

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
        color: Colors.black,
        child: SafeArea(
          child: Stack(
            children: [
              // Camera Preview Placeholder
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white.withOpacity(0.3),
                        size: width * 0.3,
                      ),
                      SizedBox(height: height * 0.02),
                      Text(
                        'Camera Preview',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      Text(
                        'Point your camera at the document',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          color: Colors.white.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Scan Frame Overlay
              Center(
                child: Container(
                  width: width * 0.85,
                  height: height * 0.5,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.green,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      // Corner indicators
                      Positioned(
                        top: -2,
                        left: -2,
                        child: Container(
                          width: width * 0.05,
                          height: width * 0.05,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.green, width: 3),
                              left: BorderSide(color: Colors.green, width: 3),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -2,
                        right: -2,
                        child: Container(
                          width: width * 0.05,
                          height: width * 0.05,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.green, width: 3),
                              right: BorderSide(color: Colors.green, width: 3),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -2,
                        left: -2,
                        child: Container(
                          width: width * 0.05,
                          height: width * 0.05,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.green, width: 3),
                              left: BorderSide(color: Colors.green, width: 3),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: Container(
                          width: width * 0.05,
                          height: width * 0.05,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.green, width: 3),
                              right: BorderSide(color: Colors.green, width: 3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Top Bar
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.02,
                  ),
                  color: Colors.black.withOpacity(0.5),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          padding: EdgeInsets.all(width * 0.02),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.close_rounded,
                            color: Colors.white,
                            size: width * 0.06,
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Text(
                        'Scan Document',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Bar
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.06,
                    vertical: height * 0.03,
                  ),
                  color: Colors.black.withOpacity(0.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Flash toggle
                        },
                        child: Container(
                          padding: EdgeInsets.all(width * 0.04),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.flash_off_rounded,
                            color: Colors.white,
                            size: width * 0.06,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Capture image
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              title: const Text('Document Scanned'),
                              content: const Text('Document has been scanned successfully.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                    // Show success after returning
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Document uploaded successfully!'),
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(color: AppColor.primary),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          width: width * 0.18,
                          height: width * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.black,
                            size: width * 0.08,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Gallery picker
                        },
                        child: Container(
                          padding: EdgeInsets.all(width * 0.04),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.photo_library_rounded,
                            color: Colors.white,
                            size: width * 0.06,
                          ),
                        ),
                      ),
                    ],
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