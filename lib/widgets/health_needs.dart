import 'package:flutter/material.dart';
import 'package:lutter_health_app_ui_design/models/needed_category.dart';
import 'package:lutter_health_app_ui_design/utils/colors.dart';

class HealthNeeds extends StatelessWidget {
  const HealthNeeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(customIcons.length, (index) {
        return Column(
          children: [
            InkWell(
              onTap: () {
                if (customIcons.length - 1 == index) {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.white,
                      showDragHandle: true,
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Health Needs",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                  const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List.generate(healthNeeds.length,
                                        (index) {
                                  return Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: secondaryBgColor),
                                        child: Image.asset(
                                            healthNeeds[index].icon),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(healthNeeds[index].name),
                                    

                                    ],
                                  );
                                })
                                ),
                                const SizedBox(height: 30),
                                  Text(
                                  "Specialised Cared",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                                  const SizedBox(height: 15),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: List.generate(specialisedCared.length, (index){
                                return Column(
                                    children: [
                                      Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: secondaryBgColor), 
                                        child: Image.asset(
                                            specialisedCared[index].icon),
                                      ),
                                      const SizedBox(height: 12),
                                      Text(specialisedCared[index].name),
                                    

                                    ],
                                  );
                                })
                              )
                              ],
                            ),
                          ),
                        );
                      });
                }
              },
              borderRadius: BorderRadius.circular(190),
              child: Container(
                width: 80,
                height: 80,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: secondaryBgColor,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(customIcons[index].icon),
              ),
            ),
            const SizedBox(height: 12),
            Text(customIcons[index].name),
          ],
        );
      }),
    );
  }
}
