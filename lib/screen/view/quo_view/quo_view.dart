import 'package:db_miner/screen/controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
class Quo_View extends StatefulWidget {
  const Quo_View({Key? key}) : super(key: key);

  @override
  State<Quo_View> createState() => _Quo_ViewState();
}

class _Quo_ViewState extends State<Quo_View> {
  Home_Controller home_controller = Get.put(Home_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              Obx(
                () =>  Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Image.asset("${home_controller.bi[home_controller.imageIndex.value]}",fit: BoxFit.fill,),
                ),
              ),
              Obx(
                () =>  Center(
                  child: Text("${home_controller.qou2['name']}",style: home_controller.ff[home_controller.fontIndex.value](color: Colors.white,fontSize: 30.sp,fontWeight: FontWeight.bold,),),
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 10.h),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){
                        if(home_controller.imageIndex.value==3)
                          {
                            home_controller.imageIndex.value=0;

                          }
                        else{
                          home_controller.imageIndex.value++;
                        }
                      }, icon: Icon(Icons.image,color: Colors.white,)),
                      SizedBox(width: 5.w,),
                      IconButton(onPressed: (){
                        if(home_controller.fontIndex.value==3)
                        {
                          home_controller.fontIndex.value=0;

                        }
                        else{
                          home_controller.fontIndex.value++;
                        }
                      }, icon: Icon(Icons.text_fields,color: Colors.white,))
                    ],
                  ),
                ),
              )
            ],
          )
        )
    );
  }
}
