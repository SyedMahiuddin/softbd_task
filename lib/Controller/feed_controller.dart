import 'package:get/get.dart';

class FeedController extends GetxController{

  List<String> bengaliMonths = [
    'জানুয়ারি', 'ফেব্রুয়ারি', 'মার্চ', 'এপ্রিল', 'মে', 'জুন',
    'জুলাই', 'আগস্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর'
  ];

  List<String> bengaliNumerals = [
    '০', '১', '২', '৩', '৪', '৫', '৬', '৭', '৮', '৯'
  ];

  List<String> bengaliDays = [
    'রবি',
    'সোম',
    'মঙ্গল',
    'বুধ',
    'বৃহঃ',
    'শুক্র',
    'শনি',
  ];
var selectedDateIndex=7.obs;
  var dates=[].obs;

  @override
  void onInit() {
    dates.value=generateBengaliDateList();
    super.onInit();
  }

  String convertToBengaliDate(DateTime dateTime) {
    String convertToBengaliNumber(int number) {
      String numberStr = number.toString();
      String bengaliNumberStr = '';

      for (int i = 0; i < numberStr.length; i++) {
        bengaliNumberStr += bengaliNumerals[int.parse(numberStr[i])];
      }

      return bengaliNumberStr;
    }

    int day = dateTime.day;
    int month = dateTime.month;

    String bengaliDay = convertToBengaliNumber(day);
    String bengaliMonth = bengaliMonths[month - 1];

    return '$bengaliDay $bengaliMonth';
  }

  List<Map<String, String>> generateBengaliDateList() {
    String convertToBengaliNumber(int number) {
      String numberStr = number.toString();
      String bengaliNumberStr = '';

      for (int i = 0; i < numberStr.length; i++) {
        bengaliNumberStr += bengaliNumerals[int.parse(numberStr[i])];
      }
      return bengaliNumberStr;
    }
    List<Map<String, String>> dateList = [];
    DateTime today = DateTime.now();

    for (int i = -7; i <= 7; i++) {
      DateTime date = today.add(Duration(days: i));
      String dayName = bengaliDays[date.weekday % 7];
      String bengaliDay = convertToBengaliNumber(date.day);
      //String bengaliMonth = convertToBengaliNumber(date.month);
      //String bengaliYear = convertToBengaliNumber(date.year);

      dateList.add({
        'day': dayName,
        'date': bengaliDay,
      });
    }
    return dateList;
  }
}