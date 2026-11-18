import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/ProfileScreens/PaymentScreen.dart';
import 'package:flutter/material.dart';

class LocationScreenMap extends StatelessWidget {
  const LocationScreenMap({super.key});

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
                        'Location',
                        style: TextStyle(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

                  // Location Address
                  Container(
                    padding: EdgeInsets.all(width * 0.04),
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
                          color: Colors.green,
                          size: width * 0.06,
                        ),
                        SizedBox(width: width * 0.03),
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
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: width * 0.04,
                          color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Map Placeholder
                  Container(
                    width: double.infinity,
                    height: height * 0.3,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                    child: Center(
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
                  ),

                  SizedBox(height: height * 0.02),

                  // Technician Details with Phone Icon
                  Container(
                    padding: EdgeInsets.all(width * 0.04),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Technician',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Row(
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
                                  Row(
                                    children: List.generate(5, (index) => Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                      size: width * 0.035,
                                    )),
                                  ),
                                ],
                              ),
                            ),
                            // Phone Icon
                            Container(
                              padding: EdgeInsets.all(width * 0.025),
                              decoration: BoxDecoration(
                                color: Colors.green.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.phone_rounded,
                                color: Colors.green,
                                size: width * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Service Details with Image
                  Container(
                    padding: EdgeInsets.all(width * 0.04),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        // Service Image
                        Container(
                          width: width * 0.15,
                          height: width * 0.15,
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Image.asset(
                            ImageAssets.carService,
                            width: width * 0.1,
                            height: width * 0.1,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: width * 0.04),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Service details',
                                style: TextStyle(
                                  fontSize: width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                ),
                              ),
                              SizedBox(height: height * 0.005),
                              Row(
                                children: [
                                  Text(
                                    '#1202012',
                                    style: TextStyle(
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.w500,
                                      color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                                    ),
                                  ),
                                  SizedBox(width: width * 0.03),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.03,
                                      vertical: height * 0.003,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'In progress',
                                      style: TextStyle(
                                        fontSize: width * 0.025,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'Car Service',
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                                ),
                              ),
                              Text(
                                'Basic Service',
                                style: TextStyle(
                                  fontSize: width * 0.032,
                                  color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Details
                  Container(
                    padding: EdgeInsets.all(width * 0.04),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Details',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        _buildDetailRow('Estimated Time To Arrange The Parts', '20 mints', isDarkMode, width),
                        _buildDetailRow('Estimated Time To Arrange The Work', '20 mints', isDarkMode, width),
                        _buildDetailRow('Additional Parts Cost', '₹1200', isDarkMode, width),
                        _buildDetailRow('Labor Charges', '₹450', isDarkMode, width),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Price Details
                  Container(
                    padding: EdgeInsets.all(width * 0.04),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price details',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.w600,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        _buildDetailRow('Price (2 item)', '₹14,400', isDarkMode, width),
                        _buildDetailRow('Discount', '₹2,300', isDarkMode, width),
                        _buildDetailRow('Delivery Charges', 'Free', isDarkMode, width),
                        Divider(
                          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
                          thickness: 1,
                        ),
                        _buildDetailRow('Total', '₹12,100', isDarkMode, width, isBold: true),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.025),

                  // Payment Button
                  SizedBox(
                    width: double.infinity,
                    height: height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PaymentScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Payment for service',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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

  Widget _buildDetailRow(String label, String value, bool isDarkMode, double width, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.008),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: width * 0.032,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
              color: isBold
                  ? (isDarkMode ? AppColor.textPrimary : Colors.black87)
                  : (isDarkMode ? AppColor.textSecondary : Colors.grey.shade600),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: width * 0.032,
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