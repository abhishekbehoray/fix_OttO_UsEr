import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/HomeScreens/SOSDetailScreen.dart';
import 'package:flutter/material.dart';

class SOSScreen extends StatelessWidget {
  const SOSScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    // Nearby place chips scattered over the map, positioned roughly the way
    // they appear in the reference design. top/left/right/bottom are
    // fractions of the map's width/height (null = not used for that axis).
    final List<Map<String, dynamic>> mapPlaces = [
      {
        'name': 'Kumar Samosa Wala',
        'icon': Icons.restaurant_rounded,
        'color': Colors.orange,
        'top': 0.06,
        'left': 0.10,
      },
      {
        'name': 'Milan cinema',
        'icon': Icons.local_movies_rounded,
        'color': Colors.purple,
        'top': 0.02,
        'left': 0.52,
      },
      {
        'name': 'Nike Factory Store',
        'icon': Icons.storefront_rounded,
        'color': Colors.blue,
        'top': 0.24,
        'left': 0.38,
      },
      {
        'name': 'Haldiran',
        'icon': Icons.restaurant_rounded,
        'color': Colors.orange,
        'top': 0.16,
        'right': 0.06,
      },
      {
        'name': 'Cinemas TDI Mall',
        'icon': Icons.local_movies_rounded,
        'color': Colors.purple,
        'top': 0.52,
        'left': 0.02,
      },
      {
        'name': 'Kalra Hospitals',
        'icon': Icons.local_hospital_rounded,
        'color': Colors.red,
        'top': 0.62,
        'left': 0.04,
      },
      {
        'name': 'Kirti Nagar',
        'icon': Icons.directions_subway_rounded,
        'color': Colors.red,
        'top': 0.56,
        'right': 0.04,
      },
    ];

    final List<Map<String, dynamic>> services = [
      {'name': 'Denting & Painting', 'icon': ImageAssets.sosImageOne},
      {'name': 'Clutch & Body Parts', 'icon': ImageAssets.sosImageTwo},
      {'name': 'AC Service & Repair', 'icon': ImageAssets.sosImageThree},
      {'name': 'Denting & Painting', 'icon': ImageAssets.sosImageFour},
      {'name': 'Clutch & Body Parts', 'icon': ImageAssets.sosImageFive},
      {'name': 'AC Service & Repair', 'icon': ImageAssets.sosImageSix},
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
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                          size: width * 0.06,
                        ),
                      ),
                      SizedBox(width: width * 0.04),
                      Row(
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                              fontSize: width * 0.055,
                              fontWeight: FontWeight.w700,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                            size: width * 0.06,
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SOSDetailScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.04,
                            vertical: height * 0.008,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'SOS',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Location Address
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Container(
                    padding: EdgeInsets.all(width * 0.03),
                    decoration: BoxDecoration(
                      color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_rounded,
                          color: Colors.red,
                          size: width * 0.05,
                        ),
                        SizedBox(width: width * 0.02),
                        Expanded(
                          child: Text(
                            'Moti Nagar Rd, DLE Industrial...',
                            style: TextStyle(
                              fontSize: width * 0.035,
                              fontWeight: FontWeight.w500,
                              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.015),

                // Map mockup with scattered place chips + a center pin for
                // the selected location.
                // TODO: Replace this Container with a real map widget
                // (google_maps_flutter / flutter_map).
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                  height: height * 0.32,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                  child: Stack(
                    children: [
                      for (final place in mapPlaces)
                        Positioned(
                          top: place['top'] != null ? height * 0.32 * place['top'] : null,
                          bottom: place['bottom'] != null ? height * 0.32 * place['bottom'] : null,
                          left: place['left'] != null ? width * 0.88 * place['left'] : null,
                          right: place['right'] != null ? width * 0.88 * place['right'] : null,
                          child: _buildMapChip(
                            place['name'],
                            place['icon'],
                            place['color'],
                            isDarkMode,
                            width,
                          ),
                        ),
                      // Selected location pin, centered on the map
                      Positioned.fill(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.red,
                                size: width * 0.08,
                              ),
                              Text(
                                'MOTI NAGAR',
                                style: TextStyle(
                                  fontSize: width * 0.028,
                                  fontWeight: FontWeight.w700,
                                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                ),
                              ),
                              Text(
                                'मोती नगर',
                                style: TextStyle(
                                  fontSize: width * 0.024,
                                  color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Services Section
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Text(
                    'Services',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.01),

                // Services Grid
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: width * 0.02,
                      mainAxisSpacing: height * 0.01,
                      childAspectRatio: 1.1,
                    ),
                    itemCount: services.length,
                    itemBuilder: (context, index) {
                      final service = services[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SOSDetailScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: height * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                service['icon'],
                                width: width * 0.08,
                                height: width * 0.08,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: height * 0.005),
                              Text(
                                service['name'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: width * 0.025,
                                  fontWeight: FontWeight.w500,
                                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.01),

                // Pagination dots (decorative, matches reference design)
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (index) {
                      final bool isActive = index == 0;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                        width: width * 0.02,
                        height: width * 0.02,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? AppColor.primary
                              : (isDarkMode
                              ? Colors.white.withOpacity(0.2)
                              : Colors.grey.shade300),
                        ),
                      );
                    }),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Smart Mobility Banner
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF1B3A7A),
                        const Color(0xFF3E6FD9),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SMART MOBILITY',
                              style: TextStyle(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w800,
                                fontStyle: FontStyle.italic,
                                color: Colors.white,
                                height: 1.1,
                              ),
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              'CONTROL YOUR CAR ANYTIME, ANYWHERE',
                              style: TextStyle(
                                fontSize: width * 0.025,
                                color: Colors.white.withOpacity(0.85),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.smartphone_rounded,
                        color: Colors.white.withOpacity(0.85),
                        size: width * 0.1,
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
    );
  }

  Widget _buildMapChip(
      String label,
      IconData icon,
      Color color,
      bool isDarkMode,
      double width,
      ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: width * 0.012,
      ),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDarkMode ? Colors.white.withOpacity(0.2) : Colors.grey.shade300,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width * 0.05,
            height: width * 0.05,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: width * 0.03),
          ),
          SizedBox(width: width * 0.015),
          Text(
            label,
            style: TextStyle(
              fontSize: width * 0.026,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}