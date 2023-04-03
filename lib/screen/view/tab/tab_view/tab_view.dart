import 'package:db_miner/screen/controller/home_controller/home_controller.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Tab_View extends StatefulWidget {
  const Tab_View({Key? key}) : super(key: key);

  @override
  State<Tab_View> createState() => _Tab_ViewState();
}

class _Tab_ViewState extends State<Tab_View> {
  Home_Controller home_controller = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Form(
        key: home_controller.sumitkey.value,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: TextStyle(color: Colors.white, fontSize: 15.sp),
                textInputAction: TextInputAction.done,
                controller: home_controller.txtcat,
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
                    borderRadius: BorderRadius.circular(5.h),
                  ),
                ),
                validator: (value) {
                  if(value!.isEmpty)
                    {
                      return "Please Enatre the Category";
                    }
                },
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  if(home_controller.sumitkey.value.currentState!.validate())
                    {
                      Db_Helper.db_helper
                          .insertDB(name: home_controller.txtcat.text);
                      home_controller.data.value =
                      await Db_Helper.db_helper.readDB();

                      print("${home_controller.data}");

                      Get.back();
                      home_controller.txtcat.clear();
                    }
                },
                child: Text("Submit")),
          ],
        ),
      ),
    ));
  }
}
