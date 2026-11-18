import 'package:fixotto/Utils/AppColor.dart';
import 'package:flutter/material.dart';

class OdometerDetailScreen extends StatefulWidget {
  const OdometerDetailScreen({super.key});

  @override
  State<OdometerDetailScreen> createState() => _OdometerDetailScreenState();
}

class _OdometerDetailScreenState extends State<OdometerDetailScreen> {
  final TextEditingController _currentReadingController = TextEditingController();
  final TextEditingController _dailyAverageController = TextEditingController();
  final TextEditingController _usageTypeController = TextEditingController();
  final TextEditingController _dailyVehicleKmController = TextEditingController();
  final TextEditingController _lastServiceOdometerController = TextEditingController();
  final TextEditingController _lastServiceDateController = TextEditingController();
  final TextEditingController _serviceFrequencyController = TextEditingController();

  @override
  void dispose() {
    _currentReadingController.dispose();
    _dailyAverageController.dispose();
    _usageTypeController.dispose();
    _dailyVehicleKmController.dispose();
    _lastServiceOdometerController.dispose();
    _lastServiceDateController.dispose();
    _serviceFrequencyController.dispose();
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
                        'Odometer Detail',
                        style: TextStyle(
                          fontSize: width * 0.055,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.025),

                  // MPH Header
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04,
                      vertical: height * 0.015,
                    ),
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
                        Text(
                          'MPH',
                          style: TextStyle(
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.w700,
                            color: AppColor.primary,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'Add details',
                          style: TextStyle(
                            fontSize: width * 0.035,
                            fontWeight: FontWeight.w500,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Form Fields
                  _buildTextField(
                    'Current Odometer Reading*',
                    'Enter',
                    _currentReadingController,
                    isDarkMode,
                    width,
                    height,
                  ),
                  _buildTextField(
                    'Daily Average KM*',
                    'Enter',
                    _dailyAverageController,
                    isDarkMode,
                    width,
                    height,
                  ),
                  _buildTextField(
                    'Usage Type*',
                    'Enter',
                    _usageTypeController,
                    isDarkMode,
                    width,
                    height,
                  ),
                  _buildTextField(
                    'Daily Vehicle KM*',
                    'Enter',
                    _dailyVehicleKmController,
                    isDarkMode,
                    width,
                    height,
                  ),
                  _buildTextField(
                    'Last Service Odometer (km)*',
                    'Enter',
                    _lastServiceOdometerController,
                    isDarkMode,
                    width,
                    height,
                  ),
                  _buildTextField(
                    'Last Service Date*',
                    'Enter',
                    _lastServiceDateController,
                    isDarkMode,
                    width,
                    height,
                  ),
                  _buildTextField(
                    'Service Frequency*',
                    'Enter in Month',
                    _serviceFrequencyController,
                    isDarkMode,
                    width,
                    height,
                  ),

                  SizedBox(height: height * 0.03),

                  // Save and Cancel Buttons
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: height * 0.055,
                          child: ElevatedButton(
                            onPressed: () {
                              // Save logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Odometer details saved successfully!'),
                                  backgroundColor: Colors.green,
                                  behavior: SnackBarBehavior.floating,
                                ),
                              );
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primary,
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
                      ),
                      SizedBox(width: width * 0.03),
                      Expanded(
                        child: SizedBox(
                          height: height * 0.055,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.red,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
      TextEditingController controller,
      bool isDarkMode,
      double width,
      double height,
      ) {
    return Padding(
      padding: EdgeInsets.only(bottom: height * 0.015),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: width * 0.035,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
            ),
          ),
          SizedBox(height: height * 0.005),
          Container(
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                width: 1,
              ),
            ),
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: width * 0.035,
                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
              ),
              decoration: InputDecoration(
                hintText: hint,
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
        ],
      ),
    );
  }
}