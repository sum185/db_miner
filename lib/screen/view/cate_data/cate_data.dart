import 'package:db_miner/screen/controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Cate_Data extends StatefulWidget {
  const Cate_Data({Key? key}) : super(key: key);

  @override
  State<Cate_Data> createState() => _Cate_DataState();
}

class _Cate_DataState extends State<Cate_Data> {
  Home_Controller home_controller = Get.put(Home_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView.builder(
            itemCount: home_controller.category_wise_data.length,
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                home_controller.qou2.value = home_controller.category_wise_data[index];
                Get.toNamed('quodata');
              },
              child: Container(
                height: 20.h,
                child: Card(
                  color: Colors.blue,
                    child: Center(child: Text("${home_controller.category_wise_data[index]['name']}",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.white),))),
              ),
            ),
          ),
        )
    );
  }
}
