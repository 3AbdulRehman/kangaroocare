import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/Controller/dark_light_mode.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    final ScreenModeController screenModeController = Get.put(ScreenModeController());
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body: Container(

        margin: EdgeInsets.only(top:10,left: 5,right: 5),
        height: h*0.05,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.brightness_7),
            Text("Dark / Light Mode",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            GetBuilder<ScreenModeController>(builder: (_)=>Switch(
              value: screenModeController.isDark,
              onChanged: (state){
                screenModeController.ChangTheme(state);
              },

            ),

            ),


          ],
        ),
        //child: Text('Dark / Light Mode',style: TextStyle(fontSize: 17),),
      )
    );
  }
}
