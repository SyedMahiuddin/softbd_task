import 'package:get/get.dart';

class ViewController extends GetxController{
  var pageIndex=0.obs;

  List<Map<String, dynamic>> categories = [
    {
      'iconImage': 'assets/icons/catIcons/group.png',
      'name': 'মেনু নং',
      'serial': '০০০০১',
    },
    {
      'iconImage': 'assets/icons/catIcons/building.png',
      'name': 'মেনু নং',
      'serial': '০০০০১',
    },
    {
      'iconImage': 'assets/icons/catIcons/disability.png',
      'name': 'মেনু নং',
      'serial': '০০০০১',
    },
    {
      'iconImage': 'assets/icons/catIcons/school.png',
      'name': 'মেনু নং',
      'serial': '০০০০১',
    },
    {
      'iconImage': 'assets/icons/catIcons/note.png',
      'name': 'মেনু নং',
      'serial': '০০০০১',
    },
    {
      'iconImage': 'assets/icons/catIcons/code.png',
      'name': 'মেনু নং',
      'serial': '০০০০১',
    },
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}