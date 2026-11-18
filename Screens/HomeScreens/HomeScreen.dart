import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/HomeScreens/CarServiceScreen.dart';
import 'package:fixotto/Screens/HomeScreens/DocumentListScreen.dart';
import 'package:fixotto/Screens/HomeScreens/NotificationScreen.dart';
import 'package:fixotto/Screens/HomeScreens/OdometerScreen.dart';
import 'package:fixotto/Screens/HomeScreens/SOSScreen.dart';
import 'package:fixotto/Screens/StoreScreens/AllProductsScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPickupDropSelected = false;

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

  // Services for Location Service
  final List<Map<String, dynamic>> _locationServices = [
    {'name': 'Car Service', 'icon': ImageAssets.homeLogoOne, 'route': 'car_service'},
    {'name': 'Suspension & Alignment', 'icon': ImageAssets.homeLogoTwo, 'route': 'car_service'},
    {'name': 'AC Service & Repair', 'icon': ImageAssets.homeLogoThree, 'route': 'car_service'},
    {'name': 'Car Spa & Cleaning', 'icon': ImageAssets.homeLogoFour, 'route': 'car_service'},
  ];

  // Services for Pick-up & Drop
  final List<Map<String, dynamic>> _pickupDropServices = [
    {'name': 'Denting &\nPainting', 'icon': ImageAssets.homeOne, 'route': 'car_service'},
    {'name': 'Major AC\nRepair', 'icon': ImageAssets.homeTwo, 'route': 'car_service'},
    {'name': 'Detailing\nService', 'icon': ImageAssets.homeThree, 'route': 'car_service'},
    {'name': 'Car Insurance\n& Claim', 'icon': ImageAssets.homeFour, 'route': 'car_service'},
  ];

  // Other services for Location Service
  final List<Map<String, dynamic>> _locationOtherServices = [
    {'name': 'Break\nReplacement', 'icon': ImageAssets.homeLogoFive, 'route': 'all_products'},
    {'name': 'Battery\nReplacement', 'icon': ImageAssets.homeLogoSix, 'route': 'all_products'},
    {'name': 'Car\nInspection', 'icon': ImageAssets.homeLogoSeven, 'route': 'all_products'},
    {'name': 'PUC & Electrical\nCharge', 'icon': ImageAssets.homeLogoEight, 'route': 'all_products'},
  ];

  // Other services for Pick-up & Drop
  final List<Map<String, dynamic>> _pickupDropOtherServices = [
    {'name': 'Tyre & Wheel\nServices', 'icon': ImageAssets.homeFive, 'route': 'all_products'},
    {'name': 'Clutch & Body\nParts', 'icon': ImageAssets.homeSix, 'route': 'all_products'},
    {'name': 'Suspension &\nFitment', 'icon': ImageAssets.homeSeven, 'route': 'all_products'},
    {'name': 'Wind Shield &\nLight Replacement', 'icon': ImageAssets.homeEight, 'route': 'all_products'},
  ];

  final List<Map<String, dynamic>> actions = [
    {'name': 'Insurance &\nPollution', 'icon': ImageAssets.homeLogoNine, 'route': 'document_list'},
    {'name': 'Odometer', 'icon': ImageAssets.homeLogoTen, 'route': 'odometer'},
  ];

  final List<Map<String, dynamic>> guarantees = [
    {
      'name': 'Free Pickup Drop',
      'icon': ImageAssets.homeLogoEleven,
      'color': const Color(0xFFE4E7FB),
    },
    {
      'name': 'Genuine Parts',
      'icon': ImageAssets.homeLogoTweleve,
      'color': const Color(0xFFDFF3E3),
    },
    {
      'name': '30 Days Warranty',
      'icon': ImageAssets.homeLogoThirteen,
      'color': const Color(0xFFF1E3F8),
    },
  ];

  void _handleServiceTap(String? route) {
    if (route == 'car_service') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const CarServiceScreen()));
    } else if (route == 'all_products') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const AllProductsScreen()));
    } else if (route == 'document_list') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const DocumentListScreen()));
    } else if (route == 'odometer') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const OdometerScreen()));
    }
  }

  List<Map<String, dynamic>> get _currentServices =>
      _isPickupDropSelected ? _pickupDropServices : _locationServices;

  List<Map<String, dynamic>> get _currentOtherServices =>
      _isPickupDropSelected ? _pickupDropOtherServices : _locationOtherServices;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? null : Colors.white,
      body: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: isDarkMode ? AppColor.getOnboardingGradient(brightness) : null,
          color: isDarkMode ? null : Colors.white,
        ),
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------- Header / Banner ----------------
                Container(
                  width: double.infinity,
                  height: height * 0.38,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF17A94F), Color(0xFF0B8A3F)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28),
                      bottomRight: Radius.circular(28),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          ImageAssets.homeBannerOne,
                          width: width * 0.80,
                          height: height * 0.50,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          width * 0.06,
                          height * 0.015,
                          width * 0.06,
                          height * 0.05,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Location + SOS + Notification
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Location',
                                            style: TextStyle(
                                              fontSize: width * 0.033,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Icon(Icons.keyboard_arrow_down_rounded,
                                              color: Colors.white, size: width * 0.045),
                                        ],
                                      ),
                                      SizedBox(height: height * 0.003),
                                      Row(
                                        children: [
                                          Icon(Icons.location_on, color: Colors.white, size: width * 0.04),
                                          SizedBox(width: width * 0.01),
                                          Expanded(
                                            child: Text(
                                              'Moti Nagar Rd, DLE Industrial...',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: width * 0.037,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: width * 0.03),
                                Container(
                                  width: width * 0.13,
                                  height: width * 0.13,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: GestureDetector(
                                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SOSScreen())),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.campaign_rounded, color: Colors.red, size: width * 0.05),
                                        Text(
                                          'SOS',
                                          style: TextStyle(
                                            fontSize: width * 0.022,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: width * 0.025),
                                GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationScreen())),
                                  child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: width * 0.13,
                                      height: width * 0.13,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.notifications_none_rounded,
                                          color: const Color(0xFF1E2A38), size: width * 0.06),
                                    ),
                                    Positioned(
                                      top: -2,
                                      right: -2,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: const BoxDecoration(
                                          color: Colors.redAccent,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          '2',
                                          style: TextStyle(
                                            fontSize: width * 0.024,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                ),
                              ],
                            ),

                            SizedBox(height: height * 0.02),

                            // Search bar
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: height * 0.055,
                                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.search, color: Colors.grey.shade500, size: width * 0.05),
                                        SizedBox(width: width * 0.02),
                                        Text(
                                          'Search...',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: width * 0.037,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: width * 0.025),
                                Container(
                                  width: height * 0.055,
                                  height: height * 0.055,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E2A38),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Icon(Icons.tune_rounded, color: Colors.white, size: width * 0.05),
                                ),
                              ],
                            ),

                            SizedBox(height: height * 0.025),

                            // Banner text
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CAR SERVICE',
                                  style: TextStyle(
                                    fontSize: width * 0.065,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                    height: 1.15,
                                  ),
                                ),
                                Text(
                                  'AT YOUR\nDOORSTEP',
                                  style: TextStyle(
                                    fontSize: width * 0.065,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                    height: 1.15,
                                  ),
                                ),
                                SizedBox(height: height * 0.01),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04,
                                    vertical: height * 0.006,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.local_shipping_rounded,
                                        color: Colors.white,
                                        size: width * 0.04,
                                      ),
                                      SizedBox(width: width * 0.02),
                                      Text(
                                        'Free Pickup Drop',
                                        style: TextStyle(
                                          fontSize: width * 0.035,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ---------------- Overlapping tab pill ----------------
                Transform.translate(
                  offset: Offset(0, -height * 0.028),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                    padding: EdgeInsets.symmetric(vertical: height * 0.008),
                    decoration: BoxDecoration(
                      color: isDarkMode ? const Color(0xFF171F2A) : Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Location Service - Clickable
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPickupDropSelected = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.012,
                              ),
                              decoration: BoxDecoration(
                                color: !_isPickupDropSelected
                                    ? AppColor.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: !_isPickupDropSelected
                                        ? Colors.white
                                        : AppColor.primary,
                                    size: width * 0.045,
                                  ),
                                  SizedBox(width: width * 0.015),
                                  Text(
                                    'Location Service',
                                    style: TextStyle(
                                      fontSize: width * 0.034,
                                      fontWeight: FontWeight.w600,
                                      color: !_isPickupDropSelected
                                          ? Colors.white
                                          : isDarkMode
                                          ? AppColor.textPrimary
                                          : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Pick-up & Drop - Clickable
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isPickupDropSelected = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: height * 0.012,
                              ),
                              decoration: BoxDecoration(
                                color: _isPickupDropSelected
                                    ? AppColor.primary
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.local_shipping_rounded,
                                    color: _isPickupDropSelected
                                        ? Colors.white
                                        : AppColor.primary,
                                    size: width * 0.045,
                                  ),
                                  SizedBox(width: width * 0.015),
                                  Text(
                                    'Pick-up & Drop',
                                    style: TextStyle(
                                      fontSize: width * 0.034,
                                      fontWeight: FontWeight.w600,
                                      color: _isPickupDropSelected
                                          ? Colors.white
                                          : isDarkMode
                                          ? AppColor.textPrimary
                                          : Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ---------------- Service We Offer ----------------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Service We Offer',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                      Text(
                        'Explore',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.015),

                // Service Grid - Changes based on selection
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: width * 0.035,
                      mainAxisSpacing: height * 0.018,
                      childAspectRatio: 1.35,
                    ),
                    itemCount: _currentServices.length,
                    itemBuilder: (context, index) {
                      final service = _currentServices[index];
                      return _buildBigServiceCard(
                        service['icon'],
                        service['name'],
                        isDarkMode,
                        width,
                        height,
                        onTap: service['route'] != null ? () => _handleServiceTap(service['route']) : null,
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.025),

                // ---------------- Other services ----------------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Text(
                    'Other services',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.018),

                // Other Services - Changes based on selection
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    children: _currentOtherServices.map((service) {
                      return Expanded(
                        child: _buildIconOnlyItem(
                          service['icon'],
                          service['name'],
                          isDarkMode,
                          width,
                          onTap: service['route'] != null ? () => _handleServiceTap(service['route']) : null,
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: height * 0.025),

                // ---------------- Actions ----------------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Text(
                    'Actions',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    children: actions.map((action) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width * 0.015),
                          child: _buildBigServiceCard(
                            action['icon'],
                            action['name'],
                            isDarkMode,
                            width,
                            height,
                            onTap: action['route'] != null ? () => _handleServiceTap(action['route']) : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                SizedBox(height: height * 0.025),

                // ---------------- Fixotto Guarantee ----------------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Text(
                    'Fixotto Guarantee',
                    style: TextStyle(
                      fontSize: width * 0.045,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),

                SizedBox(
                  height: height * 0.1,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    itemCount: guarantees.length,
                    separatorBuilder: (_, __) => SizedBox(width: width * 0.03),
                    itemBuilder: (context, index) {
                      final g = guarantees[index];
                      return _buildGuaranteeCard(
                        g['icon'],
                        g['name'],
                        g['color'],
                        isDarkMode,
                        width,
                        height,
                      );
                    },
                  ),
                ),

                SizedBox(height: height * 0.025),

                // ---------------- Promo banners ----------------
                SizedBox(
                  height: height * 0.14,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    children: [
                      _buildPromoBanner(
                        width,
                        height,
                        'SMART\nMOBILITY',
                        'Control your car anytime, anywhere',
                        [const Color(0xFF1B3A7A), const Color(0xFF3E6FD9)],
                        Icons.smartphone_rounded,
                      ),
                      SizedBox(width: width * 0.03),
                      _buildPromoBanner(
                        width,
                        height,
                        'TOP\nROADSIDE ASSIST',
                        '24x7 support wherever you are',
                        [AppColor.primary, const Color(0xFF0B8A3F)],
                        Icons.support_agent_rounded,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.025),

                // ---------------- Testimonial ----------------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Testimonial',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.015),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.06),
                  padding: EdgeInsets.all(width * 0.045),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 10,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.13,
                            height: width * 0.13,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.primary.withOpacity(0.12),
                            ),
                            child: Center(
                              child: Text(
                                'S',
                                style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.primary,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Suraj Kumar',
                                  style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ...List.generate(
                                      4,
                                          (index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                        size: width * 0.04,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_border_rounded,
                                      color: Colors.amber,
                                      size: width * 0.04,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.format_quote_rounded, color: AppColor.primary.withOpacity(0.5), size: width * 0.08),
                        ],
                      ),
                      SizedBox(height: height * 0.012),
                      Text(
                        'Lorem ipsum dolor sit amet, contur adipg elit, sed do eiusmod tempor incididunt ut labore et ore magna aliqua Lorem ipsum dolor sit amet, contur adipiscing elit, sed do eiusmod tempor',
                        style: TextStyle(
                          fontSize: width * 0.032,
                          color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.012),
                Center(child: _buildDotIndicator(3, 0, width)),

                SizedBox(height: height * 0.025),

                // ---------------- Blogs ----------------
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Blogs',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w700,
                          color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.015),

                SizedBox(
                  height: height * 0.27,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                    children: [
                      _buildBlogCard(
                        width,
                        height,
                        'Locofy.ai – Turn Figma to Code!',
                        'Go from Figma to code in minimum amount of time using Locofy. Take your...',
                        isDarkMode,
                      ),
                      SizedBox(width: width * 0.04),
                      _buildBlogCard(
                        width,
                        height,
                        'Locofy.ai – Turn Figma to Code!',
                        'Go from Figma to code in minimum amount of time using Locofy. Take your...',
                        isDarkMode,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.012),
                Center(child: _buildDotIndicator(3, 0, width)),

                SizedBox(height: height * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- Reusable widgets ----------------

  Widget _buildBigServiceCard(String icon, String name, bool isDarkMode, double width, double height, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: EdgeInsets.symmetric(vertical: height * 0.012, horizontal: width * 0.02),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: width * 0.12,
            height: width * 0.12,
            fit: BoxFit.contain,
          ),
          SizedBox(height: height * 0.01),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.033,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
        ],
      ),
    ),
    );
  }

  Widget _buildIconOnlyItem(String icon, String name, bool isDarkMode, double width, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          icon,
          width: width * 0.11,
          height: width * 0.11,
          fit: BoxFit.contain,
        ),
        SizedBox(height: width * 0.015),
        Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: width * 0.028,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
          ),
        ),
      ],
    ),
    );
  }

  Widget _buildGuaranteeCard(String icon, String name, Color bgColor, bool isDarkMode, double width, double height) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03, vertical: height * 0.015),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            width: width * 0.07,
            height: width * 0.07,
            fit: BoxFit.contain,
          ),
          SizedBox(height: height * 0.005),
          Text(
            name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.028,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner(
      double width,
      double height,
      String title,
      String subtitle,
      List<Color> colors,
      IconData icon,
      ) {
    return Container(
      width: width * 0.72,
      padding: EdgeInsets.all(width * 0.045),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w800,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
                SizedBox(height: height * 0.008),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: width * 0.026,
                    color: Colors.white.withOpacity(0.85),
                  ),
                ),
              ],
            ),
          ),
          Icon(icon, color: Colors.white.withOpacity(0.85), size: width * 0.11),
        ],
      ),
    );
  }

  Widget _buildBlogCard(double width, double height, String title, String description, bool isDarkMode) {
    return Container(
      width: width * 0.65,
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
          Container(
            height: height * 0.13,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1E2A38),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: Icon(Icons.bolt_rounded, color: AppColor.primary, size: width * 0.09),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(width * 0.03),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                ),
                SizedBox(height: height * 0.005),
                Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: width * 0.028,
                    color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotIndicator(int count, int activeIndex, double width) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final bool active = index == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: width * 0.008),
          width: active ? width * 0.045 : width * 0.018,
          height: width * 0.018,
          decoration: BoxDecoration(
            color: active ? AppColor.primary : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      }),
    );
  }
}