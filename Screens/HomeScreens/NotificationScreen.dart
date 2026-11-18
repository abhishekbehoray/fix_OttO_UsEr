import 'package:fixotto/Utils/AppColor.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'New Notification',
        'description': 'Lorem Ipsum Lorem Ipsum Lorem Ipsum',
        'time': '3 Hours ago',
        'isRead': false,
      },
      {
        'title': 'New Notification',
        'description': 'Lorem Ipsum Lorem Ipsum Lorem Ipsum',
        'time': '3 Hours ago',
        'isRead': false,
      },
      {
        'title': 'New Notification',
        'description': 'Lorem Ipsum Lorem Ipsum Lorem Ipsum',
        'time': '3 Hours ago',
        'isRead': true,
      },
      {
        'title': 'New Notification',
        'description': 'Lorem Ipsum Lorem Ipsum Lorem Ipsum',
        'time': '3 Hours ago',
        'isRead': true,
      },
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
                    Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: width * 0.055,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('All notifications marked as read'),
                            backgroundColor: Colors.green,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      child: Text(
                        'Mark all as read',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w500,
                          color: AppColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.01),

              // Notification List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.06),
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return _buildNotificationCard(
                      context,
                      notification,
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
    );
  }

  Widget _buildNotificationCard(
      BuildContext context,
      Map<String, dynamic> notification,
      bool isDarkMode,
      double width,
      double height,
      ) {
    final bool isUnread = !notification['isRead'];

    return Container(
      margin: EdgeInsets.only(bottom: height * 0.015),
      padding: EdgeInsets.all(width * 0.04),
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.white.withOpacity(0.06)
            : (isUnread ? const Color(0xFFF0F8FF) : Colors.white),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDarkMode
              ? Colors.white.withOpacity(0.08)
              : (isUnread ? Colors.blue.withOpacity(0.2) : Colors.grey.shade200),
          width: isUnread ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Unread indicator
          if (isUnread)
            Container(
              width: width * 0.02,
              height: width * 0.02,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
          if (isUnread) SizedBox(width: width * 0.03),
          // Notification Icon
          Container(
            width: width * 0.1,
            height: width * 0.1,
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Colors.white.withOpacity(0.08)
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isUnread
                  ? Icons.notifications_active_rounded
                  : Icons.notifications_none_rounded,
              color: isUnread ? Colors.blue : Colors.grey.shade400,
              size: width * 0.05,
            ),
          ),
          SizedBox(width: width * 0.03),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['title'],
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                ),
                SizedBox(height: height * 0.003),
                Text(
                  notification['description'],
                  style: TextStyle(
                    fontSize: width * 0.032,
                    color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: height * 0.005),
                Text(
                  notification['time'],
                  style: TextStyle(
                    fontSize: width * 0.028,
                    color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
          // Delete/More button
          GestureDetector(
            onTap: () {
              _showBottomSheet(context, width, height, isDarkMode);
            },
            child: Icon(
              Icons.more_vert_rounded,
              color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade400,
              size: width * 0.05,
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, double width, double height, bool isDarkMode) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: height * 0.02),
            ListTile(
              leading: Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.blue,
                size: width * 0.055,
              ),
              title: Text(
                'Mark as read',
                style: TextStyle(
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Marked as read'),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_outline_rounded,
                color: Colors.red,
                size: width * 0.055,
              ),
              title: Text(
                'Delete',
                style: TextStyle(
                  fontSize: width * 0.035,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notification deleted'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
            SizedBox(height: height * 0.02),
          ],
        ),
      ),
    );
  }
}