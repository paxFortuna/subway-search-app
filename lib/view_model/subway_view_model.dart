import 'package:flutter/material.dart';

import '../model/subway_info.dart';
import '../repository/subway_info_repository.dart';

class SubwayInfoViewModel extends ChangeNotifier {
  final _subwayInfoApi = SubwayInfoRepository();
  List<SubwayInfo> subwayInfos = [];

  void fetchSubwayInfo(String query) async {
    subwayInfos = await _subwayInfoApi.fetchSubwayInfo(query);
    notifyListeners();
  }
}