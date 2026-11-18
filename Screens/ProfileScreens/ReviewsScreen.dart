import 'package:fixotto/Utils/AppColor.dart';
import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({super.key});

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
                      'Reviews',
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: height * 0.025),

                Text(
                  'All Reviews',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                ),

                SizedBox(height: height * 0.02),

                // Review List
                Expanded(
                  child: ListView(
                    children: [
                      _buildReviewCard(
                        'Suraj Patel',
                        '+91 8047387302',
                        '12-09-25',
                        'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged',
                        isDarkMode,
                        width,
                        height,
                      ),
                      SizedBox(height: height * 0.02),
                      _buildReviewCard(
                        'Rahul Kumar',
                        '+91 8047387302',
                        '12-09-25',
                        'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,',
                        isDarkMode,
                        width,
                        height,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReviewCard(
      String name,
      String phone,
      String date,
      String review,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: width * 0.12,
                height: width * 0.12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFF0E97A7).withOpacity(0.1),
                ),
                child: Center(
                  child: Text(
                    name[0],
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0E97A7),
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
                      name,
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                        fontSize: width * 0.032,
                        color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: width * 0.03,
                  color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
            children: List.generate(5, (index) => Icon(
              Icons.star_rounded,
              color: Colors.amber,
              size: width * 0.04,
            )),
          ),
          Text(
            '4 Rating',
            style: TextStyle(
              fontSize: width * 0.03,
              color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(
            review,
            style: TextStyle(
              fontSize: width * 0.035,
              height: 1.5,
              color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}