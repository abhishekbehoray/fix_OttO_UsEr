import 'package:fixotto/Utils/AppColor.dart';
import 'package:flutter/material.dart';

class InsuranceDetailScreen extends StatefulWidget {
  const InsuranceDetailScreen({super.key});

  @override
  State<InsuranceDetailScreen> createState() => _InsuranceDetailScreenState();
}

class _InsuranceDetailScreenState extends State<InsuranceDetailScreen> {
  final TextEditingController _fileNameController = TextEditingController();
  String? _documentCategory = 'Insurance';
  String? _documentSubCategory = 'Car Insurance';
  int _currentPage = 0;

  // Detected details pulled from the OCR scan. Wire this up to your real
  // extraction result — these are placeholder values matching the mockup.
  final List<Map<String, String>> _detectedDetails = const [
    {'label': 'Document Type', 'value': 'Insurance'},
    {'label': 'Document Number', 'value': '113131212'},
    {'label': 'Issue Date', 'value': '12/09/2025'},
    {'label': 'Valid Till', 'value': '12/10/2025'},
  ];

  @override
  void dispose() {
    _fileNameController.dispose();
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
                      Expanded(
                        child: Center(
                          child: Text(
                            'Insurance & Pollution',
                            style: TextStyle(
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(width * 0.025),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.08)
                              : Colors.grey.shade100,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.share_rounded,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          size: width * 0.05,
                        ),
                      ),
                    ],
                  ),
                ),

                // Scanned document preview (placeholder — swap for the real scanned image)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Container(
                    height: height * 0.32,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: PageView(
                      onPageChanged: (index) => setState(() => _currentPage = index),
                      children: [
                        // TODO: replace with the actual scanned document image
                        Center(
                          child: Icon(
                            Icons.description_outlined,
                            size: width * 0.16,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        // TODO: replace with the actual second page image, if any
                        Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: width * 0.16,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.012),

                // Page indicator dots
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(2, (index) {
                      final bool active = index == _currentPage;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                        width: active ? width * 0.02 : width * 0.016,
                        height: active ? width * 0.02 : width * 0.016,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: active ? Colors.green.shade600 : Colors.grey.shade300,
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: height * 0.025),

                // Detected Details
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    children: [
                      Icon(Icons.auto_awesome_rounded, color: Colors.green.shade600, size: width * 0.05),
                      SizedBox(width: width * 0.02),
                      Text(
                        'Detected Details',
                        style: TextStyle(
                          fontSize: width * 0.042,
                          fontWeight: FontWeight.w700,
                          color: Colors.green.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.06, height * 0.004, width * 0.06, 0),
                  child: Text(
                    'Auto-Extracted Information (OCR Scan) with AI',
                    style: TextStyle(
                      fontSize: width * 0.032,
                      color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.015),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.008),
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
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: _detectedDetails.asMap().entries.map((entry) {
                        final isLast = entry.key == _detectedDetails.length - 1;
                        final detail = entry.value;
                        return Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: height * 0.014),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    detail['label']!,
                                    style: TextStyle(
                                      fontSize: width * 0.036,
                                      fontWeight: FontWeight.w600,
                                      color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    detail['value']!,
                                    style: TextStyle(
                                      fontSize: width * 0.036,
                                      color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (!isLast)
                              Divider(
                                height: 1,
                                color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                              ),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                // Basic Document Details
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline_rounded, color: Colors.green.shade600, size: width * 0.05),
                      SizedBox(width: width * 0.02),
                      Text(
                        'Basic Document Details',
                        style: TextStyle(
                          fontSize: width * 0.042,
                          fontWeight: FontWeight.w700,
                          color: Colors.green.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.06, height * 0.004, width * 0.06, 0),
                  child: Text(
                    'Review extracted details and confirm before saving to your vault',
                    style: TextStyle(
                      fontSize: width * 0.032,
                      color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // File Name
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'File Name',
                        style: TextStyle(
                          fontSize: width * 0.032,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: height * 0.008),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(width * 0.015),
                              decoration: BoxDecoration(
                                color: Colors.green.shade50,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.description_outlined,
                                size: width * 0.045,
                                color: Colors.green.shade600,
                              ),
                            ),
                            SizedBox(width: width * 0.03),
                            Expanded(
                              child: TextField(
                                controller: _fileNameController,
                                style: TextStyle(
                                  fontSize: width * 0.036,
                                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  isDense: true,
                                  hintText: 'Document Name',
                                  hintStyle: TextStyle(
                                    color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Document Category
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Document Category',
                        style: TextStyle(
                          fontSize: width * 0.032,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: height * 0.008),
                      _buildTagField(
                        value: _documentCategory,
                        hint: 'Select category',
                        isDarkMode: isDarkMode,
                        width: width,
                        onClear: () => setState(() => _documentCategory = null),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Document Sub Category
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Document Sub Category',
                        style: TextStyle(
                          fontSize: width * 0.032,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(height: height * 0.008),
                      _buildTagField(
                        value: _documentSubCategory,
                        hint: 'Select sub category',
                        isDarkMode: isDarkMode,
                        width: width,
                        onClear: () => setState(() => _documentSubCategory = null),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.03),

                // Save Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: SizedBox(
                    width: double.infinity,
                    height: height * 0.06,
                    child: ElevatedButton(
                      onPressed: () {
                        // TODO: persist the document to your vault/backend
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.015),

                // Cancel Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: SizedBox(
                    width: double.infinity,
                    height: height * 0.06,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: isDarkMode ? Colors.white.withOpacity(0.15) : Colors.grey.shade300,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTagField({
    required String? value,
    required String hint,
    required bool isDarkMode,
    required double width,
    required VoidCallback onClear,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: width * 0.02),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
        ),
      ),
      child: value == null
          ? Text(
        hint,
        style: TextStyle(
          fontSize: width * 0.036,
          color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
        ),
      )
          : Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: width * 0.012),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.description_outlined, size: width * 0.04, color: Colors.green.shade600),
                SizedBox(width: width * 0.02),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: width * 0.034,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade700,
                  ),
                ),
                SizedBox(width: width * 0.02),
                GestureDetector(
                  onTap: onClear,
                  child: Icon(Icons.close_rounded, size: width * 0.04, color: Colors.green.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}