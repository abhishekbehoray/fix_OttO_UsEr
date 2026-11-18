import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final VoidCallback? onAddToCart;
  const ProductDetailScreen({super.key, this.onAddToCart});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _cartCount = 0;

  void _addToCart() {
    setState(() => _cartCount++);
    widget.onAddToCart?.call();
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
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: _cartCount > 0 ? height * 0.1 : 0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Icon(Icons.arrow_back_rounded,
                                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                size: width * 0.06),
                          ),
                          SizedBox(width: width * 0.04),
                          Text('Product Detail',
                              style: TextStyle(fontSize: width * 0.055, fontWeight: FontWeight.w700,
                                  color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                        ],
                      ),

                      SizedBox(height: height * 0.02),

                      // Product Image
                      Center(
                        child: Image.asset(ImageAssets.seatName,
                            width: width * 0.7, height: height * 0.25, fit: BoxFit.contain),
                      ),

                      SizedBox(height: height * 0.02),

                      // Features
                      _buildSection(isDarkMode, width, [
                        _buildFeatureRow('Boosts Engine Performance', isDarkMode, width),
                        _buildFeatureRow('15% Milage Increase', isDarkMode, width),
                        _buildFeatureRow('Improves Vehicle Life', isDarkMode, width),
                      ]),

                      SizedBox(height: height * 0.02),

                      Text('Basic Service',
                          style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                      SizedBox(height: height * 0.01),

                      _buildSection(isDarkMode, width, [
                        _buildServiceRow('🕐 4 Hrs Taken', isDarkMode, width),
                        _buildServiceRow('🛡️ 1000 kms or 3 Months Warranty', isDarkMode, width),
                        _buildServiceRow('📅 Every 5000 kms or 6 Months (Recommended)', isDarkMode, width),
                        _buildServiceRow('🚚 Free Pick-up & Drop', isDarkMode, width),
                      ]),

                      SizedBox(height: height * 0.02),

                      Text('Additional Services',
                          style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                      SizedBox(height: height * 0.01),

                      _buildSection(isDarkMode, width, [
                        _buildServiceRow('🕐 4 Hrs Taken', isDarkMode, width),
                        _buildServiceRow('🛡️ 1000 kms or 3 Months Warranty', isDarkMode, width),
                        _buildServiceRow('📅 Every 5000 kms or 6 Months (Recommended)', isDarkMode, width),
                        _buildServiceRow('🚚 Free Pick-up & Drop', isDarkMode, width),
                      ]),

                      SizedBox(height: height * 0.02),

                      Text('Frequently Asked Questions',
                          style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                      SizedBox(height: height * 0.01),

                      _buildFAQItem('Why should i opt for a Basic Car Service?', isDarkMode, width, height),
                      _buildFAQItem('Why should i opt for a Basic Car Service?', isDarkMode, width, height),
                      _buildFAQItem('Why should i opt for a Basic Care Service?', isDarkMode, width, height),
                      _buildFAQItem('Why should i opt for a Basic Care Service?', isDarkMode, width, height),

                      SizedBox(height: height * 0.02),

                      // Price + Add to Cart
                      Row(
                        children: [
                          Text('₹ 4,900',
                              style: TextStyle(fontSize: width * 0.06, fontWeight: FontWeight.w700,
                                  color: AppColor.primary)),
                          const Spacer(),
                          GestureDetector(
                            onTap: _addToCart,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.018),
                              decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(30)),
                              child: Text('Add to cart',
                                  style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w600, color: Colors.white)),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              ),

              // View Cart bar
              if (_cartCount > 0)
                Positioned(
                  bottom: 0, left: 0, right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32, height: 32,
                          decoration: const BoxDecoration(color: AppColor.primary, shape: BoxShape.circle),
                          child: Center(
                            child: Text('$_cartCount',
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Text('$_cartCount item${_cartCount > 1 ? 's' : ''} in cart',
                            style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w500,
                                color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const MainWrapper(initialIndex: 3)),
                            (route) => false,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.013),
                            decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(30)),
                            child: Text('View Cart',
                                style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w600, color: Colors.white)),
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

  Widget _buildSection(bool isDarkMode, double width, List<Widget> children) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
    );
  }

  Widget _buildFeatureRow(String text, bool isDarkMode, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Icon(Icons.check_circle_rounded, color: AppColor.primary, size: width * 0.04),
          SizedBox(width: width * 0.02),
          Text(text, style: TextStyle(fontSize: width * 0.035,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildServiceRow(String text, bool isDarkMode, double width) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(text, style: TextStyle(fontSize: width * 0.032,
          color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700)),
    );
  }

  Widget _buildFAQItem(String question, bool isDarkMode, double width, double height) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.008),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.04) : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade200),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(question,
              style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.03),
              child: Text(
                'This is the answer to the frequently asked question. It provides detailed information about the service.',
                style: TextStyle(fontSize: width * 0.032,
                    color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
