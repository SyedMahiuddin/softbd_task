import '../models/story_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class FeedRepository{
static const String url="https://api.npoint.io/bc69ae1f6991da81ab9a";
Future<List<StoryModel>> fetchStoryModels() async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((data) => StoryModel.fromJson({"data": [data]})).toList();
    } else {
      throw Exception('Failed to load stories');
    }
  } catch (e) {
    print('Error: $e');
    throw Exception('Failed to load stories due to an error');
  }
}
}