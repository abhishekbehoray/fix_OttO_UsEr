import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Screens/CartScreens/SelectSlotScreen.dart';
import 'package:fixotto/Screens/CartScreens/AddressScreen.dart';
import 'package:fixotto/Screens/CartScreens/PaymentScreen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int _currentStep = 1;

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
                      'Checkout',
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.025),

                // Step Indicator - Full Width
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStepIndicator(1, 'Select Slot', isDarkMode, width),
                    _buildStepConnector(isDarkMode, width),
                    _buildStepIndicator(2, 'Address', isDarkMode, width),
                    _buildStepConnector(isDarkMode, width),
                    _buildStepIndicator(3, 'Payment', isDarkMode, width),
                  ],
                ),

                SizedBox(height: height * 0.03),

                // Content based on step
                Expanded(
                  child: IndexedStack(
                    index: _currentStep - 1,
                    children: [
                      SelectSlotContent(onNext: () => setState(() => _currentStep = 2)),
                      AddressContent(onNext: () => setState(() => _currentStep = 3)),
                      PaymentContent(onNext: () {}),
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

  Widget _buildStepIndicator(int step, String label, bool isDarkMode, double width) {
    final bool isActive = _currentStep >= step;
    return Column(
      children: [
        Container(
          width: width * 0.12,
          height: width * 0.12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.green : (isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200),
            border: Border.all(
              color: isActive ? Colors.green : (isDarkMode ? Colors.white.withOpacity(0.15) : Colors.grey.shade300),
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.w700,
                color: isActive ? Colors.white : (isDarkMode ? AppColor.textTertiary : Colors.grey.shade500),
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: width * 0.028,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
            color: isActive
                ? Colors.green
                : (isDarkMode ? AppColor.textTertiary : Colors.grey.shade500),
          ),
        ),
      ],
    );
  }

  Widget _buildStepConnector(bool isDarkMode, double width) {
    return Expanded(
      child: Container(
        height: 2,
        color: isDarkMode ? Colors.white.withOpacity(0.15) : Colors.grey.shade300,
        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
      ),
    );
  }
}