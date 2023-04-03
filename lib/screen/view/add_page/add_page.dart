import 'dart:io';

import 'package:db_miner/screen/controller/home_controller/home_controller.dart';
import 'package:db_miner/screen/view/tab/tab_view/tab_view.dart';
import 'package:db_miner/screen/view/tab/tab_view/tab_view2.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:db_miner/utils/db_helper2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';

class Add_Page extends StatefulWidget {
  const Add_Page({Key? key}) : super(key: key);

  @override
  State<Add_Page> createState() => _Add_PageState();
}

class _Add_PageState extends State<Add_Page> {
  Home_Controller home_controller = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              "Add Quotes",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
            centerTitle: true,
            bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                Tab(
                  text: "Add Quotes Category",
                ),
                Tab(
                  text: "Add Quotes",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Tab_View(),
              Tab_View2()
            ],
          )
           ),
        ),
    );
  }
}
