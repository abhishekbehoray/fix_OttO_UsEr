import 'package:fixotto/Screens/StoreScreens/ProductDetailScreen.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/StoreScreens/AllProductsScreen.dart';
import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
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

    final List<Map<String, dynamic>> categories = [
      {
        'image': ImageAssets.bannerOne,
        'isClickable': true,
      },
      {
        'image': ImageAssets.bannerTwo,
        'isClickable': false,
      },
      {
        'image': ImageAssets.bannerThree,
        'isClickable': false,
      },
      {
        'image': ImageAssets.bannerFour,
        'isClickable': false,
      },
      {
        'image': ImageAssets.bannerFive,
        'isClickable': false,
      },
      {
        'image': ImageAssets.bannerSix,
        'isClickable': false,
      },
      {
        'image': ImageAssets.bannerSeven,
        'isClickable': false,
      },
    ];

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
                  // Header - Centered
                  Center(
                    child: Text(
                      'My Store',
                      style: TextStyle(
                        fontSize: width * 0.06,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Car Category - Left Aligned
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Car Category',
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.015),

                  // Row 1: BannerOne (large left) + BannerTwo & BannerThree (small right column)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Banner One - Large
                      Expanded(
                        flex: 2,
                        child: _buildCategoryCard(
                          categories[0],
                          height * 0.35,
                          isDarkMode,
                          width,
                          height,
                          context,
                        ),
                      ),
                      SizedBox(width: width * 0.03),
                      // Banner Two & Three - Small stacked in column
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            _buildCategoryCard(
                              categories[1],
                              height * 0.17,
                              isDarkMode,
                              width,
                              height,
                              context,
                            ),
                            SizedBox(height: height * 0.01),
                            _buildCategoryCard(
                              categories[2],
                              height * 0.17,
                              isDarkMode,
                              width,
                              height,
                              context,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

                  // Row 2: BannerFour - Full width
                  _buildCategoryCard(
                    categories[3],
                    height * 0.2,
                    isDarkMode,
                    width,
                    height,
                    context,
                  ),

                  SizedBox(height: height * 0.02),

                  // Row 3: BannerFive (large left) + BannerSix & BannerSeven (small right column)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Banner Five - Large

                      SizedBox(width: width * 0.03),
                      // Banner Six & Seven - Small stacked in column
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            _buildCategoryCard(
                              categories[4],
                              height * 0.17,
                              isDarkMode,
                              width,
                              height,
                              context,
                            ),
                            SizedBox(height: height * 0.01),
                            _buildCategoryCard(
                              categories[6],
                              height * 0.17,
                              isDarkMode,
                              width,
                              height,
                              context,
                            ),
                          ],
                        ),
                      ),

                      SizedBox(width: width * 0.03),

                      Expanded(
                        flex: 2,
                        child: _buildCategoryCard(
                          categories[5],
                          height * 0.35,
                          isDarkMode,
                          width,
                          height,
                          context,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.02),

                  // Top Products - Left Aligned
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Top Products',
                      style: TextStyle(
                        fontSize: width * 0.045,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.015),

                  // Top Products Horizontal Scroll
                  SizedBox(
                    height: height * 0.28,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          width: width * 0.4,
                          margin: EdgeInsets.only(right: width * 0.03),
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
                              Container(
                                width: double.infinity,
                                height: height * 0.14,
                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.05),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12),
                                  ),
                                ),
                                child: Image.asset(
                                  ImageAssets.seatName,
                                  width: width * 0.2,
                                  height: height * 0.1,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(width * 0.025),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Fresco Drift Car Seat Cover',
                                      style: TextStyle(
                                        fontSize: width * 0.03,
                                        fontWeight: FontWeight.w500,
                                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: height * 0.003),
                                    Row(
                                      children: List.generate(4, (index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                        size: width * 0.03,
                                      )),
                                    ),
                                    SizedBox(height: height * 0.003),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '₹ 2000',
                                          style: TextStyle(
                                            fontSize: width * 0.03,
                                            fontWeight: FontWeight.w700,
                                            color: AppColor.primary,
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const ProductDetailScreen(),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: width * 0.03,
                                              vertical: height * 0.005,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColor.primary,
                                              borderRadius: BorderRadius.circular(4),
                                            ),
                                            child: Text(
                                              'Add',
                                              style: TextStyle(
                                                fontSize: width * 0.025,
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
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: height * 0.02),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }

  Widget _buildCategoryCard(
      Map<String, dynamic> category,
      double heightValue,
      bool isDarkMode,
      double width,
      double height,
      BuildContext context,
      ) {
    return GestureDetector(
      onTap: () {
        if (category['isClickable'] == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AllProductsScreen(),
            ),
          );
        }
      },
      child: Container(
        width: double.infinity,
        height: heightValue,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: category['isClickable'] == true
                ? AppColor.primary
                : (isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
            width: category['isClickable'] == true ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              spreadRadius: 0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            category['image'],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}