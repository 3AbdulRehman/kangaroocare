import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroocare/view/screen/home.dart';

class login extends StatefulWidget {
   login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  final TextEditingController _mrNoController = TextEditingController();
  Future<void> validateAndLogin(BuildContext context, String mr) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // No user is currently signed in, perform authentication here if needed
        // You can use FirebaseAuth to sign in or create a new user
      }

      // Check if the MR number exists in Firestore
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users') // Replace with your collection name
          .where('mr', isEqualTo: mr)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        // MR number is valid, perform the login action here
        // You can navigate to the home screen or perform any desired action
        Get.off(home());
        Get.snackbar('Success', 'Login Successfully!',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        // MR number does not exist in Firestore
        // Show an error message to the user
        Get.snackbar('Error', 'Not a Valid MR Number!',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      // Handle any errors that occur during validation or login
      print("Error: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(30),
              width: w,
              height: h * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: h * 0.008),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Kangaroo Care AI",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: h * 0.015),
                  Center(
                    child: Text(
                      "Incubator Management System",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: h * 0.08),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(1, 1),
                            color: Colors.indigo.withOpacity(0.2),
                          )
                        ]),
                    child: TextFormField(
                      controller: _mrNoController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'MR No',
                          prefixIcon: Icon(Icons.add_chart, color: Colors.black,),
                          hintText: "Enter your MR No",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.white, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                          )),
                    ),
                  ),
                  SizedBox(height: h * 0.045),
                  ElevatedButton(

                      style: ElevatedButton.styleFrom(
                        primary: Colors.red, // Set the background color here
                      ),
                      child: Text(
                        "Enter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
                      ),
                      onPressed: () {
                        String mrNo = _mrNoController.text.trim();
                        if (mrNo.isNotEmpty) {
                          validateAndLogin(context, mrNo);
                        } else {
                          Get.snackbar('MR No is empty', 'Please enter a valid MR No.',
                              snackPosition: SnackPosition.BOTTOM);
                          print("MR No is empty. Please enter a valid MR No.");
                        }

                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}