// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:lutter_health_app_ui_design/models/doctor_model.dart';

class NearByDoctor extends StatelessWidget {
  const NearByDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(nearbyDoctors.length, (index){
        final doctor = nearbyDoctors[index];
       return Padding(padding: EdgeInsets.only(bottom:30),
          child: Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: NetworkImage(doctor.profile) , fit: BoxFit.cover)
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("dr. ${doctor.name}", style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
                  SizedBox(height: 8,),
                  Text(doctor.position , style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black54),),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow[700],size: 18,),
                      Padding(
                        padding: EdgeInsets.only(right: 6, left: 4),
                        child: Text(doctor.rating.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Text("(${doctor.reviews} Reviwes)" , style: TextStyle(fontWeight: FontWeight.w500 , color: Colors.black54),)
                    ],
                  )

                ],
              )
            ],
          ),
       );
      })
    );
  }
}