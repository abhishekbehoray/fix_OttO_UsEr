import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/CartScreens/CheckoutScreen.dart';
import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _quantity1 = 1;
  int _quantity2 = 1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateStatusBar());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateStatusBar();
  }

  void _updateStatusBar() {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
    ));
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainWrapper(initialIndex: 0)),
            (route) => false,
          );
        }
      },
      child: Scaffold(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'My Cart',
                        style: TextStyle(
                          fontSize: width * 0.06,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.02),

                    _buildCartItem('Fresco Drift Car Seat Cover', '₹ 2000', '₹ 2999', _quantity1,
                        (val) => setState(() => _quantity1 = val), isDarkMode, width, height),

                    SizedBox(height: height * 0.015),

                    _buildCartItem('Fresco Drift Car Seat Cover', '₹ 2000', '₹ 2999', _quantity2,
                        (val) => setState(() => _quantity2 = val), isDarkMode, width, height),

                    SizedBox(height: height * 0.025),

                    Container(
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8, spreadRadius: 0),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bill Details',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          _buildBillRow('Price (2 item)', '₹14,400', isDarkMode, width),
                          _buildBillRow('Discount', '₹2,300', isDarkMode, width),
                          _buildBillRow('Delivery Charges', 'Free', isDarkMode, width),
                          _buildBillRow('Net Amount', '₹1,300', isDarkMode, width),
                          _buildBillRow('Advance Amount (10%)', '₹1,300', isDarkMode, width),
                          SizedBox(height: height * 0.005),
                          Text(
                            '10% advance is collected to confirm the booking and assign the mechanic.',
                            style: TextStyle(
                              fontSize: width * 0.028,
                              color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Divider(
                            color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                            thickness: 1,
                          ),
                          _buildBillRow('Total', '₹12,100', isDarkMode, width, isBold: true),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    SizedBox(
                      width: double.infinity,
                      height: height * 0.06,
                      child: ElevatedButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const CheckoutScreen())),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text(
                          'Proceed to Checkout',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.025),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Coupon',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            child: TextField(
                              style: TextStyle(
                                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                fontSize: width * 0.035,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Type coupon code here',
                                hintStyle: TextStyle(
                                  color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                                  fontSize: width * 0.035,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04,
                                  vertical: height * 0.015,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.015),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            'Apply',
                            style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.02),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'BEST OFFERS FOR YOU',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),

                    Container(
                      padding: EdgeInsets.all(width * 0.04),
                      decoration: BoxDecoration(
                        color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Flat ₹150 OFF using ICICI Credit card and debit card',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                            ),
                          ),
                          Text(
                            'Applicable on transactions above ₹799',
                            style: TextStyle(fontSize: width * 0.03, color: Colors.red, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.005),
                                decoration: BoxDecoration(
                                  color: AppColor.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Text(
                                  'ZPARTY75',
                                  style: TextStyle(
                                    fontSize: width * 0.03,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.primary,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: height * 0.012),
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: Text(
                                'TAP TO APPLY',
                                style: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.w600, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.025),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCartItem(
    String name,
    String price,
    String originalPrice,
    int quantity,
    ValueChanged<int> onQuantityChanged,
    bool isDarkMode,
    double width,
    double height,
  ) {
    return Container(
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
          Container(
            width: width * 0.15,
            height: width * 0.15,
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              ImageAssets.seatName,
              width: width * 0.1,
              height: width * 0.1,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(
                Icons.inventory_2_outlined,
                size: width * 0.08,
                color: AppColor.primary.withOpacity(0.4),
              ),
            ),
          ),
          SizedBox(width: width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: height * 0.005),
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w700, color: AppColor.primary),
                    ),
                    SizedBox(width: width * 0.02),
                    Text(
                      originalPrice,
                      style: TextStyle(
                        fontSize: width * 0.03,
                        decoration: TextDecoration.lineThrough,
                        color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.005),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () { if (quantity > 1) onQuantityChanged(quantity - 1); },
                      child: Container(
                        padding: EdgeInsets.all(width * 0.02),
                        decoration: BoxDecoration(
                          color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(Icons.remove_rounded, size: width * 0.04,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87),
                      ),
                    ),
                    SizedBox(width: width * 0.03),
                    Text(
                      '$quantity',
                      style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87),
                    ),
                    SizedBox(width: width * 0.03),
                    GestureDetector(
                      onTap: () => onQuantityChanged(quantity + 1),
                      child: Container(
                        padding: EdgeInsets.all(width * 0.02),
                        decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(8)),
                        child: Icon(Icons.add_rounded, size: width * 0.04, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBillRow(String label, String value, bool isDarkMode, double width, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.008),
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
                  ? AppColor.primary
                  : (isDarkMode ? AppColor.textSecondary : Colors.grey.shade600),
            ),
          ),
        ],
      ),
    );
  }
}
