import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroocare/view/screen/login.dart';
import 'package:kangaroocare/view/screen/register.dart';
import 'package:kangaroocare/view_model/Controller/Auto_Generate.dart';

import '../../model/firease_controller/auto_generate_number_controller.dart';
import 'home.dart';

class entry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
final NumberController numberController =Get.put(NumberController());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30),
              margin: EdgeInsets.all(40),
              height: h * 0.3,
              width: w*0.7,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    "Welcome To Kangaroo Care AI",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: h * 0.020),
                Center(
                  child: Text(
                    "Incubator Management System",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.11,),
            Container(
              width: w * 0.8,
              height: h * 0.06,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    // Set the background color here
                  ),
                  child: Text(
                    "MR Number to Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  onPressed: () {
                    Get.to(login());
                  },
                ),
              ),
            ),
            SizedBox(height: h * 0.025),
            Container(
              width: w * 0.8,
              height: h * 0.06,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Set the background color here
                  ),
                  child: Text(
                    "MR Details",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  onPressed: () {
                    //Get.to(MR());
                  },
                ),
              ),
            ),
            SizedBox(height: h * 0.025),
            Container(
              /*width: w * 0.8,*/
              height: h * 0.06,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // Set the background color here
                    ),
                    child: Text(
                      "Auto Generate MR",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                        title: 'Auto Generate MR Number',
                        content:Obx(() => Text('${controller.getFormattedNumber()}')),

                        textConfirm: 'Please Confirm MR Number',
                        onConfirm: () {
                          saveNumberToFirebase('0001');
                          //numberController.incrementNumber();
                          Get.back(); // Close the dialog
                        },
                      );

                    }),
              ),
            ),
            SizedBox(
              height: w * 0.25,
            ),
            RichText(
              text: TextSpan(
                  text: "Email: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: "kangaroocareai@consultant.com",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
