

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kangaroocare/view/screen/Setting_classes/settings.dart';
import 'package:kangaroocare/view/screen/register.dart';
import 'package:kangaroocare/view_model/Controller/Alarms_Controller/set_heartrate_controller.dart';
import 'package:kangaroocare/view_model/Controller/Alarms_Controller/set_skin_temperature_controlller.dart';
import 'package:kangaroocare/view_model/Controller/Alarms_Controller/set_sp02_controlller.dart';
import 'package:kangaroocare/view_model/Controller/bright_controller.dart';
import '../../view_model/Controller/Alarms_Controller/set_airTemperature_controlller.dart';
import '../../view_model/Parameter_Switch_Controller/airt_temperature_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/baby_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/humandity_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/oxygen_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/skin_temparature_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/sp02_parameter.dart';


class drawer_s  extends StatelessWidget {
  const drawer_s ({super.key});


  @override
  Widget build(BuildContext context) {

    /// Alarms Settings
    ///
    final SetAirTemperatureMaximum setAirTemperatureMaximum = Get.put(SetAirTemperatureMaximum());
    final SetAirTemperatureMinimum setAirTemperatureMinimum = Get.put(SetAirTemperatureMinimum());
    //
    final SetSkinTemperatureMaximum setSkinTemperatureMaximum = Get.put(SetSkinTemperatureMaximum());
    final SetSkinTemperatureMinimum setSkinTemperatureMinimum = Get.put(SetSkinTemperatureMinimum());
    //
    final SetHeartRateMaximum setHeartRateMaximum = Get.put(SetHeartRateMaximum());
    final SetHeartRateMinimum setHeartRateMinimum = Get.put(SetHeartRateMinimum());
    //
    final SetSp02Maximum setSp02Maximum = Get.put(SetSp02Maximum());
    final SetSp02Minimum setSp02Minimum = Get.put(SetSp02Minimum());

    //


    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    final BrightnessController brightnessController = Get.put(BrightnessController());

    // Switch parameter Controller below


    final AirTemperatureParametereSwitch airTemperatureParametereSwitch = Get.put(AirTemperatureParametereSwitch());
    final SkinTemperatureParametereSwitch skinTemperatureParametereSwitch = Get.put(SkinTemperatureParametereSwitch());
    final Spo02ParametereSwitch spo02parametereSwitch = Get.put(Spo02ParametereSwitch());
    final HumandityParametereSwitch humandityParametereSwitch = Get.put(HumandityParametereSwitch());
    final OxygenParametereSwitch oxygenParametereSwitch = Get.put(OxygenParametereSwitch());
    final BabyParametereSwitch babyParametereSwitch = Get.put(BabyParametereSwitch());



    return  Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:20),
              //padding: EdgeInsets.only(top: 20),
              height: h*0.3,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              leading: Icon(Icons.alarm_sharp),
              title: Text('Alarms Settings'),
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context){
                      return SizedBox(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.zero,
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(1,1),
                                    color: Colors.black.withOpacity(0.2),
                                  )
                                ],
                                color: Colors.black12,
                              ),
                              child: Row(
                                children: [
                                  BackButton(
                                    onPressed: (){
                                      Get.back();
                                    },
                                  ),
                                  Center(child: Text("Alarms Settings",style: TextStyle(fontSize: 20),),),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h*0.02,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Air Temperature Alarm Setting",style: TextStyle(color: Colors.white,fontSize: 14),),
                                    Icon(Icons.air_outlined,color: Colors.white,),
                                  ],
                                ),
                                onPressed: (){
                                  showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                                    actions: [
                                      Column(
                                        children: [
                                          Container(
                                            height: h*0.05,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.red.withOpacity(0.1),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            child: Center(child: Text("Air Temperature Alarm Setting",style: TextStyle(fontSize: 15,color: Colors.black),),),
                                          ),
                                          SizedBox(height:h*0.02),
                                          Center(child: Text("Maximum Temperature",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),),
                                          SizedBox(height:h*0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.indigo.withOpacity(0),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            //GetBuilder
                                            child: GetBuilder<SetAirTemperatureMaximum>(builder: (_)=>
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setAirTemperatureMaximum.decrement();

                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    //SizedBox(width: w*0.02),
                                                    Text("${setAirTemperatureMaximum.xy.toString()}"),

                                                    //SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setAirTemperatureMaximum.increment();
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                          ),
                                          SizedBox(height:h*0.02),
                                          Center(child: Text("Minimum Temperature",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),),
                                          SizedBox(height:h*0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.indigo.withOpacity(0),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            //GetBuilder
                                            child: GetBuilder<SetAirTemperatureMinimum>(builder: (_)=>
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setAirTemperatureMinimum.decrement();

                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    //SizedBox(width: w*0.02),
                                                    Text("${setAirTemperatureMinimum.xy.toString()}"),

                                                    //SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setAirTemperatureMinimum.increment();
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                          ),
                                          SizedBox(height:h*0.01),
                                          ElevatedButton(onPressed: (){
                                            Get.back();
                                          },
                                              style: ElevatedButton.styleFrom(
                                               // textStyle: TextStyle(fontWeight: FontWeight.bold),
                                                primary: Colors.red,

                                              ),

                                              child: Center(child: Text("Submit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),)
                                          ),


                                        ],
                                      ),

                                    ],
                                  ));

                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20.0),
                                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                                  primary: Colors.red,
                                  // onPrimary: Colors.black,
                                  // elevation: 15
                                  shadowColor: Colors.indigo,
                                ),
                              ),
                            ),
                            SizedBox(height: h*0.02,),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Skin Temperature Alarm Setting",style: TextStyle(color: Colors.white,fontSize: 14),),
                                    Icon(Icons.how_to_reg_rounded,color: Colors.white,),
                                  ],
                                ),
                                onPressed: (){
                                  showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                                    actions: [
                                      Column(
                                        children: [
                                          Container(
                                            height: h*0.05,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.red.withOpacity(0.1),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            child: Center(child: Text("Skin Temperature Alarm Setting",style: TextStyle(fontSize: 15,color: Colors.black),),),
                                          ),
                                          SizedBox(height:h*0.02),
                                          Center(child: Text("Maximum Temperature",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),),
                                          SizedBox(height:h*0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.indigo.withOpacity(0),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            //GetBuilder
                                            child: GetBuilder<SetSkinTemperatureMaximum>(builder: (_)=>
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setSkinTemperatureMaximum.decrement();

                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    //SizedBox(width: w*0.02),
                                                    Text("${setSkinTemperatureMaximum.xy.toString()}"),

                                                    //SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setSkinTemperatureMaximum.increment();
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                          ),
                                          SizedBox(height:h*0.02),
                                          Center(child: Text("Minimum Temperature",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),),
                                          SizedBox(height:h*0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.indigo.withOpacity(0),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            //GetBuilder
                                            child: GetBuilder<SetSkinTemperatureMinimum>(builder: (_)=>
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setSkinTemperatureMinimum.decrement();

                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    //SizedBox(width: w*0.02),
                                                    Text("${setSkinTemperatureMinimum.xy.toString()}"),

                                                    //SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setSkinTemperatureMinimum.increment();
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                          ),
                                          SizedBox(height:h*0.01),
                                          ElevatedButton(onPressed: (){
                                            Get.back();
                                          },
                                              style: ElevatedButton.styleFrom(
                                                // textStyle: TextStyle(fontWeight: FontWeight.bold),
                                                primary: Colors.red,

                                              ),

                                              child: Center(child: Text("Submit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),)
                                          ),


                                        ],
                                      ),

                                    ],
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20.0),
                                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                                  primary: Colors.red,
                                  // onPrimary: Colors.black,
                                  // elevation: 15
                                  shadowColor: Colors.indigo,
                                ),
                              ),
                            ),
                            SizedBox(height: h*0.014),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("SPO2 Alarm Setting",style: TextStyle(fontSize: 14 ,color: Colors.white),),
                                    Icon(Icons.medical_services_sharp,color: Colors.white,),
                                  ],
                                ),
                                onPressed: (){
                                  showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                                    actions: [
                                      Column(
                                        children: [
                                          Container(
                                            height: h*0.05,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.red.withOpacity(0.1),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            child: Center(child: Text("SP02 Alarm Setting",style: TextStyle(fontSize: 15,color: Colors.black),),),
                                          ),
                                          SizedBox(height:h*0.02),
                                          Center(child: Text("Maximum Temperature",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),),
                                          SizedBox(height:h*0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.indigo.withOpacity(0),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            //GetBuilder
                                            child: GetBuilder<SetSp02Maximum>(builder: (_)=>
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setSp02Maximum.decrement();

                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    //SizedBox(width: w*0.02),
                                                    Text("${setSp02Maximum.xy.toString()}"),

                                                    //SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setSp02Maximum.increment();
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                          ),
                                          SizedBox(height:h*0.02),
                                          Center(child: Text("Minimum Temperature",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),),
                                          SizedBox(height:h*0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.indigo.withOpacity(0),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            //GetBuilder
                                            child: GetBuilder<SetSp02Minimum>(builder: (_)=>
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setSp02Minimum.decrement();

                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    //SizedBox(width: w*0.02),
                                                    Text("${setSp02Minimum.xy.toString()}"),

                                                    //SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setSp02Minimum.increment();
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                          ),
                                          SizedBox(height:h*0.01),
                                          ElevatedButton(onPressed: (){
                                            Get.back();
                                          },
                                              style: ElevatedButton.styleFrom(
                                                // textStyle: TextStyle(fontWeight: FontWeight.bold),
                                                primary: Colors.red,

                                              ),

                                              child: Center(child: Text("Submit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),)
                                          ),


                                        ],
                                      ),

                                    ],
                                  ));

                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20.0),
                                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                                  primary: Colors.red,
                                  // onPrimary: Colors.black,
                                  // elevation: 15
                                  shadowColor: Colors.indigo,
                                ),
                              ),
                            ),
                            SizedBox(height: h*0.02),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Heart Rate Alarm Settings",style: TextStyle(fontSize: 14 ,color: Colors.white),),
                                    Icon(Icons.heart_broken_outlined,color: Colors.white,),
                                  ],
                                ),
                                onPressed: (){
                                  showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                                    actions: [
                                      Column(
                                        children: [
                                          Container(
                                            height: h*0.05,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.red.withOpacity(0.1),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            child: Center(child: Text("Heart Rate Alarm Setting",style: TextStyle(fontSize: 15,color: Colors.black),),),
                                          ),
                                          SizedBox(height:h*0.02),
                                          Center(child: Text("Maximum Temperature",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),),
                                          SizedBox(height:h*0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.indigo.withOpacity(0),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            //GetBuilder
                                            child: GetBuilder<SetHeartRateMaximum>(builder: (_)=>
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setHeartRateMaximum.decrement();

                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    //SizedBox(width: w*0.02),
                                                    Text("${setHeartRateMaximum.xy.toString()}"),

                                                    //SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setHeartRateMaximum.increment();
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                          ),
                                          SizedBox(height:h*0.02),
                                          Center(child: Text("Minimum Temperature",style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),),
                                          SizedBox(height:h*0.01),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              boxShadow: [
                                                BoxShadow(
                                                  spreadRadius: 5,
                                                  blurRadius: 10,
                                                  offset: Offset(1,1),
                                                  color: Colors.indigo.withOpacity(0),
                                                )
                                              ],
                                              color: Colors.black12,
                                            ),
                                            //GetBuilder
                                            child: GetBuilder<SetHeartRateMinimum>(builder: (_)=>
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: <Widget>[
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setHeartRateMinimum.decrement();

                                                      },
                                                      child: Icon(Icons.remove),
                                                    ),
                                                    //SizedBox(width: w*0.02),
                                                    Text("${setHeartRateMinimum.xy.toString()}"),

                                                    //SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: (){
                                                        setHeartRateMinimum.increment();
                                                      },
                                                      child: Icon(Icons.add),
                                                    ),
                                                  ],
                                                ),
                                            ),
                                          ),
                                          SizedBox(height:h*0.01),
                                          ElevatedButton(onPressed: (){
                                            Get.back();
                                          },
                                              style: ElevatedButton.styleFrom(
                                                // textStyle: TextStyle(fontWeight: FontWeight.bold),
                                                primary: Colors.red,

                                              ),

                                              child: Center(child: Text("Submit",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),)
                                          ),


                                        ],
                                      ),

                                    ],
                                  ));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(20.0),
                                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                                  primary: Colors.red,
                                  // onPrimary: Colors.black,
                                  // elevation: 15
                                  shadowColor: Colors.indigo,
                                ),
                              ),
                            ),
                          ],
                        ),


                      );

                    }

                );

              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('System Settings'),
              onTap: () {
                // add navigation logic here
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_7),
              title: Text('Brightness'),
              onTap: () {
                showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
                  actions: [
                    Row(
                      children: [
                        Icon(Icons.brightness_7),
                        Expanded(
                          child: GetBuilder<BrightnessController>(builder: (_)=>
                              Slider(value: brightnessController.brightness.value, onChanged: (value){
                                brightnessController.setBrightness(value);
                              }
                              ),
                          ),


                        ),
                      ],
                    ),
                    Center(child: const Text("Slide to Adjust Brightness"))
                  ],
                ),


                );

              },
            ),
            ListTile(
              leading: Icon(Icons.person_pin),
              title: Text('Parameters'),
              onTap: () {
                Get.dialog(AlertDialog(
                  actions: [
                    Column(
                      children: [
                        Container(
                          height: h*0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: Offset(1,1),
                                color: Colors.red.withOpacity(0.2),
                              )
                            ],
                            color: Colors.black12,
                          ),
                          child: Center(child: Text("Incubator Parameter",style: TextStyle(fontSize: 20),),),
                        ),
                        SizedBox(height:h*0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Air Temperatue",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
                            Obx(() => Row(
                              children: [
                                Switch(value: airTemperatureParametereSwitch.isSwitched.value, onChanged: (value){
                                  airTemperatureParametereSwitch.isSwitched.value= value;
                                })
                              ],
                            )
                            ),
                          ],
                        ),
                        SizedBox(height:h*0.002),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Skin Temperatue ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
                            Obx(() => Row(
                              children: [
                                Switch(value: skinTemperatureParametereSwitch.isSwitched.value, onChanged: (value){
                                  skinTemperatureParametereSwitch.isSwitched.value= value;
                                })
                              ],
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height:h*0.002),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Humidity",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
                            Obx(() => Row(
                              children: [
                                Switch(value: humandityParametereSwitch.isSwitched.value, onChanged: (value){
                                  humandityParametereSwitch.isSwitched.value= value;
                                })
                              ],
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height:h*0.002),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sp02/HR ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
                            Obx(() => Row(
                              children: [
                                Switch(value: spo02parametereSwitch.isSwitched.value, onChanged: (value){
                                  spo02parametereSwitch.isSwitched.value= value;
                                })
                              ],
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height:h*0.002),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Oxygen Level ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
                            Obx(() => Row(
                              children: [
                                Switch(value: oxygenParametereSwitch.isSwitched.value, onChanged: (value){
                                  oxygenParametereSwitch.isSwitched.value= value;
                                })
                              ],
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height:h*0.002),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Baby Weight",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.red)),
                            Obx(() => Row(
                              children: [
                                Switch(value: babyParametereSwitch.isSwitched.value, onChanged: (value){
                                  babyParametereSwitch.isSwitched.value= value;
                                })
                              ],
                            ),
                            ),
                          ],
                        ),



                      ],
                    )
                  ],
                ));
              },
            ),
            ListTile(
              leading: Icon(Icons.auto_graph_sharp),
              title: Text('Graph Settings'),
              onTap: () {
               // Get.to(graph());
              },
            ),
            ListTile(
              leading: Icon(Icons.fiber_smart_record_rounded),
              title: Text('Data Records'),
              onTap: () {
               // Get.to(record());
              },
            ),
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text('Units'),
              onTap: () {},
              // add navigation logic here

            ),
            ListTile(
              leading: Icon(Icons.app_registration),
              title: Text('Register Parent Details'),
              onTap: () {
                Get.to(registor());
              },
              // add navigation logic here

            ),

          ],
        ),
      ),
    );

  }
}
