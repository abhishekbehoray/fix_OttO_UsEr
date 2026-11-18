import 'package:fixotto/Screens/SelectVehicleScreens/SelectVehicleScreen.dart';
import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with TickerProviderStateMixin {
  late AnimationController _locationController;
  late AnimationController _shakeController;
  late Animation<double> _locationAnim;
  late Animation<double> _shakeAnim;

  @override
  void initState() {
    super.initState();

    _locationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _locationAnim = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(parent: _locationController, curve: Curves.easeInOut),
    );

    _shakeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _shakeAnim = Tween<double>(begin: 0, end: 1).animate(_shakeController);

    _scheduleShake();
  }

  void _scheduleShake() {
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _shakeController.forward(from: 0).then((_) {
          Future.delayed(const Duration(seconds: 4), () {
            if (mounted) _scheduleShake();
          });
        });
      }
    });
  }

  @override
  void dispose() {
    _locationController.dispose();
    _shakeController.dispose();
    super.dispose();
  }

  void _navigateToVehicleScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SelectVehicleScreen(),
      ),
    );
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
          gradient: isDarkMode
              ? AppColor.getOnboardingGradient(brightness)
              : null,
          color: isDarkMode ? null : Colors.white,
        ),
        child: SafeArea(
          top: true,
          bottom: true,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.06,
              vertical: height * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Skip Button (Top Right)
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: _navigateToVehicleScreen,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.06,
                        vertical: height * 0.015,
                      ),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Colors.white.withOpacity(0.08)
                            : Colors.black.withOpacity(0.06),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDarkMode
                              ? Colors.white.withOpacity(0.12)
                              : Colors.black.withOpacity(0.08),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? AppColor.textSecondary
                              : Colors.black45,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Title
                Text(
                  'Allow your location',
                  style: TextStyle(
                    fontSize: width * 0.07,
                    fontWeight: FontWeight.w700,
                    color: isDarkMode
                        ? AppColor.textPrimary
                        : const Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: height * 0.01),
                Text(
                  'We will need your location to give you\na better experience',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: isDarkMode
                        ? AppColor.textSecondary
                        : Colors.black45,
                    height: 1.5,
                  ),
                ),

                SizedBox(height: height * 0.04),

                // Animated Scene
                Expanded(
                  flex: 3,
                  child: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final double locationSize = constraints.maxWidth * 0.55;
                        final double buildingSize = constraints.maxWidth * 0.75;
                        final double personSize = locationSize * 0.8;
                        final double sceneHeight = buildingSize * 1.1;
                        final double travelRange = constraints.maxWidth * 0.25;

                        return SizedBox(
                          width: constraints.maxWidth,
                          height: sceneHeight,
                          child: Stack(
                            children: [
                              // Building - vibrates, centered bottom
                              Positioned(
                                bottom: 0,
                                left: (constraints.maxWidth - buildingSize) / 2,
                                child: AnimatedBuilder(
                                  animation: _shakeAnim,
                                  builder: (_, child) {
                                    final t = _shakeAnim.value;
                                    final shake = t * (1 - t) * 4 * 10 * (t < 0.5 ? 1 : -1);
                                    return Transform.translate(
                                      offset: Offset(shake, 0),
                                      child: child,
                                    );
                                  },
                                  child: Image.asset(
                                    ImageAssets.building,
                                    width: buildingSize,
                                    height: buildingSize,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),

                              // Location icon - moves left to right, bottom-aligned
                              AnimatedBuilder(
                                animation: _locationAnim,
                                builder: (_, child) => Positioned(
                                  bottom: 0,
                                  left: (constraints.maxWidth - locationSize) / 2 +
                                      _locationAnim.value * travelRange,
                                  child: child!,
                                ),
                                child: Image.asset(
                                  ImageAssets.locationIcon,
                                  width: locationSize,
                                  height: locationSize,
                                  fit: BoxFit.contain,
                                ),
                              ),

                              // Person - stable, bottom-aligned (same baseline)
                              Positioned(
                                bottom: 0,
                                left: (constraints.maxWidth - personSize) / 2,
                                child: Image.asset(
                                  ImageAssets.person,
                                  width: personSize,
                                  height: personSize,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Address Section
                Container(
                  padding: EdgeInsets.all(width * 0.04),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? Colors.white.withOpacity(0.08)
                        : Colors.black.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDarkMode
                          ? Colors.white.withOpacity(0.08)
                          : Colors.black.withOpacity(0.06),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'J-118, 1/2 3street No.-7, Moti Nagar, Roop Nagar',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? AppColor.textPrimary
                              : Colors.black87,
                        ),
                      ),
                      Text(
                        'Delhi - 10065',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: FontWeight.w500,
                          color: isDarkMode
                              ? AppColor.textPrimary
                              : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Buttons
                Column(
                  children: [
                    // Use Current Location Button
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.06,
                      child: ElevatedButton(
                        onPressed: _navigateToVehicleScreen,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Use Current location',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    // Choose Location Button
                    SizedBox(
                      width: double.infinity,
                      height: height * 0.06,
                      child: OutlinedButton(
                        onPressed: () {
                          // Handle choose location - also navigate to vehicle screen
                          _navigateToVehicleScreen();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: AppColor.primary,
                            width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Choose location',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
