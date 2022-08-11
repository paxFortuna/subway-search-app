import 'dart:convert';
import '../model/subway_info.dart';
import 'package:http/http.dart' as http;

class SubwayInfoRepository {

  static const baseUrl =
      'http://swopenapi.seoul.go.kr/api/subway/sample/json/realtimeStationArrival/0/5';

  @override
  Future<List<SubwayInfo>> fetchInfo(String stationName) async {
    final url = Uri.parse('$baseUrl/$stationName');
    final response = await http.get(url);
    final jsonResponse = jsonDecode(response.body);

    Iterable itemsJson = jsonResponse['realtimeArrivalList'];
    return itemsJson.map((e) => SubwayInfo.fromJson(e)).toList();
  }
}