import 'dart:async';
import 'dart:io';
import 'package:db_miner/screen/model/Home_Model/home_model.dart';
import 'package:db_miner/screen/view/tab/tab_view/tab_view.dart';
import 'package:db_miner/screen/view/tab/tab_view/tab_view2.dart';
import 'package:db_miner/utils/db_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';
class Home_Controller extends GetxController {

  RxInt tabIndex = 0.obs;
  RxList<Map> data = <Map>[].obs;
  RxList<Map> quote_data = <Map>[].obs;
  RxList<Map> category_wise_data = <Map>[].obs;
  TextEditingController txtcat = TextEditingController();
  TextEditingController txtquo = TextEditingController();
  RxString imagepath = "".obs;
  ImagePicker piker = ImagePicker();
  RxInt changeImage = 0.obs;
  RxString dropvalue = "".obs;
  RxMap qou2 ={}.obs;
  RxInt imageIndex = 0.obs;
  RxInt fontIndex =0.obs;

  Rx<GlobalKey<FormState>> sumitkey = GlobalKey<FormState>().obs;

  List slider = [
    "asset/image/education.jpeg",
    "asset/image/life.png",
    "asset/image/love.png",
    "asset/image/motivation.png"
  ];

  void flashScreen() {
    Timer(Duration(seconds: 3), () {
      Get.offNamed('home');
    });
  }

  Home_Model? d1;
  Home_Model? d2;

  List<Home_Model> l1 = [
    Home_Model(
        name: "Love Quotes",
        image: "asset/image2/love.png",
        color: Colors.blueAccent),
    Home_Model(
        name: "Swami Vivekananda Quotes",
        image: "asset/image2/swami.png",
        color: Colors.green),
    Home_Model(
        name: "Albert Einstein Quotes",
        image: "asset/image2/albert.png",
        color: Colors.amber),
    Home_Model(
        name: "Motivation Quotes",
        image: "asset/image2/motivation.png",
        color: Colors.pinkAccent),
  ];

  List<Home_Model> l2=[
    Home_Model(
        name: "Swami Vivekananda Quotes",
        image: "asset/image2/swami.png",
        color: Colors.yellow),
    Home_Model(
        name: "Albert Einstein Quotes",
        image: "asset/image2/albert.png",
        color: Colors.purple),
    Home_Model(
        name: "Helen Keller Quotes",
        image: "asset/image2/helen.jpg",
        color: Colors.brown),
    Home_Model(
        name: "Dr. Seuss",
        image: "asset/image2/dr.jpg",
        color: Colors.deepOrange),
  ];

  List bi=["asset/back_image/joker.png","asset/back_image/love.png","asset/back_image/path.png","asset/back_image/smile.png",];
  List ff=[GoogleFonts.fasthand,GoogleFonts.inconsolata,GoogleFonts.lobster,GoogleFonts.caveatBrush];
  RxInt DropIndex = 0.obs;

// Pick Camera Photo....
}
