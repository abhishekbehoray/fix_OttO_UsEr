import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedTab = 'All Products';

  final List<String> _tabs = ['All Products', 'Car Accessories', 'Car Care'];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Fresco Drift Car Seat Cover',
      'rating': 4.0,
      'price': '₹ 2000',
      'image': null, // Placeholder
    },
    {
      'name': 'Fresco Drift Car Seat Cover',
      'rating': 4.0,
      'price': '₹ 2000',
      'image': null,
    },
    {
      'name': 'Fresco Drift Car Seat Cover',
      'rating': 4.0,
      'price': '₹ 2000',
      'image': null,
    },
    {
      'name': 'Fresco Drift Car Seat Cover',
      'rating': 4.0,
      'price': '₹ 2000',
      'image': null,
    },
  ];

  List<Map<String, dynamic>> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = _products;
    _searchController.addListener(_filterProducts);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterProducts);
    _searchController.dispose();
    super.dispose();
  }

  void _filterProducts() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredProducts = _products
          .where((product) =>
          product['name'].toLowerCase().contains(query))
          .toList();
    });
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
                      'Favorite Product',
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.02),

                // Tabs
                SizedBox(
                  height: height * 0.045,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _tabs.length,
                    itemBuilder: (context, index) {
                      final tab = _tabs[index];
                      final isSelected = _selectedTab == tab;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedTab = tab),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.005,
                          ),
                          margin: EdgeInsets.only(right: width * 0.02),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColor.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: isSelected
                                  ? AppColor.primary
                                  : isDarkMode
                                  ? Colors.white.withOpacity(0.15)
                                  : Colors.grey.shade300,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              tab,
                              style: TextStyle(
                                fontSize: width * 0.032,
                                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                                color: isSelected
                                    ? Colors.white
                                    : isDarkMode
                                    ? AppColor.textSecondary
                                    : Colors.grey.shade600,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.015),

                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.12)
                          : Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.03,
                        ),
                        child: Icon(
                          Icons.search_rounded,
                          color: isDarkMode
                              ? AppColor.textTertiary
                              : Colors.grey.shade400,
                          size: width * 0.05,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          style: TextStyle(
                            color: isDarkMode
                                ? AppColor.textPrimary
                                : Colors.black87,
                            fontSize: width * 0.035,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                              color: isDarkMode
                                  ? AppColor.textTertiary
                                  : Colors.grey.shade400,
                              fontSize: width * 0.035,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: height * 0.018,
                            ),
                          ),
                        ),
                      ),
                      if (_searchController.text.isNotEmpty)
                        GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            _filterProducts();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: width * 0.03),
                            child: Icon(
                              Icons.clear_rounded,
                              color: isDarkMode
                                  ? AppColor.textTertiary
                                  : Colors.grey.shade400,
                              size: width * 0.045,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.015),

                // Product Grid
                Expanded(
                  child: _filteredProducts.isEmpty
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          size: width * 0.15,
                          color: isDarkMode
                              ? AppColor.textTertiary
                              : Colors.grey.shade400,
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'No favorite products',
                          style: TextStyle(
                            fontSize: width * 0.04,
                            color: isDarkMode
                                ? AppColor.textSecondary
                                : Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  )
                      : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      mainAxisExtent: 260,
                    ),
                    itemCount: _filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = _filteredProducts[index];
                      return _buildProductCard(
                        product,
                        isDarkMode,
                        width,
                        height,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(
      Map<String, dynamic> product,
      bool isDarkMode,
      double width,
      double height,
      ) {
    return Container(
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
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image - Placeholder
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.08),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    ImageAssets.seatName,
                    fit: BoxFit.contain,
                  ),
                ),
                // Favorite Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(width * 0.015),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                      size: width * 0.05,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Product Details
          Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: height * 0.005),
                // Rating
                Row(
                  children: [
                    ...List.generate(4, (index) => Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                      size: width * 0.04,
                    )),
                    Icon(
                      Icons.star_rounded,
                      color: Colors.grey.shade300,
                      size: width * 0.04,
                    ),
                    SizedBox(width: width * 0.01),
                    Text(
                      '${product['rating']}',
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.005),
                Text(
                  product['price'],
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w700,
                    color: AppColor.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
