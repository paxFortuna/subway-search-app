import 'dart:convert';
import '../model/subway_info.dart';
import 'package:http/http.dart' as http;

class SubwayInfoRepository {

  static const baseUrl =
      'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5';

  Future<List<SubwayInfo>> fetchSubwayInfo(String query) async {
    final url = Uri.parse('$baseUrl/$query');
    final response = await http.get(url);
    final jsonResponse = jsonDecode(response.body);

    Iterable itemsJson = jsonResponse['realtimeArrivalList'];
    return itemsJson.map((e) => SubwayInfo.fromJson(e)).toList();
  }
}