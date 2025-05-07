// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lutter_health_app_ui_design/widgets/doctor_profile.dart';
import 'package:lutter_health_app_ui_design/widgets/health_needs.dart';
import 'package:lutter_health_app_ui_design/widgets/nearby_doctor.dart';

class HealthappHomePage extends StatelessWidget {
  const HealthappHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Jane",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "How are you feeling today?",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                  fontSize: 19),
            ),
          ],
        ),
        actions: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black12),
            ),
            child: Icon(
              Iconsax.notification,
              size: 25,
            ),
          ),
          const SizedBox(width: 15),
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black12),
              ),
              child: Icon(
                Iconsax.search_normal,
                size: 25,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(14),
        children: [
          DoctorProfile(),
          Text("Health Needs", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
         HealthNeeds(),
         SizedBox(height: 12,),
       Text("Nearby doctor", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
         SizedBox(height: 12,),
         NearByDoctor()
          
        ],
      ),
    );
  }
}
