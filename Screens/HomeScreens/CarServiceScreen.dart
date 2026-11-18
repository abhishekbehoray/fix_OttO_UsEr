import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/HomeScreens/BasicServiceScreen.dart';
import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:flutter/material.dart';

class CarServiceScreen extends StatefulWidget {
  const CarServiceScreen({super.key});

  @override
  State<CarServiceScreen> createState() => _CarServiceScreenState();
}

class _CarServiceScreenState extends State<CarServiceScreen> {
  final Set<int> _addedToCart = {};
  late final ValueNotifier<int> _cartNotifier;

  @override
  void initState() {
    super.initState();
    _cartNotifier = ValueNotifier(0);
    _cartNotifier.addListener(_onCartChanged);
  }

  @override
  void dispose() {
    _cartNotifier.removeListener(_onCartChanged);
    _cartNotifier.dispose();
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

    final List<Map<String, dynamic>> packages = [
      {
        'name': 'Essential Service',
        'interval': 'Every 5000 kms / 6 Months',
        'time': 'Takes 4 Hours',
        'warranty': '3 Months Warranty',
        'services': 'Includes 9 Services',
        'price': '₹ 2000',
        'originalPrice': '₹2999',
        'discount': '25 % OFF',
        'image': null,
      },
      {
        'name': 'Premium Service',
        'interval': 'Every 5000 kms / 6 Months',
        'time': 'Takes 4 Hours',
        'warranty': '3 Months Warranty',
        'services': 'Includes 9 Services',
        'price': '₹ 2000',
        'originalPrice': '₹2999',
        'discount': '25 % OFF',
        'image': null,
      },
      {
        'name': 'Advanced pro Service',
        'interval': 'Every 5000 kms / 6 Months',
        'time': 'Takes 4 Hours',
        'warranty': '3 Months Warranty',
        'services': 'Includes 9 Services',
        'price': '₹ 2000',
        'originalPrice': '₹2999',
        'discount': '25 % OFF',
        'image': null,
      },
    ];

    final int cartCount = _cartNotifier.value;

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
                                'Car Service',
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
                              Icons.search_rounded,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                              size: width * 0.055,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Banner
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                      height: height * 0.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(ImageAssets.carServiceImageOne),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Text(
                        'Scheduled Packages',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.015),

                    // Package Cards
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                      child: Column(
                        children: packages.asMap().entries.map((entry) {
                          final index = entry.key;
                          final package = entry.value;
                          final isAdded = _addedToCart.contains(index);
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => BasicServiceScreen(cartNotifier: _cartNotifier)),
                            ),
                            child: Container(
                              margin: EdgeInsets.only(bottom: height * 0.02),
                              padding: EdgeInsets.all(width * 0.035),
                              decoration: BoxDecoration(
                                color: isDarkMode
                                    ? Colors.white.withOpacity(0.06)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: isDarkMode
                                      ? Colors.white.withOpacity(0.08)
                                      : Colors.grey.shade200,
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          package['name'],
                                          style: TextStyle(
                                            fontSize: width * 0.042,
                                            fontWeight: FontWeight.w700,
                                            color: isDarkMode
                                                ? AppColor.textPrimary
                                                : Colors.black87,
                                          ),
                                        ),
                                        SizedBox(height: height * 0.008),
                                        _buildPackageDetail(package['interval'], isDarkMode, width),
                                        _buildPackageDetail(package['time'], isDarkMode, width),
                                        _buildPackageDetail(package['warranty'], isDarkMode, width),
                                        _buildPackageDetail(package['services'], isDarkMode, width),
                                        SizedBox(height: height * 0.01),
                                        Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          spacing: width * 0.02,
                                          children: [
                                            Text(
                                              package['originalPrice'],
                                              style: TextStyle(
                                                fontSize: width * 0.032,
                                                decoration: TextDecoration.lineThrough,
                                                color: isDarkMode
                                                    ? AppColor.textTertiary
                                                    : Colors.grey.shade500,
                                              ),
                                            ),
                                            Text(
                                              package['price'],
                                              style: TextStyle(
                                                fontSize: width * 0.04,
                                                fontWeight: FontWeight.w700,
                                                color: isDarkMode
                                                    ? AppColor.textPrimary
                                                    : Colors.black87,
                                              ),
                                            ),
                                            Text(
                                              package['discount'],
                                              style: TextStyle(
                                                fontSize: width * 0.03,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.green.shade600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: width * 0.03),
                                  Column(
                                    children: [
                                      Container(
                                        width: width * 0.26,
                                        height: width * 0.26,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: Colors.grey.shade200,
                                          image: package['image'] != null
                                              ? DecorationImage(
                                            image: AssetImage(package['image']),
                                            fit: BoxFit.cover,
                                          )
                                              : null,
                                        ),
                                        child: package['image'] == null
                                            ? Icon(
                                          Icons.image_outlined,
                                          color: Colors.grey.shade400,
                                          size: width * 0.08,
                                        )
                                            : null,
                                      ),
                                      SizedBox(height: height * 0.01),
                                      GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          setState(() {
                                            if (isAdded) {
                                              _addedToCart.remove(index);
                                              _cartNotifier.value = (_cartNotifier.value - 1).clamp(0, 999);
                                            } else {
                                              _addedToCart.add(index);
                                              _cartNotifier.value++;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: width * 0.26,
                                          padding: EdgeInsets.symmetric(
                                            vertical: height * 0.008,
                                          ),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: isAdded
                                                ? Colors.grey.shade400
                                                : Colors.green.shade600,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            isAdded ? 'Added' : 'Add',
                                            style: TextStyle(
                                              fontSize: width * 0.032,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    SizedBox(height: height * 0.02),
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
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05, vertical: height * 0.015),
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, -2)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                              color: AppColor.primary, shape: BoxShape.circle),
                          child: Center(
                            child: Text('$cartCount',
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Text(
                          '$cartCount item${cartCount > 1 ? 's' : ''} in cart',
                          style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode
                                  ? AppColor.textPrimary
                                  : Colors.black87),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MainWrapper(initialIndex: 3)),
                            (route) => false,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.06, vertical: height * 0.013),
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text('View Cart',
                                style: TextStyle(
                                    fontSize: width * 0.035,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
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

  Widget _buildPackageDetail(String text, bool isDarkMode, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.006),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: width * 0.015,
            height: width * 0.015,
            decoration: BoxDecoration(
              color: Colors.green.shade600,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: width * 0.02),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: width * 0.03,
                color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
