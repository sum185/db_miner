import 'package:db_miner/screen/controller/home_controller/home_controller.dart';
import 'package:db_miner/utils/db_helper2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Tab_View2 extends StatefulWidget {
  const Tab_View2({Key? key}) : super(key: key);

  @override
  State<Tab_View2> createState() => _Tab_View2State();
}

class _Tab_View2State extends State<Tab_View2> {
  Home_Controller home_controller = Get.put(Home_Controller());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    home_controller.dropvalue.value = home_controller.data[0]['name'];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Obx(() => home_controller.data.isNotEmpty
              ? Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                  textInputAction: TextInputAction.done,
                  controller: home_controller.txtquo,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.red.shade900,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.h)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.h)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.h))),
                ),
              ),
              Obx(
                    () =>  Container(
                  height: 7.h,
                  width: 30.w,
                  color: Colors.amber,
                  child: Center(
                    child: DropdownButton(
                      items: home_controller.data
                          .asMap()
                          .entries
                          .map((element) => DropdownMenuItem(
                        child: Text(
                            "${home_controller.data[element.key]['name']}"),
                        value: home_controller.data[element.key]
                        ['name'],

                        onTap: (){
                          home_controller.DropIndex.value = element.key;
                        },
                      ),

                      )
                          .toList(),
                      value: "${home_controller.dropvalue.value}",
                      onChanged: (value) {
                        home_controller.dropvalue.value= value as String;
                      },),
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              ElevatedButton(onPressed: () async {
                Db_helper2.db_helper2.insertDB(name: home_controller.txtquo.text, cate_id: home_controller.data[home_controller.DropIndex.value]['id']);
                home_controller.quote_data.value =
                await Db_helper2.db_helper2.readDB();
                Get.back();
                home_controller.txtquo.clear();
              }, child: Text("Submit"))
            ],
          )
              : Center(child: Text("Please Enter Category"))),
        )
    );
  }
}

