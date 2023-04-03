import 'package:db_miner/screen/controller/home_controller/home_controller.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:db_miner/utils/db_helper2.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu_custom/modals.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:focused_menu_custom/focused_menu.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  Home_Controller home_controller = Get.put(Home_Controller());

  @override
  void initState() {
    super.initState();
   getdata();
  }
  Future<void> getdata() async {
    home_controller.data.value = await  Db_Helper.db_helper.readDB();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            "Quotes",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CarouselSlider.builder(itemCount: home_controller.slider.length,
                    itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 20.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                        boxShadow: [
                          BoxShadow(blurRadius: 4,color: Colors.black,spreadRadius: 4)
                        ]
                      ),
                      child: Image.asset("${home_controller.slider[index]}",fit: BoxFit.cover,),
                    ),
                  );
                }, options: CarouselOptions(height: 20.h,autoPlay: true,onPageChanged: (index, reason) {
                  home_controller.changeImage.value = index;
                },)),
              ),
              Obx(
                    () =>  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: home_controller.slider.asMap().entries.map((e) => Container(
                    height: 2.h,
                    width: 2.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: home_controller.changeImage.value==e.key?Colors.red:Colors.black
                    ),
                  )).toList(),
                ),
              ),
              SizedBox(height: 2.h,),
              Container(
                height: 40.h,
                width: double.infinity,
                color: Colors.white54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Most Popular",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 30.h,
                        child: GridView.builder(itemCount: 4,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 100,crossAxisSpacing: 20,mainAxisSpacing: 20), itemBuilder: (context, index) {
                          return InkWell(
                            onTap: (){
                              home_controller.d1 = home_controller.l1[index];
                              Get.toNamed('data');
                            },
                            child: Container(
                              height: 30.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: home_controller.l1[index].color,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text("${home_controller.l1[index].name}",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          );
                        },),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 5.h,),
              Obx(
                () =>  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Quotes by category",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                    ),
                    Container(
                      height: 20.h,
                      width: double.infinity,
                      color: Colors.white,
                      child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: home_controller.data.length,itemBuilder: (context, index) {
                        return FocusedMenuHolder(
                          onPressed: (){},
                          menuItems: [
                            FocusedMenuItem(title: Text("Delete"),trailingIcon: Icon(Icons.delete,color: Colors.black,),onPressed: () async {
                              Db_Helper.db_helper.deleteDB(id: home_controller.data[index]['id']);
                              home_controller.data.value = await  Db_Helper.db_helper.readDB();
                            }),
                            FocusedMenuItem(title: Text("Update"),trailingIcon: Icon(Icons.edit,color: Colors.black,),onPressed: (){
                              Get.defaultDialog(
                                content: TextField(
                                  controller: home_controller.txtcat,
                                ),
                                actions: [
                                  ElevatedButton(onPressed: ()async{
                                    Db_Helper.db_helper.updateDB(name: home_controller.txtcat.text, id: home_controller.data[index]['id']);
                                    home_controller.data.value = await Db_Helper.db_helper.readDB();
                                    Get.back();
                                    home_controller.txtcat.clear();
                                  }, child: Text("Update",style: TextStyle(color: Colors.black),))
                                ]
                              );
                            })
                          ],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () async {
                                home_controller.category_wise_data.clear();
                                home_controller.quote_data.value =
                                    await Db_helper2.db_helper2.readDB();
                                int cate_index = home_controller.data[index]['id'];
                                print("========== INDEX $cate_index");
                                if(home_controller.quote_data.isNotEmpty)
                                  {
                                    for(int i=0; i<home_controller.quote_data.length; i++)
                                    {
                                      print("============ LOOP ${home_controller.quote_data[i]['category_id']}");
                                      if(cate_index == home_controller.quote_data[i]['category_id'])
                                      {
                                        home_controller.category_wise_data.add(home_controller.quote_data[i]);
                                      }
                                    }
                                    print("============ ${home_controller.category_wise_data}");
                                    Get.toNamed('cate');

                                  }
                                else
                                  {
                                    Get.snackbar("Error", "Please Add Quote");
                                  }
                              },
                              child: Container(
                                height: 15.h,
                                width: 30.h,
                                decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Text(
                                    home_controller.data[index]['name'],style: TextStyle(color: Colors.white,fontSize: 20.sp,fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },)
                        ),
                    Container(
                      height: 40.h,
                      width: double.infinity,
                      color: Colors.white54,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Quotes By Author",style: TextStyle(color: Colors.black,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 30.h,
                              child: GridView.builder(itemCount: 4,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 100,crossAxisSpacing: 20,mainAxisSpacing: 20), itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: (){
                                    home_controller.d2 = home_controller.l2[index];
                                    Get.toNamed('data2');
                                  },
                                  child: Container(
                                    height: 30.h,
                                    width: 50.w,
                                    decoration: BoxDecoration(
                                        color: home_controller.l2[index].color,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Center(
                                      child: Text("${home_controller.l2[index].name}",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 15.sp,fontWeight: FontWeight.bold),),
                                    ),
                                  ),
                                );
                              },),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('add');
          },
          backgroundColor: Colors.blue,
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
