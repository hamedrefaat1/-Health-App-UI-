// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lutter_health_app_ui_design/models/schedule_model.dart';
import 'package:lutter_health_app_ui_design/pages/health_app_main_page.dart';

import 'package:lutter_health_app_ui_design/utils/colors.dart';

class DoctorScheduleScreen extends StatefulWidget {
  const DoctorScheduleScreen({super.key});

  @override
  State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
}

class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
    String selectedOption = "Upcoming";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
                    children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black12
                                  ),
                                  color: Colors.white

                                ),
                                child: GestureDetector(
                                  onTap:(){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HealthAppMainPage()));
                                  },
                                  
                                  child: Icon(Icons.arrow_back , size: 25,)),
                              ),

                              Text("Schedule", style: TextStyle(fontSize: 22,  fontWeight: FontWeight.w600,
                      color: Colors.black,),),
                                SizedBox(width: 25,),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black12)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                    bulidOption("Upcoming"),
                                    bulidOption("Complete"),
                                    bulidOption("Result"),
                              ],
                            ),
                          ),
                              const SizedBox(height: 20),
              // dynamic content
              Expanded(
                child: buildContent(),
              )
                    ],
          ),
          ),
      ),
    );
  }
 Widget bulidOption(String option) {
  return GestureDetector(
    onTap: () {
      setState(() {
        selectedOption = option;
      });
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: selectedOption == option ? kPrimaryColor : Colors.transparent,
      ),
      child: Text(
        option,
        style: TextStyle(
          color: selectedOption == option ? Colors.white : Colors.black38,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    ),
  );
}

  Widget buildContent() {
    if (selectedOption == "Upcoming") {
      return buildUpcoming();
    } else if (selectedOption == "Complete") {
      return buildComplete();
    } else if (selectedOption == "Result") {
      return buildResult();
    }
    return const SizedBox.shrink();
  }

  // content for upcoming
  Widget buildUpcoming() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: scheduleDoctors.length,
      itemBuilder: (context, index) {
        final doctor = scheduleDoctors[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Container(
            width: double.maxFinite,
            height: 215,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: secondaryBgColor,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            15,
                          ),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(doctor.profile),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            doctor.position,
                            style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: cardBgColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 35,
                    width: 290,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Iconsax.calendar_1,
                          color: Colors.black54,
                        ),
                        Text(
                          doctor.date,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          Iconsax.clock,
                          color: Colors.black54,
                        ),
                        Text(
                          doctor.time,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: Text(
                            "Reschedule",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // content for complete
  Widget buildComplete() {
    return const Center(
      child: Text(
        "No appointments Complete ",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  } // content for result

  Widget buildResult() {
    return const Center(
      child: Text(
        "No appointments Result ",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }
}