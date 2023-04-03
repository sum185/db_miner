import 'package:db_miner/screen/controller/home_controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Data_Page extends StatefulWidget {
  const Data_Page({Key? key}) : super(key: key);

  @override
  State<Data_Page> createState() => _Data_PageState();
}

class _Data_PageState extends State<Data_Page> {
  Home_Controller home_controllere = Get.put(Home_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset("${home_controllere.d1!.image}",fit: BoxFit.fill,),
      ),
    )
    );
  }
}
