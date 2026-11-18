import 'package:fixotto/Utils/AppColor.dart';
import 'package:flutter/material.dart';

class SelectSlotContent extends StatefulWidget {
  final VoidCallback? onNext;

  const SelectSlotContent({super.key, this.onNext});

  @override
  State<SelectSlotContent> createState() => _SelectSlotContentState();
}

class _SelectSlotContentState extends State<SelectSlotContent> {
  String _selectedDate = 'Sun 20';
  String _selectedTime = '10:00';

  final List<Map<String, String>> _dates = [
    {'day': 'Sun', 'date': '20'},
    {'day': 'Mon', 'date': '21'},
    {'day': 'Tue', 'date': '22'},
    {'day': 'Wed', 'date': '23'},
    {'day': 'Thu', 'date': '24'},
    {'day': 'Fri', 'date': '25'},
    {'day': 'Sat', 'date': '26'},
  ];
  final List<String> _times = ['10:00', '11:00', '12:00', '01:00', '02:00'];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double width = size.width;
    final double height = size.height;
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Heading - Centered
        Center(
          child: Text(
            'Checkout',
            style: TextStyle(
              fontSize: width * 0.055,
              fontWeight: FontWeight.w700,
              color: isDarkMode ? AppColor.textPrimary : Colors.black87,
            ),
          ),
        ),

        SizedBox(height: height * 0.02),

        // Subtitle - Darker
        Text(
          'Choose your preferred date and time for this booking.',
          style: TextStyle(
            fontSize: width * 0.035,
            fontWeight: FontWeight.w500,
            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
          ),
        ),
        SizedBox(height: height * 0.025),

        Text(
          'Select Date',
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
          ),
        ),
        SizedBox(height: height * 0.01),

        SizedBox(
          height: height * 0.08,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _dates.length,
            itemBuilder: (context, index) {
              final date = _dates[index];
              final isSelected = _selectedDate == '${date['day']} ${date['date']}';
              final fullDate = '${date['day']} ${date['date']}';
              return GestureDetector(
                onTap: () => setState(() => _selectedDate = fullDate),
                child: Container(
                  width: width * 0.12,
                  margin: EdgeInsets.only(right: width * 0.02),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.green : (isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade100),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? Colors.green : (isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        date['day']!,
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: isSelected ? Colors.white : (isDarkMode ? AppColor.textSecondary : Colors.grey.shade600),
                        ),
                      ),
                      Text(
                        date['date']!,
                        style: TextStyle(
                          fontSize: width * 0.035,
                          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: isSelected ? Colors.white : (isDarkMode ? AppColor.textPrimary : Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        SizedBox(height: height * 0.025),

        Text(
          'Select Time',
          style: TextStyle(
            fontSize: width * 0.04,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? AppColor.textPrimary : Colors.black87,
          ),
        ),
        SizedBox(height: height * 0.01),

        Wrap(
          spacing: width * 0.03,
          runSpacing: height * 0.01,
          children: _times.map((time) {
            final isSelected = _selectedTime == time;
            return GestureDetector(
              onTap: () => setState(() => _selectedTime = time),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.05,
                  vertical: height * 0.012,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.green : (isDarkMode ? Colors.white.withOpacity(0.06) : Colors.grey.shade100),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: isSelected ? Colors.green : (isDarkMode ? Colors.white.withOpacity(0.08) : Colors.grey.shade200),
                    width: 1,
                  ),
                ),
                child: Text(
                  time,
                  style: TextStyle(
                    fontSize: width * 0.032,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? Colors.white : (isDarkMode ? AppColor.textPrimary : Colors.black87),
                  ),
                ),
              ),
            );
          }).toList(),
        ),

        const Spacer(),

        SizedBox(
          width: double.infinity,
          height: height * 0.06,
          child: ElevatedButton(
            onPressed: widget.onNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text(
              'Checkout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(height: height * 0.02),
      ],
    );
  }
}