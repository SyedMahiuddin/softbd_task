import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:softbd_task/Repository/feed_repository.dart';

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

  Map<String, String> englishToBengaliDigits = {
      '0': '০',
      '1': '১',
      '2': '২',
      '3': '৩',
      '4': '৪',
      '5': '৫',
      '6': '৬',
      '7': '৭',
      '8': '৮',
      '9': '৯',
      ':': ':',
    };
var selectedDateIndex=7.obs;
var dates=[].obs;
var allStories=[].obs;
var allStoriesWithDate=[].obs;
var fetchingStories=false.obs;

  @override
  void onInit() {
    dates.value=generateBengaliDateList();
    getStories();
    super.onInit();
  }

  Future<void> getStories()async{
    fetchingStories.value=true;
    allStories.clear();
    allStories.value=await FeedRepository().fetchStoryModels();
    formatDateTimes();
    fetchingStories.value=false;
  }

  void formatDateTimes(){
    allStoriesWithDate.value=allStories;
    int i=0;
    for(var story in allStories){
      DateFormat dateFormat = DateFormat('yyyy-MM-dd hh:mm a');
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(story.data[0].date) * 1000);
      String formattedDateTime= dateFormat.format(dateTime);
      String formattedDate = "${dateTime.day}-${dateTime.month}-${dateTime.year}";
      String formattedTime = "${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')} :${dateTime.second.toString().padLeft(2, '0')}";

      allStoriesWithDate[i].data[0].date="${convertTimeToBengali(formattedTime)} $formattedDate ${formattedDateTime.contains("AM")?"সকাল   ":"দুপুর"}";
      i++;
    }
  }

  String convertTimeToBengali(String time) {
    String bengaliTime = time.split('').map((char) {
      if (char == ':') {
        return char; // Keep the colon as is
      }
      int index = int.tryParse(char) ?? -1;
      return index != -1 ? bengaliNumerals[index] : char;
    }).join();

    return bengaliTime;
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