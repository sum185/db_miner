import 'package:db_miner/screen/view/add_page/add_page.dart';
import 'package:db_miner/screen/view/data_page/data_page.dart';
import 'package:db_miner/screen/view/data_page2/data_page2.dart';
import 'package:db_miner/screen/view/flash_screen/flash_screen.dart';
import 'package:db_miner/screen/view/home_page/home_page.dart';
import 'package:db_miner/screen/view/quo_view/quo_view.dart';
import 'package:db_miner/screen/view/tab/tab_view/tab_view.dart';
import 'package:db_miner/screen/view/tab/tab_view/tab_view2.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

import 'screen/view/cate_data/cate_data.dart';
void main()
{
  runApp(
    Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/':(p0) => Flash_Screen(),
          'home':(p0) => Home_Page(),
          'data':(p0) => Data_Page(),
          'add':(p0) => Add_Page(),
          'cate':(p0) => Cate_Data(),
          'tab':(p0) => Tab_View(),
          'tab2':(p0) => Tab_View2(),
          'quodata':(p0) => Quo_View(),
          'data2':(p0) => Data_Page2()
        },
      );
    },)
  );
}