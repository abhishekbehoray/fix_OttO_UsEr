import 'package:fixotto/Screens/HomeScreens/InsuranceDetailScreen.dart';
import 'package:fixotto/Screens/HomeScreens/UploadScreen.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class DocumentListScreen extends StatelessWidget {
  const DocumentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    final List<Map<String, dynamic>> documents = [
      {
        'title': 'Car Insurance',
        'customer': 'Rahul Sharma',
        'type': 'Doc',
        'badge': 'Insurance',
        'badgeColor': Colors.blue,
        // TODO: replace with actual asset/network image for this document
        'image': null,
      },
      {
        'title': 'Car Pollution',
        'customer': 'Rahul Sharma',
        'type': 'Pdf',
        'badge': 'Pollution',
        'badgeColor': Colors.green,
        // TODO: replace with actual asset/network image for this document
        'image': null,
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
                      child: Container(
                        padding: EdgeInsets.all(width * 0.025),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.08)
                              : Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          size: width * 0.055,
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.04),
                    Text(
                      'Insurance & Pollution',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.02),

              // All Document Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                child: Text(
                  'All Document',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: height * 0.015),

              // Document Cards
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: ListView(
                    children: documents.map((doc) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InsuranceDetailScreen(),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: height * 0.015),
                          padding: EdgeInsets.all(width * 0.035),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Document Info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          doc['type'],
                                          style: TextStyle(
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.w500,
                                            color: isDarkMode
                                                ? AppColor.textTertiary
                                                : Colors.grey.shade500,
                                          ),
                                        ),
                                        SizedBox(width: width * 0.02),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.02,
                                            vertical: height * 0.002,
                                          ),
                                          decoration: BoxDecoration(
                                            color: (doc['badgeColor'] as Color).withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            doc['badge'],
                                            style: TextStyle(
                                              fontSize: width * 0.028,
                                              fontWeight: FontWeight.w600,
                                              color: doc['badgeColor'],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height * 0.006),
                                    Text(
                                      doc['title'],
                                      style: TextStyle(
                                        fontSize: width * 0.042,
                                        fontWeight: FontWeight.w700,
                                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.004),
                                    Text(
                                      'Customer: ${doc['customer']}',
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                        color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: width * 0.03),
                              // Document photo thumbnail (placeholder)
                              Container(
                                width: width * 0.22,
                                height: width * 0.16,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey.shade200,
                                  image: doc['image'] != null
                                      ? DecorationImage(
                                    image: AssetImage(doc['image']),
                                    fit: BoxFit.cover,
                                  )
                                      : null,
                                ),
                                child: doc['image'] == null
                                    ? Icon(
                                  Icons.image_outlined,
                                  color: Colors.grey.shade400,
                                  size: width * 0.06,
                                )
                                    : null,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // Scan Button
              Padding(
                padding: EdgeInsets.only(bottom: height * 0.03, top: height * 0.01),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UploadScreen(),
                        ),
                      );
                    },
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