import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller/home_controller.dart';

class Data_Page2 extends StatefulWidget {
  const Data_Page2({Key? key}) : super(key: key);

  @override
  State<Data_Page2> createState() => _Data_Page2State();
}

class _Data_Page2State extends State<Data_Page2> {
  Home_Controller home_controllere = Get.put(Home_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset("${home_controllere.d2!.image}",fit: BoxFit.fill,),
      ),
    )
    );;
  }
}
