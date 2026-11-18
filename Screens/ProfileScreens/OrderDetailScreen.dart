import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

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
                        '#1202012',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Service Image
                        Center(
                          child: Container(
                            width: width * 0.4,
                            height: width * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(
                              ImageAssets.carService,
                              width: width * 0.3,
                              height: width * 0.2,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        // Service Details
                        Text(
                          'Car Service',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          ),
                        ),
                        Text(
                          'Basic Service',
                          style: TextStyle(
                            fontSize: width * 0.035,
                            color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        // Add Rating
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.015,
                          ),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.white.withOpacity(0.04) : Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add Rating',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                ),
                              ),
                              Row(
                                children: List.generate(5, (index) => Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                  size: width * 0.05,
                                )),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: height * 0.015),

                        // Add Review
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.015,
                          ),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.white.withOpacity(0.04) : Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add Review',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                ),
                              ),
                              Text(
                                'Write a Review',
                                style: TextStyle(
                                  fontSize: width * 0.032,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: height * 0.02),

                        // Price Details
                        Text(
                          'Price details',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          ),
                        ),
                        SizedBox(height: height * 0.01),

                        _buildPriceRow('Price (2 item)', '₹14,400', isDarkMode, width),
                        _buildPriceRow('Discount', '₹2,300', isDarkMode, width),
                        _buildPriceRow('Delivery Charges', 'Free', isDarkMode, width),
                        Divider(
                          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
                        ),
                        _buildPriceRow('Total', '₹12,100', isDarkMode, width, isBold: true),

                        SizedBox(height: height * 0.02),

                        // Technician Detail
                        Text(
                          'Technician Detail',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          ),
                        ),
                        SizedBox(height: height * 0.01),

                        Container(
                          padding: EdgeInsets.all(width * 0.04),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.white.withOpacity(0.04) : Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: width * 0.12,
                                height: width * 0.12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green.withOpacity(0.1),
                                ),
                                child: Center(
                                  child: Text(
                                    'S',
                                    style: TextStyle(
                                      fontSize: width * 0.05,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: width * 0.03),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Suraj Patel',
                                      style: TextStyle(
                                        fontSize: width * 0.04,
                                        fontWeight: FontWeight.w600,
                                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.005),
                                    Text(
                                      '+91 7932792390',
                                      style: TextStyle(
                                        fontSize: width * 0.032,
                                        color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.005),
                                    Row(
                                      children: List.generate(5, (index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                        size: width * 0.04,
                                      )),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Download Invoice
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.055,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.green, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Download Invoice',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.green,
                        ),
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

  Widget _buildPriceRow(String label, String value, bool isDarkMode, double width, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: width * 0.035,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              color: isBold
                  ? (isDarkMode ? AppColor.textPrimary : Colors.black87)
                  : (isDarkMode ? AppColor.textSecondary : Colors.grey.shade600),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: width * 0.035,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
              color: isBold
                  ? Colors.green
                  : (isDarkMode ? AppColor.textSecondary : Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}