import 'package:fixotto/Utils/AppColor.dart';
import 'package:fixotto/Utils/ImageAssets.dart';
import 'package:fixotto/Screens/ProfileScreens/OrderDetailScreen.dart';
import 'package:fixotto/Screens/ProfileScreens/LocationScreenMap.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String _selectedTab = 'In progress';

  final List<String> _tabs = ['In progress', 'Completed', 'Rejected'];

  final List<Map<String, dynamic>> _orders = [
    {
      'id': '#1202012',
      'service': 'Car Service',
      'type': 'Basic Service',
      'status': 'In progress',
      'price': '₹ 2000',
      'date': 'Order on 11 Nov, 2025',
      'image': ImageAssets.carService,
    },
    {
      'id': '#1202013',
      'service': 'Car Service',
      'type': 'Premium Service',
      'status': 'In progress',
      'price': '₹ 3500',
      'date': 'Order on 12 Nov, 2025',
      'image': ImageAssets.carService,
    },
    {
      'id': '#1202014',
      'service': 'Car Service',
      'type': 'Basic Service',
      'status': 'Completed',
      'price': '₹ 2000',
      'date': 'Order on 10 Nov, 2025',
      'image': ImageAssets.carService,
    },
    {
      'id': '#1202015',
      'service': 'Car Service',
      'type': 'Basic Service',
      'status': 'Completed',
      'price': '₹ 2000',
      'date': 'Order on 09 Nov, 2025',
      'image': ImageAssets.carService,
    },
    {
      'id': '#1202016',
      'service': 'Car Service',
      'type': 'Basic Service',
      'status': 'Rejected',
      'price': '₹ 2000',
      'date': 'Order on 08 Nov, 2025',
      'image': ImageAssets.carService,
    },
  ];

  List<Map<String, dynamic>> get _filteredOrders {
    return _orders.where((order) => order['status'] == _selectedTab).toList();
  }

  void _showOrderPopup(Map<String, dynamic> order) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Center(
        child: Material(
          color: Colors.transparent,
          child: OrderPopup(
          order: order,
          onConfirm: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LocationScreenMap()),
            );
          },
          onNotConfirm: () {
            Navigator.pop(context);
          },
        ),
        ),
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
                      'Orders',
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
                Row(
                  children: _tabs.map((tab) {
                    final isSelected = _selectedTab == tab;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedTab = tab),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                          vertical: height * 0.01,
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
                    );
                  }).toList(),
                ),

                SizedBox(height: height * 0.02),

                // All Orders
                Text(
                  'All Orders',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                  ),
                ),

                SizedBox(height: height * 0.015),

                // Orders List
                Expanded(
                  child: _filteredOrders.isEmpty
                      ? Center(
                    child: Text(
                      'No orders found',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade500,
                      ),
                    ),
                  )
                      : ListView.builder(
                    itemCount: _filteredOrders.length,
                    itemBuilder: (context, index) {
                      final order = _filteredOrders[index];
                      return GestureDetector(
                        onTap: () {
                          if (order['status'] == 'In progress') {
                            _showOrderPopup(order);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OrderDetailScreen(),
                              ),
                            );
                          }
                        },
                        child: _buildOrderCard(
                          order,
                          isDarkMode,
                          width,
                          height,
                        ),
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

  Widget _buildOrderCard(
      Map<String, dynamic> order,
      bool isDarkMode,
      double width,
      double height,
      ) {
    final Color statusColor = order['status'] == 'In progress'
        ? Colors.orange
        : order['status'] == 'Completed'
        ? AppColor.primary
        : Colors.red;

    return Container(
      padding: EdgeInsets.all(width * 0.04),
      margin: EdgeInsets.only(bottom: height * 0.015),
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
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          // Car Service Image
          Container(
            width: width * 0.15,
            height: width * 0.15,
            decoration: BoxDecoration(
              color: AppColor.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              order['image'],
              width: width * 0.1,
              height: width * 0.1,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: width * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order['id'],
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03,
                        vertical: height * 0.005,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        order['status'],
                        style: TextStyle(
                          fontSize: width * 0.028,
                          fontWeight: FontWeight.w500,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.003),
                Text(
                  order['service'],
                  style: TextStyle(
                    fontSize: width * 0.035,
                    color: isDarkMode ? AppColor.textSecondary : Colors.grey.shade600,
                  ),
                ),
                Text(
                  order['type'],
                  style: TextStyle(
                    fontSize: width * 0.032,
                    color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
                  ),
                ),
                SizedBox(height: height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order['date'],
                      style: TextStyle(
                        fontSize: width * 0.03,
                        color: isDarkMode ? AppColor.textTertiary : Colors.grey.shade500,
                      ),
                    ),
                    Text(
                      order['price'],
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w700,
                        color: AppColor.primary,
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
}

// Order Popup - Centered with normal text (no underline)
class OrderPopup extends StatelessWidget {
  final Map<String, dynamic> order;
  final VoidCallback onConfirm;
  final VoidCallback onNotConfirm;

  const OrderPopup({
    super.key,
    required this.order,
    required this.onConfirm,
    required this.onNotConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return Container(
      width: width * 0.85,
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xFF1A1A2E) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.all(width * 0.06),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Price Details - Normal text
          Text(
            'Price details',
            style: TextStyle(
              fontSize: width * 0.045,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
          SizedBox(height: height * 0.015),

          _buildPriceRow('Price (2 item)', '₹14,400', isDarkMode, width),
          _buildPriceRow('Discount', '₹2,300', isDarkMode, width),
          _buildPriceRow('Delivery Charges', 'Free', isDarkMode, width),

          Divider(
            color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade300,
            thickness: 1,
          ),

          _buildPriceRow('Total', '₹12,100', isDarkMode, width, isBold: true),

          SizedBox(height: height * 0.02),

          SizedBox(height: height * 0.01),

          Column(
            children: [
              GestureDetector(
                onTap: onConfirm,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Confirm',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.012),
              GestureDetector(
                onTap: onNotConfirm,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  decoration: BoxDecoration(
                    color: isDarkMode ? Colors.white.withOpacity(0.1) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'Not Confirm',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: isDarkMode ? AppColor.textPrimary : Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: height * 0.02),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, bool isDarkMode, double width, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.01),
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
