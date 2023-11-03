import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_medical_demo1/app/modules/home/controllers/profil_controller.dart';
import 'package:flutter_medical_demo1/app/modules/home/views/screens/login_screen.dart';
// import 'package:flutter_medical_demo1/screens/login_screen.dart';
import 'package:flutter_medical_demo1/app/modules/home/views/screens/login_screen.dart';
import 'package:flutter_medical_demo1/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class WelcomeScreen extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Material(
            //widget
            //tampilan dasar / kerangka
            child: Container(
      //tata letak elemen
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(height: 15),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => loginScreen()));
              },
              child: Text(
                "SKIP",
                style: TextStyle(
                  color: Color(0xFF7165D6),
                  fontSize: 20,
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.all(20),
            child: Image.asset("images/doctors.png"),
          ),
          SizedBox(height: 50),
          Text(
            "Doctors Appointment",
            style: TextStyle(
              color: Color(0xFF7165D6),
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 1, //per karakter
              wordSpacing: 2, //perkata
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Appoint Your Doctors",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
          ),
          SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, //biar jarak sama
            children: [
              Material(
                color: Color(0xFF7165D6),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  //percikan
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => loginScreen()));
                    Get.toNamed(Routes.login);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: Color(0xFF7165D6),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    //Navigator.push(context, MaterialPageRoute(
                    //builder: (context) =>));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    )));
  }
}

// class WelcomeScreenBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
