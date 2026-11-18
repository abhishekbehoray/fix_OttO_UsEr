import 'package:fixotto/Utils/AppColor.dart';
import 'package:flutter/material.dart';

class AddressContent extends StatefulWidget {
  final VoidCallback? onNext;

  const AddressContent({super.key, this.onNext});

  @override
  State<AddressContent> createState() => _AddressContentState();
}

class _AddressContentState extends State<AddressContent> {
  String _selectedAddress = 'Home';

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Address',
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
          ),
        ),
        SizedBox(height: height * 0.02),

        _buildAddressCard(
          'Home',
          '112/23, Rajouri Garden, New Delhi, Delhi',
          isDarkMode,
          width,
          height,
        ),
        SizedBox(height: height * 0.015),

        _buildAddressCard(
          'Office',
          '112/23, Rajouri Garden, New Delhi, Delhi',
          isDarkMode,
          width,
          height,
        ),

        SizedBox(height: height * 0.02),

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

        const Spacer(),

        SizedBox(
          width: double.infinity,
          height: height * 0.06,
          child: ElevatedButton(
            onPressed: widget.onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Next',
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
    );
  }

  Widget _buildAddressCard(
      String title,
      String address,
      bool isDarkMode,
      double width,
      double height,
      ) {
    final bool isSelected = _selectedAddress == title;
    return GestureDetector(
      onTap: () => setState(() => _selectedAddress = title),
      child: Container(
        padding: EdgeInsets.all(width * 0.04),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.withOpacity(0.08) : (isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? Colors.green : (isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
            width: isSelected ? 2 : 1,
          ),
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
            Container(
              width: width * 0.05,
              height: width * 0.05,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey.shade400,
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
          ],
        ),
      ),
    );
  }
}