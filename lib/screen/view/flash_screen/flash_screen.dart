import 'package:db_miner/screen/controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
class Flash_Screen extends StatefulWidget {
  const Flash_Screen({Key? key}) : super(key: key);

  @override
  State<Flash_Screen> createState() => _Flash_ScreenState();
}

class _Flash_ScreenState extends State<Flash_Screen> {
  Home_Controller home_controller = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    home_controller.flashScreen();

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Quotes",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.sp),),
                SizedBox(height: 10.h),
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.amber,
                )
              ],
            ),
          ),
        )
    );
  }
}
