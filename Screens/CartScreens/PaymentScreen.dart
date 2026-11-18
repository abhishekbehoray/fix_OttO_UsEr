import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class PaymentContent extends StatefulWidget {
  final VoidCallback? onNext;

  const PaymentContent({super.key, this.onNext});

  @override
  State<PaymentContent> createState() => _PaymentContentState();
}

class _PaymentContentState extends State<PaymentContent> {
  String _selectedPayment = 'UPI';

  final List<String> _paymentMethods = ['UPI', 'Net banking', 'Wallet'];

  void _showSuccessPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_rounded,
                  color: Colors.green,
                  size: MediaQuery.of(context).size.width * 0.1,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Your booking successfully',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Confirm',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              // Go to home button (full width)
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close dialog
                  // Navigate to Home with proper bottom bar
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MainWrapper(initialIndex: 0),
                    ),
                        (route) => false,
                  );
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.018,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Go to home',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              // Cancel button (below Go to home)
              GestureDetector(
                onTap: () {
                  Navigator.pop(context); // Close dialog
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.015,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
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

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select your preferred payment method to confirm your service',
            style: TextStyle(
              fontSize: width * 0.035,
              color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
            ),
          ),
          SizedBox(height: height * 0.02),

          // Booking Summary - No Box
          Text(
            'Booking Summary',
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
          SizedBox(height: height * 0.01),

          Column(
            children: [
              _buildSummaryRow('Service', 'Exterior Wash', isDarkMode, width),
              _buildSummaryRow('Date', '12/09/2025', isDarkMode, width),
              _buildSummaryRow('Vehicle Type', 'Car', isDarkMode, width),
              _buildSummaryRow('Model', 'Honda City', isDarkMode, width),
              _buildSummaryRow('Time', '11:00 - 11:45', isDarkMode, width),
              _buildSummaryRow('Address', '112/23, Rajouri Garden, New Delhi, Delhi', isDarkMode, width),
            ],
          ),

          SizedBox(height: height * 0.02),

          // Bill Details - No Box
          Text(
            'Bill Details',
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
          SizedBox(height: height * 0.01),

          Column(
            children: [
              _buildBillRow('Service Charge', '₹499', isDarkMode, width),
              _buildBillRow('Interior Vacuum (Add On)', '₹150', isDarkMode, width),
              _buildBillRow('Coupon', '₹50', isDarkMode, width),
              _buildBillRow('Taxes (GST 18%)', '₹108', isDarkMode, width),
              Divider(
                color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
                thickness: 1,
              ),
              _buildBillRow('Total Payable', '₹707', isDarkMode, width, isBold: true),
            ],
          ),

          SizedBox(height: height * 0.02),

          // Payment Method - No Box
          Text(
            'Select Payment method',
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
          SizedBox(height: height * 0.01),

          Column(
            children: _paymentMethods.map((method) {
              return _buildPaymentOption(method, isDarkMode, width, height);
            }).toList(),
          ),

          SizedBox(height: height * 0.03),

          // Payment Button
          SizedBox(
            width: double.infinity,
            height: height * 0.06,
            child: ElevatedButton(
              onPressed: _showSuccessPopup,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Payment',
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
    );
  }

  Widget _buildSummaryRow(String label, String value, bool isDarkMode, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.006),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(
              fontSize: width * 0.032,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: width * 0.032,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillRow(String label, String value, bool isDarkMode, double width, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.006),
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

  Widget _buildPaymentOption(String label, bool isDarkMode, double width, double height) {
    final bool isSelected = _selectedPayment == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedPayment = label),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.012),
        child: Row(
          children: [
            Container(
              width: width * 0.05,
              height: width * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.green : (isDarkMode ? AppColor.textTertiary : Colors.grey.shade400),
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
            SizedBox(width: width * 0.03),
            Text(
              label,
              style: TextStyle(
                fontSize: width * 0.035,
                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}