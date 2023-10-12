import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroocare/view/screen/home.dart';

class registor extends StatefulWidget {
  const registor({Key? key}) : super(key: key);

  @override
  State<registor> createState() => _registorState();
}

class _registorState extends State<registor> {

  final TextEditingController _parentNameController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final TextEditingController _patientDaysController = TextEditingController();

  @override
  // Function to save registration data to Firestore
  void saveRegistrationData(String mr, String parentName, String contactNumber, String patientDays) {
    FirebaseFirestore.instance
        .collection('users') // Replace with your Firestore collection name
        .doc(mr) // Use MR number as the document ID
        .set({
      'parentName': parentName.toString(),
      'contactNumber': contactNumber.toString(),
      'patientDays': patientDays.toString(),
    })
        .then((value) {
      // Registration data saved successfully
      Get.snackbar('Success', 'Registration completed!',
          snackPosition: SnackPosition.BOTTOM);
      // Navigate to the home screen or perform any other action
      Get.to(home());
    })
        .catchError((error) {
      // Handle errors if any
      print("Error: $error");
      Get.snackbar('Error', 'Failed to register',
          snackPosition: SnackPosition.BOTTOM);
    });
  }

  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.all(20),
              height: h * 0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain),
              ),
            ),
            SizedBox(height: h * 0.040),
            Column(
              children: [
                Center(
                  child: Text(
                    "Kangaroo Care AI",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: h * 0.010,
                ),
                Center(
                  child: Text(
                    "Incubator Management System",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: h * 0.030),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 1),
                          color: Colors.indigo.withOpacity(0.2),
                        )
                      ]),
                  child: TextFormField(
                    controller: _parentNameController,
                    decoration: InputDecoration(
                        labelText: 'Parent Name',
                        hintText: "Enter Parent Name",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        )),
                  ),
                ),
                SizedBox(height: h * 0.015),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 1),
                          color: Colors.indigo.withOpacity(0.2),
                        )
                      ]),
                  child: TextFormField(
                    controller: _contactNumberController,
                    decoration: InputDecoration(
                        labelText: 'Contact Number',
                        hintText: "Enter Contact Number",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        )),
                  ),
                ),
                SizedBox(height: h * 0.015),
                Container(
                  margin: EdgeInsets.only(left: 15,right: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(1, 1),
                          color: Colors.indigo.withOpacity(0.2),
                        )
                      ]),
                  child: TextFormField(
                    controller: _patientDaysController,
                    decoration: InputDecoration(
                        labelText: 'Patient Days',
                        hintText: "Enter Patient Days",
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.white, width: 1.0),
                        )),
                  ),
                ),
                SizedBox(height: h * 0.030),
                Container(
                  child: Center(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // Set the background color here
                        ),
                        onPressed: () {
                          String parentName = _parentNameController.text.trim();
                          String contactNumber = _contactNumberController.text.trim();
                          String patientDays = _patientDaysController.text.trim();

                          // Get the MR number from somewhere (e.g., if it was entered on a previous screen)
                          String mrNo = '0000'; // Replace with the actual MR number

                          // Validate and save registration data
                          if (parentName.isNotEmpty && contactNumber.isNotEmpty && patientDays.isNotEmpty) {
                            saveRegistrationData(mrNo, parentName, contactNumber, patientDays);
                          } else {
                            Get.snackbar('Error', 'Please fill in all fields',
                                snackPosition: SnackPosition.BOTTOM);
                          }

                        },
                        child: Text(
                          "Registor",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25,color: Colors.white),
                        )),
                  )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
