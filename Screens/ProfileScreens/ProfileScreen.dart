import 'package:fixotto/Screens/SetUpScreens/MainWrapper.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/ProfileScreens/EditProfileScreen.dart';
import 'package:fixotto/Screens/ProfileScreens/AddressScreen.dart';
import 'package:fixotto/Screens/ProfileScreens/ReviewsScreen.dart';
import 'package:fixotto/Screens/ProfileScreens/OrdersScreen.dart';
import 'package:fixotto/Screens/ProfileScreens/TermsConditionScreen.dart';
import 'package:fixotto/Screens/ProfileScreens/PrivacyPolicyScreen.dart';
import 'package:fixotto/Screens/ProfileScreens/FavoriteScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isChatbotEnabled = false;

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

  void _navigateToHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const MainWrapper(initialIndex: 0),
      ),
      (route) => false,
    );
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
        if (!didPop) _navigateToHome();
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
                padding: EdgeInsets.fromLTRB(
                  width * 0.06,
                  height * 0.04,
                  width * 0.06,
                  height * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rohit sharma',
                          style: TextStyle(
                            fontSize: width * 0.06,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode ? AppColor.textPrimary : const Color(0xFF1A1A1A),
                          ),
                        ),
                        SizedBox(height: height * 0.006),
                        Text(
                          'rohitsharma12@gmail.com',
                          style: TextStyle(
                            fontSize: width * 0.037,
                            color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.032),

                    _buildMenuItem(Icons.person_outline_rounded, 'Personal Information', 'Incomplete', isDarkMode, width, height,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen())),
                      showDivider: true,
                    ),
                    _buildMenuItem(Icons.location_on_outlined, 'Address', null, isDarkMode, width, height,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddressScreen())),
                      showDivider: true,
                    ),
                    _buildMenuItem(Icons.star_outline_rounded, 'Reviews', null, isDarkMode, width, height,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReviewsScreen())),
                      showDivider: true,
                    ),
                    _buildMenuItem(Icons.description_outlined, 'Terms & Condition', null, isDarkMode, width, height,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TermsConditionScreen())),
                      showDivider: true,
                    ),
                    _buildMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy', null, isDarkMode, width, height,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen())),
                      showDivider: true,
                    ),
                    _buildMenuItemWithToggle(Icons.chat_outlined, 'AI Chatbot', isDarkMode, width, height,
                      value: _isChatbotEnabled,
                      onChanged: (val) => setState(() => _isChatbotEnabled = val),
                      showDivider: false,
                    ),

                    SizedBox(height: height * 0.022),

                    Divider(
                      color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.1),
                      thickness: 1.2,
                    ),

                    SizedBox(height: height * 0.022),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildQuickActionBox(ImageAssets.orderImage, 'My Orders', isDarkMode, width, height,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const OrdersScreen())),
                        ),
                        _buildQuickActionBox(ImageAssets.favoriteIcon, 'Favourite', isDarkMode, width, height,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoriteScreen())),
                        ),
                        _buildQuickActionBox(ImageAssets.helpSupport, 'Help & support', isDarkMode, width, height,
                          onTap: () {},
                        ),
                      ],
                    ),

                    SizedBox(height: height * 0.028),

                    Divider(
                      color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.1),
                      thickness: 1.2,
                    ),

                    SizedBox(height: height * 0.018),

                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Icon(Icons.logout_rounded, color: Colors.red, size: width * 0.055),
                          SizedBox(width: width * 0.04),
                          Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: width * 0.042,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: height * 0.018),

                    Center(
                      child: Text(
                        'v3.1.1.0',
                        style: TextStyle(
                          fontSize: width * 0.032,
                          color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
                        ),
                      ),
                    ),

                    SizedBox(height: height * 0.022),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    String? subtitle,
    bool isDarkMode,
    double width,
    double height, {
    VoidCallback? onTap,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.013),
            child: Row(
              children: [
                Icon(icon, color: AppColor.primary, size: width * 0.055),
                SizedBox(width: width * 0.04),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: width * 0.042,
                      fontWeight: FontWeight.w500,
                      color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                    ),
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: width * 0.037,
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                Icon(Icons.arrow_forward_ios_rounded, size: width * 0.042, color: AppColor.primary),
              ],
            ),
          ),
        ),
        if (showDivider)
          Divider(
            color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.1),
            thickness: 0.5,
            height: 0,
          ),
      ],
    );
  }

  Widget _buildMenuItemWithToggle(
    IconData icon,
    String title,
    bool isDarkMode,
    double width,
    double height, {
    required bool value,
    required ValueChanged<bool> onChanged,
    bool showDivider = true,
  }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.013),
          child: Row(
            children: [
              Icon(icon, color: AppColor.primary, size: width * 0.055),
              SizedBox(width: width * 0.04),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: width * 0.042,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                ),
              ),
              Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: value,
                  onChanged: onChanged,
                  activeColor: AppColor.primary,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey.shade300,
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.1),
            thickness: 0.5,
            height: 0,
          ),
      ],
    );
  }

  Widget _buildQuickActionBox(
    String icon,
    String title,
    bool isDarkMode,
    double width,
    double height, {
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width * 0.26,
        padding: EdgeInsets.symmetric(vertical: height * 0.022),
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.white.withOpacity(0.06) : Colors.white,
          borderRadius: BorderRadius.circular(13),
          border: Border.all(
            color: isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 7,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, width: width * 0.075, height: width * 0.075, fit: BoxFit.contain),
            SizedBox(height: height * 0.008),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: width * 0.032,
                fontWeight: FontWeight.w500,
                color: isDarkMode ? AppColor.textPrimary : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
