import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:flutter/material.dart';

class BasicServiceScreen extends StatefulWidget {
  final ValueNotifier<int>? cartNotifier;
  const BasicServiceScreen({super.key, this.cartNotifier});

  @override
  State<BasicServiceScreen> createState() => _BasicServiceScreenState();
}

class _BasicServiceScreenState extends State<BasicServiceScreen> {
  bool _addedToCart = false;
  late final ValueNotifier<int> _cartNotifier;

  @override
  void initState() {
    super.initState();
    _cartNotifier = widget.cartNotifier ?? ValueNotifier(0);
    _cartNotifier.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    _cartNotifier.removeListener(_onCartChanged);
    if (widget.cartNotifier == null) _cartNotifier.dispose();
    super.dispose();
  }

  void _onCartChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    final int cartCount = _cartNotifier.value;

    final List<Map<String, String>> faqs = [
      {'question': 'Why should I opt for a Basic Car Service?'},
      {'question': 'Why should I opt for a Basic Car Service?'},
      {'question': 'Why should I opt for a Basic Car Service?'},
      {'question': 'Why should I opt for a Basic Car Service?'},
    ];

    // Essential Services: image + label. Set an asset path in 'image' to replace the placeholder box.
    final List<Map<String, String?>> includedServices = [
      {'label': 'Engine Oil\nReplacement', 'image': null},
      {'label': 'Oil Filter\nReplacement', 'image': null},
      {'label': 'Air Filter\nCleaning', 'image': null},
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
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: cartCount > 0 ? height * 0.1 : 0),
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
                                'Basic Service',
                                style: TextStyle(
                                  fontSize: width * 0.055,
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

                    // Service Image with feature bullets overlaid
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                      height: height * 0.28,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        // TODO: swap for your actual banner asset/image
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.carServiceImageOne),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.55),
                                ],
                                stops: const [0.4, 1.0],
                              ),
                            ),
                          ),
                          Positioned(
                            left: width * 0.04,
                            right: width * 0.04,
                            bottom: height * 0.015,
                            child: Wrap(
                              spacing: width * 0.06,
                              runSpacing: height * 0.005,
                              children: [
                                _buildBannerBullet('Boosts Engine Performance', width),
                                _buildBannerBullet('15% Mileage Increase', width),
                                _buildBannerBullet('Improves Vehicle Life', width),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    // Essential Service
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Text('Essential Service',
                          style: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                    ),
                    SizedBox(height: height * 0.015),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Column(
                        children: [
                          _buildDetailRow(Icons.hourglass_bottom_rounded, Colors.grey.shade200,
                              Colors.grey.shade700, '1 Hrs Taken', isDarkMode, width, height),
                          _buildDetailRow(Icons.verified_rounded, Colors.green.shade50,
                              Colors.green.shade700, '1000 kms or 3 Months Warranty', isDarkMode, width, height),
                          _buildDetailRow(Icons.card_giftcard_rounded, const Color(0xFFF3E8FF),
                              const Color(0xFF9333EA), 'Every 5000 kms or 6 Months (Recommended)', isDarkMode, width, height),
                          _buildDetailRow(Icons.location_on_rounded, const Color(0xFFE0F2FE),
                              const Color(0xFF0284C7), 'Free Pick-up & Drop', isDarkMode, width, height),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Divider(color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
                    ),
                    SizedBox(height: height * 0.015),

                    // What's Included
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Text("What's Included?",
                          style: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                    ),
                    SizedBox(height: height * 0.015),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Text('Essential Services',
                          style: TextStyle(fontSize: width * 0.038, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                    ),
                    SizedBox(height: height * 0.012),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Row(
                        children: includedServices.map((service) {
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: service == includedServices.last ? 0 : width * 0.03,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: width * 0.24,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.grey.shade200,
                                      image: service['image'] != null
                                          ? DecorationImage(
                                        image: AssetImage(service['image']!),
                                        fit: BoxFit.cover,
                                      )
                                          : null,
                                    ),
                                    child: service['image'] == null
                                        ? Icon(
                                      Icons.image_outlined,
                                      color: Colors.grey.shade400,
                                      size: width * 0.08,
                                    )
                                        : null,
                                  ),
                                  SizedBox(height: height * 0.008),
                                  Text(
                                    service['label']!,
                                    style: TextStyle(
                                      fontSize: width * 0.032,
                                      fontWeight: FontWeight.w600,
                                      color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Text('Additional Services',
                          style: TextStyle(fontSize: width * 0.038, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                    ),
                    SizedBox(height: height * 0.012),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Column(
                        children: [
                          _buildCheckRow('4 Hrs Taken', isDarkMode, width, height),
                          _buildCheckRow('1000 kms or 3 Months Warranty', isDarkMode, width, height),
                          _buildCheckRow('Every 5000 kms or 6 Months (Recommended)', isDarkMode, width, height),
                          _buildCheckRow('Free Pick-up & Drop', isDarkMode, width, height),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.015),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Divider(color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
                    ),
                    SizedBox(height: height * 0.015),

                    // FAQ Section
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Text('Frequently Asked Questions',
                          style: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                    ),
                    SizedBox(height: height * 0.005),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Column(
                        children: faqs.asMap().entries.map((entry) =>
                            _buildFAQItem(context, entry.value['question']!, isDarkMode, width,
                                isLast: entry.key == faqs.length - 1)).toList(),
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    // Price and Add to Cart — full-width green bar
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_addedToCart) {
                              _addedToCart = false;
                              _cartNotifier.value = (_cartNotifier.value - 1).clamp(0, 999);
                            } else {
                              _addedToCart = true;
                              _cartNotifier.value++;
                            }
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.02),
                          decoration: BoxDecoration(
                            color: _addedToCart ? Colors.grey.shade400 : Colors.green.shade600,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('₹ 1000 advance +',
                                      style: TextStyle(fontSize: width * 0.032, fontWeight: FontWeight.w500,
                                          color: Colors.white.withOpacity(0.85))),
                                  Text('₹ 4,000',
                                      style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.w800,
                                          color: Colors.white)),
                                ],
                              ),
                              const Spacer(),
                              Text(
                                _addedToCart ? 'Added to cart' : 'Add to cart',
                                style: TextStyle(fontSize: width * 0.038, fontWeight: FontWeight.w700, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),

              // Sticky cart bar
              if (cartCount > 0)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2))],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(color: Colors.green.shade600, shape: BoxShape.circle),
                          child: Center(
                            child: Text('$cartCount',
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Text('$cartCount item${cartCount > 1 ? 's' : ''} in cart',
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
                            decoration: BoxDecoration(color: Colors.green.shade600, borderRadius: BorderRadius.circular(30)),
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

  Widget _buildBannerBullet(String text, double width) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width * 0.012,
          height: width * 0.012,
          decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        ),
        SizedBox(width: width * 0.015),
        Text(
          text,
          style: TextStyle(
            fontSize: width * 0.03,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, Color bgColor, Color iconColor, String text,
      bool isDarkMode, double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.008),
      child: Row(
        children: [
          Container(
            width: width * 0.1,
            height: width * 0.1,
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.white.withOpacity(0.08) : bgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: width * 0.05, color: iconColor),
          ),
          SizedBox(width: width * 0.03),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.036,
                color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckRow(String text, bool isDarkMode, double width, double height) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.008),
      child: Row(
        children: [
          Container(
            width: width * 0.06,
            height: width * 0.06,
            decoration: BoxDecoration(color: Colors.green.shade600, shape: BoxShape.circle),
            child: Icon(Icons.check_rounded, size: width * 0.04, color: Colors.white),
          ),
          SizedBox(width: width * 0.03),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.036,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, bool isDarkMode, double width, {bool isLast = false}) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: Column(children: [
        ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: EdgeInsets.zero,
          title: Text(question, style: TextStyle(fontSize: width * 0.036, fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: width * 0.03),
              child: Text(
                'This is the answer to the frequently asked question. It provides detailed information about the service.',
                style: TextStyle(fontSize: width * 0.03,
                    color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600),
              ),
            ),
          ],
        ),
        Divider(color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200, thickness: 0.5),
      ]),
    );
  }
}