import 'package:flutter/material.dart';
import 'package:iaems_app/colors.dart';

class TimelineDropDown extends StatelessWidget {
  const TimelineDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.darkBlue,
          borderRadius: BorderRadius.circular(15.0)
        ),
        child: const ExpansionTile(
          title: Text(
            "Timeline",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          iconColor: Colors.white,
          collapsedIconColor: Colors.white,
          initiallyExpanded: false,
          children: [
            SizedBox(
              height: 260,
              child: TimelineWidget(),
            ),
          ],
        ),
      ),
    );
  }
}


class TimelineWidget extends StatefulWidget {
  const TimelineWidget({super.key});

  @override
  _TimelineWidgetState createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  List<String> courses = [
    'Math 101',
    'Physics 101',
    'Chemistry 101',
    'Biology 101',
    'History 101',
  ];

  List<String> time = [
    '08:30 - 11:00',
    '11:00 - 01:30',
    '01:30 - 04:00',
  ];

  List<String> days = [
    'Day 1',
    'Day 2',
    'Day 3',
    'Day 4',
    'Day 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.LightBlue,
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,  
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              children: List.generate(6, (colIndex){
                return Column(
                  children:  List.generate(4, (rowIndex) {
                    if (colIndex == 0 && rowIndex == 0){
                      return Container(
                        width: 55.0,
                        height: 55.0,
                        padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(
                        border: Border(
                         top: BorderSide(color: AppColors.darkBlue, width: 2.0),
                         left: BorderSide(color: AppColors.darkBlue, width: 2.0),
                         ),
                         borderRadius: BorderRadius.only( topLeft: Radius.circular(30.0),)
                        ),
                       );
                    }
                    if (rowIndex == 0 && colIndex > 0) {
                      return Container(
                        width: 55.0,
                        height: 55.0,
                        padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: AppColors.darkBlue, width: 2.0),
                            bottom: BorderSide(color: AppColors.darkBlue, width: 2.0),
                            top: BorderSide(color: AppColors.darkBlue, width: 2.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            days[colIndex - 1],
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black
                            )
                          ),
                        ),
                      );
                    }
                    if (colIndex == 0 && rowIndex > 0) {
                      return Container(
                        width: 55.0,
                        height: 55.5,
                        padding: const EdgeInsets.all(5.0),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: AppColors.darkBlue, width: 2.0),
                            bottom: BorderSide(color: AppColors.darkBlue, width: 2.0),
                            left: BorderSide(color: AppColors.darkBlue, width: 2.0),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            time[rowIndex - 1],
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox(
                      width: 55.0,
                      height: 55.0,
                    );
                  }) ,
                );
              }
            ),
          ),

        )
      ),
    )
    );
  }
}
