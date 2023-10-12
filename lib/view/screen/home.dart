import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:kangaroocare/model/Real-Time%20Database%20Controller/AirTemperatureValueController.dart';
import 'package:kangaroocare/model/Real-Time%20Database%20Controller/HumandityController.dart';
import '../../model/Real-Time Database Controller/SkinTemperatureController.dart';
import '../../view_model/Controller/dark_light_mode.dart';
import '../../view_model/Parameter_Switch_Controller/airt_temperature_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/baby_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/humandity_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/oxygen_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/skin_temparature_parameter.dart';
import '../../view_model/Parameter_Switch_Controller/sp02_parameter.dart';

import 'drawer.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  final AirTemperatureValueController airTemperatureValueController = Get.put(AirTemperatureValueController());
  final SkinTemperatureValueController skinTemperatureValueController = Get.put(SkinTemperatureValueController());
  final  HumidityValueController humidityValueController = Get.put(HumidityValueController());

  @override
  void initState() {
    super.initState();
    airTemperatureValueController.fetchTemperature();
    skinTemperatureValueController.fetchTemperature();
    humidityValueController.fetchTemperature();
  }

  //
  Widget build(BuildContext context) {
    final ScreenModeController screenModeController = Get.put(ScreenModeController());
    
    // Home Conatainer Parameters below
    final AirTemperatureParametereSwitch airTemperatureParametereSwitch = Get.put(AirTemperatureParametereSwitch());
    final SkinTemperatureParametereSwitch skinTemperatureParametereSwitch = Get.put(SkinTemperatureParametereSwitch());
    final Spo02ParametereSwitch spo02parametereSwitch = Get.put(Spo02ParametereSwitch());
    final HumandityParametereSwitch humandityParametereSwitch = Get.put(HumandityParametereSwitch());
    final OxygenParametereSwitch oxygenParametereSwitch = Get.put(OxygenParametereSwitch());
    final BabyParametereSwitch babyParametereSwitch =Get.put(BabyParametereSwitch());
    //end

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Kangaroo Care AI",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
        )
        ),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(color: Colors.white ),
      ),
      drawer: drawer_s(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * 0.14,
              width: w,
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.only(left :10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 70)),
                            Icon(FontAwesomeIcons.solidBell, color: Colors.green, size: 27,),
                          ],
                        ),
                        Text("Power Failed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 70)),
                            Icon(
                              FontAwesomeIcons.solidBell,
                              color: Colors.green,
                              size: 27,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text("Sensor Failed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 70)),
                            Icon(FontAwesomeIcons.solidBell, color: Colors.green, size: 27,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Fan Failed", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Padding(padding: EdgeInsets.only(top: 70)),
                            Icon(
                              FontAwesomeIcons.solidBell,
                              color: Colors.green,
                              size: 27,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              "Sytem Failed",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Visibility(
                      visible: airTemperatureParametereSwitch.isSwitched.value,
                      child: Column(
                        children: [
                          Text('Air Temperature', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 5),
                          Column(
                            children: [
                              Container(
                                  height: h * 0.30,
                                  width: w * 0.48,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            "Current Temperature",
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        ),
                                        SizedBox(height: 6),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              height: h * 0.05,
                                              width: w * 0.35,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.black),
                                              ),
                                              child: Center(
                                                child: GetBuilder<AirTemperatureValueController>(
                                                  init: airTemperatureValueController,
                                                  builder: (controller) {
                                                return Text(
                                                    controller.value.value,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold));
                                                  },
                                                ),
                                              ),
                                            ),
                                            Text("C",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                                           
                                          ],
                                        ),
                                        SizedBox(height: h*0.003,),
                                        Column(
                                          children: [
                                            Center(
                                              child: Text("Set Temperature", style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,
                                                    color: Colors.red),
                                              ),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    height: h * 0.05,
                                                    width: w * 0.35,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      border: Border.all(
                                                          color: Colors.black),
                                                    ),
                                                    child: Center(
                                                        child: Text("20",
                                                      style: TextStyle(
                                                          fontSize: 20, fontWeight: FontWeight.bold),
                                                    ))
                                                ),
                                                Text("C",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                                              ],
                                            ),
                                            SizedBox(height: h*0.02,),
                                            Container(
                                              margin: EdgeInsets.only(left: 20, right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(FontAwesomeIcons.solidBell, color: Colors.green, size: 30,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.shareFromSquare, color: Colors.black, size: 30,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ) /////////
                                  ),
                            ],
                          ),
                        ],
                      ),
                    )),

                /////////////////////////
                Obx(() => Visibility(
                      visible: skinTemperatureParametereSwitch.isSwitched.value,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text('Skin Temperature', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                              SizedBox(height: 5),
                              Column(
                                children: [
                                  Container(
                                      height: h * 0.30,
                                      width: w * 0.48,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Current Temperature", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red),
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  height: h * 0.05,
                                                  width: w * 0.35,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                                    border: Border.all(
                                                        color: Colors.indigo),
                                                  ),
                                                  child: Center(
                                                    child: GetBuilder<
                                                        SkinTemperatureValueController>(
                                                      init: skinTemperatureValueController,
                                                      builder: (controller) {
                                                        return Text(
                                                            controller.value.value,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold));
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                Text("C",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                                              ],
                                            ),
                                            SizedBox(height: 5,),
                                            Column(
                                              children: [
                                                Text("Set Temperature", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red),
                                                ),
                                                SizedBox(height: 5),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    Container(
                                                        height: h * 0.05,
                                                        width: w * 0.35,
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  10),
                                                          border: Border.all(color: Colors.black),
                                                        ),
                                                        child: Center(
                                                            child: Text("0", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                                        ))),
                                                    Text("C",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                                                  ],
                                                ),
                                                SizedBox(height: 8),
                                                Container(margin: EdgeInsets.only(left: 20, right: 20),
                                                  child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                    children: [Icon(FontAwesomeIcons.solidBell, color: Colors.green, size: 30,
                                                      ),
                                                      Icon(FontAwesomeIcons.shareFromSquare, color: Colors.black, size: 30,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ) //////
                                      ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
///////////////////////////////
            SizedBox(height: h*0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Visibility(
                      visible: humandityParametereSwitch.isSwitched.value,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Center(
                                child: Text('Humidity',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)
                                ),
                              ),
                              SizedBox(height: 5,),
                              Container(
                                  height: h * 0.30,
                                  width: w * 0.48,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Current Humidity",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                height: h * 0.05,
                                                width: w * 0.35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: Center(
                                                    child: GetBuilder<HumidityValueController>(
                                                      init: humidityValueController,
                                                      builder: (controller){
                                                        return Text(controller.value.value,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),);
                                                      },
                                                    )
                                                )
                                            ),
                                            Text("%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        SizedBox(height: 5,),
                                        Column(
                                          children: [
                                            Text(
                                              "Normal Range",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight:
                                                      FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                            SizedBox(height: 5,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    height: h * 0.06,
                                                    width: w * 0.35,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors.black),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "60 %",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))
                                                ),
                                                Text("%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)

                                              ],
                                            ),
                                            SizedBox(height: h*0.02,),
                                            Container(margin: EdgeInsets.only(left: 20, right: 20),
                                              child: Row(mainAxisAlignment:MainAxisAlignment.end,
                                                children: [
                                                  Icon(FontAwesomeIcons.shareFromSquare, color: Colors.black, size: 30,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ) //////
                                  ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Obx(() => Visibility(
                      visible: spo02parametereSwitch.isSwitched.value,
                      child: Column(
                        children: [
                          Text('SPO2 / HR', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 5),
                          Column(
                            children: [
                              Container(
                                  height: h * 0.30,
                                  width: w * 0.48,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        Text("SPO2", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 5,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                height: h * 0.05,
                                                width: w * 0.35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: Center(child: Text("92 ", style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),))
                                            ),
                                            Text("%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                                          ],
                                        ),
                                        SizedBox(height: h*0.005,),
                                        Column(
                                          children: [
                                            Text("HR", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red)),
                                            SizedBox(height: 5,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    height: h * 0.05,
                                                    width: w * 0.35,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      border: Border.all(
                                                          color: Colors.black),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "82 ",
                                                      style: TextStyle(
                                                          fontSize: 27,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))
                                                ),
                                                Text("%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)

                                              ],
                                            ),
                                            SizedBox(height: h*0.02,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10,right:10),
                                              child: Row(
                                                
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.solidBell, color: Colors.green, size: 30,
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons.shareFromSquare,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ) /////////
                                  ),
                            ],
                          ),
                        ],
                      ),
                    )),
                /////////////////////////
              ],
            ),
            SizedBox(height: h*0.02,),
            ////////////////////////////
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Visibility(
                      visible: oxygenParametereSwitch.isSwitched.value,
                      child: Column(
                        children: [
                          Text('Oxygen Level', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: h*0.002),
                          Column(
                            children: [
                              Container(
                                  height: h * 0.30,
                                  width: w * 0.48,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Current Oxygen Level",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.red),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                height: h * 0.05,
                                                width: w * 0.35,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      color: Colors.black),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  "34.1 ",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold),
                                                ))),
                                            Text("%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)

                                          ],
                                        ),
                                        SizedBox(
                                          height: h*0.002,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "Normal Range",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                            SizedBox(
                                              height: h*0.002,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    height: h * 0.05,
                                                    width: w * 0.35,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      border: Border.all(
                                                          color: Colors.black),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "21 ",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                                Text("%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)

                                              ],
                                            ),
                                            SizedBox(height: h*0.02,),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.shareNodes,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ) /////////
                                  ),
                            ],
                          ),
                        ],
                      ),
                    )),
                /////////////////////////
                Obx(() => Visibility(
                      visible: babyParametereSwitch.isSwitched.value,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                  child: Text('Baby Weight',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18))),
                              SizedBox(
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Container(
                                      height: h * 0.24,
                                      width: w * 0.48,
                                      decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Current Weight",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                    height: h * 0.1,
                                                    width: w * 0.35,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(10),
                                                      border: Border.all(
                                                          color: Colors.black),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "0",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ))),
                                                Text("Kg",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)

                                              ],
                                            ),
                                            SizedBox(
                                              height: 8,
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 20, right: 20),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(
                                                            30),
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                primary: Colors.red),
                                                        onPressed: () {},
                                                        child: Text("Auto Zero", style: TextStyle(fontSize: 12, 
                                                            color: Colors.white),
                                                        )),
                                                  ),
                                                  Icon(
                                                    FontAwesomeIcons
                                                        .shareFromSquare,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ) //////
                                      ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ), ////////////////////////////
          ],
        ),
      ),
    );
  }
}
