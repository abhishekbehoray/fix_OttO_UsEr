import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/StoreScreens/ProductDetailScreen.dart';
import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:flutter/material.dart';

class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({super.key});

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  int _cartCount = 0;

  final List<Map<String, dynamic>> products = [
    {'name': 'Fresco Drift Car\nSeat Cover', 'rating': 4.0, 'price': '₹ 2000', 'discount': '25% OFF', 'image': ImageAssets.seatName},
    {'name': 'Fresco Drift Car Seat Cover', 'rating': 4.0, 'price': '₹ 2000', 'discount': null, 'image': ImageAssets.seatName},
    {'name': 'Fresco Drift Car Seat Cover', 'rating': 4.0, 'price': '₹ 2000', 'discount': '25% OFF', 'image': ImageAssets.seatName},
    {'name': 'Fresco Drift Car Seat Cover', 'rating': 4.0, 'price': '₹ 2000', 'discount': null, 'image': ImageAssets.seatName},
    {'name': 'Fresco Drift Car Seat Cover', 'rating': 4.0, 'price': '₹ 2000', 'discount': '25% OFF', 'image': ImageAssets.seatName},
    {'name': 'Fresco Drift Car Seat Cover', 'rating': 4.0, 'price': '₹ 2000', 'discount': null, 'image': ImageAssets.seatName},
    {'name': 'Fresco Drift Car Seat Cover', 'rating': 4.0, 'price': '₹ 2000', 'discount': '25% OFF', 'image': ImageAssets.seatName},
    {'name': 'Fresco Drift Car Seat Cover', 'rating': 4.0, 'price': '₹ 2000', 'discount': null, 'image': ImageAssets.seatName},
  ];

  void _addToCart() {
    setState(() => _cartCount++);
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
          color: isDarkMode ? null : const Color(0xFFF6F6F6),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: _cartCount > 0 ? height * 0.1 : 0),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04, vertical: height * 0.02),
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
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: Text(
                              'Car Care & Maintenance',
                              style: TextStyle(
                                fontSize: width * 0.048,
                                fontWeight: FontWeight.w700,
                                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: height * 0.02),

                      // Banner
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          ImageAssets.careBanner,
                          width: double.infinity,
                          height: height * 0.15,
                          fit: BoxFit.cover,
                        ),
                      ),

                      SizedBox(height: height * 0.02),

                      // Top Products - Only 2
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Top Products',
                              style: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.w700,
                                  color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                          Text('View All',
                              style: TextStyle(fontSize: width * 0.032, fontWeight: FontWeight.w600,
                                  color: AppColor.primary)),
                        ],
                      ),
                      SizedBox(height: height * 0.012),

                      // Top Products - Only 2 in Column
                      Column(
                        children: [
                          _buildTopProductCard(
                              context, products[0], isDarkMode, width, height),
                          SizedBox(height: height * 0.015),
                          _buildTopProductCard(
                              context, products[1], isDarkMode, width, height),
                        ],
                      ),

                      SizedBox(height: height * 0.02),

                      // All Products
                      Text('All Products',
                          style: TextStyle(fontSize: width * 0.045, fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87)),
                      SizedBox(height: height * 0.012),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          mainAxisExtent: 230,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) => _buildProductCard(
                            context, products[index], isDarkMode, width, height),
                      ),

                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              ),

              // View Cart bar
              if (_cartCount > 0)
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -2)),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(color: AppColor.primary, shape: BoxShape.circle),
                          child: Center(
                            child: Text('$_cartCount',
                                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Text(
                          '$_cartCount item${_cartCount > 1 ? 's' : ''} in cart',
                          style: TextStyle(fontSize: width * 0.035, fontWeight: FontWeight.w500,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => const MainWrapper(initialIndex: 3)),
                                (route) => false,
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: width * 0.06, vertical: height * 0.013),
                            decoration: BoxDecoration(
                              color: AppColor.primary,
                              borderRadius: BorderRadius.circular(30),
                            ),
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

  Widget _buildTopProductCard(BuildContext context, Map<String, dynamic> product,
      bool isDarkMode, double width, double height) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => ProductDetailScreen(onAddToCart: _addToCart))),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(width * 0.025),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(product['name'],
                        style: TextStyle(fontSize: width * 0.032, fontWeight: FontWeight.w500,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87),
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Row(children: List.generate(5, (i) => Icon(Icons.star_rounded,
                        color: i < 4 ? Colors.amber : Colors.grey.shade300, size: width * 0.028))),
                    const SizedBox(height: 4),
                    Text(product['price'],
                        style: TextStyle(fontSize: width * 0.032, fontWeight: FontWeight.w700, color: AppColor.primary)),
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: _addToCart,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(6)),
                        child: Text('Add', style: TextStyle(fontSize: width * 0.028, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: height * 0.15,
                decoration: BoxDecoration(
                  color: AppColor.primary.withOpacity(0.05),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                ),
                child: Stack(
                  children: [
                    Center(child: Image.asset(product['image'], width: width * 0.16, fit: BoxFit.contain)),
                    if (product['discount'] != null)
                      Positioned(
                        top: 6, right: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                          child: Text(product['discount'], style: TextStyle(fontSize: width * 0.02, fontWeight: FontWeight.w600, color: Colors.white)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> product,
      bool isDarkMode, double width, double height) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (_) => ProductDetailScreen(onAddToCart: _addToCart))),
      child: Container(
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 8)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image area
            Container(
              width: double.infinity,
              height: 110,
              decoration: BoxDecoration(
                color: AppColor.primary.withOpacity(0.05),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              ),
              child: Stack(
                children: [
                  Center(child: Image.asset(product['image'], width: width * 0.22, fit: BoxFit.contain)),
                  if (product['discount'] != null)
                    Positioned(
                      top: 8, left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(4)),
                        child: Text(product['discount'], style: TextStyle(fontSize: width * 0.025, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    ),
                ],
              ),
            ),
            // Details
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product['name'],
                        style: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.w500,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87),
                        maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Row(children: List.generate(5, (i) => Icon(Icons.star_rounded,
                        color: i < 4 ? Colors.amber : Colors.grey.shade300, size: width * 0.03))),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product['price'],
                            style: TextStyle(fontSize: width * 0.032, fontWeight: FontWeight.w700, color: AppColor.primary)),
                        GestureDetector(
                          onTap: _addToCart,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(6)),
                            child: Text('Add', style: TextStyle(fontSize: width * 0.028, fontWeight: FontWeight.w600, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}