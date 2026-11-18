import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/HomeScreens/UploadScreen.dart';
import 'package:flutter/material.dart';

class OdometerScreen extends StatelessWidget {
  const OdometerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    final List<Map<String, dynamic>> odometerRecords = [
      {
        'date': '12 jan 2026',
        'title': 'Service Detail',
        'customer': 'Rahul Sharma',
      },
      {
        'date': '08 jan 2026',
        'title': 'Service Detail',
        'customer': 'Rahul Sharma',
      },
    ];

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: isDarkMode ? AppColor.getOnboardingGradient(brightness) : null,
          color: isDarkMode ? null : Colors.white,
        ),
        child: SafeArea(
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
                      'Odometer',
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.02),

              // Odometer Records List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  itemCount: odometerRecords.length,
                  itemBuilder: (context, index) {
                    final record = odometerRecords[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(bottom: height * 0.015),
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
                            // Date with icon
                            Container(
                              width: width * 0.12,
                              height: width * 0.12,
                              decoration: BoxDecoration(
                                color: AppColor.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  record['date'].split(' ')[0],
                                  style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.04),
                            // Details
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    record['date'],
                                    style: TextStyle(
                                      fontSize: width * 0.04,
                                      fontWeight: FontWeight.w600,
                                      color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.003),
                                  Text(
                                    record['title'],
                                    style: TextStyle(
                                      fontSize: width * 0.032,
                                      color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    'Customer: ${record['customer']}',
                                    style: TextStyle(
                                      fontSize: width * 0.028,
                                      color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: width * 0.04,
                              color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Info Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Container(
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.orange,
                        size: width * 0.06,
                      ),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: Text(
                          'Upload your odometer photo and reading to track your vehicle usage. Get timely service and maintenance reminders so you don\'t miss a service.',
                          style: TextStyle(
                            fontSize: width * 0.03,
                            color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: height * 0.02),

              // Scan Button
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.03),
                child: Center(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const UploadScreen(fromOdometer: true)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: width * 0.14,
                          height: width * 0.14,
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.06)
                                : Colors.grey.shade50,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isDarkMode
                                  ? Colors.white.withOpacity(0.1)
                                  : Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            Icons.crop_free_rounded,
                            size: width * 0.06,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          ),
                        ),
                        SizedBox(height: height * 0.008),
                        Text(
                          'Scan',
                          style: TextStyle(
                            fontSize: width * 0.032,
                            fontWeight: FontWeight.w500,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
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