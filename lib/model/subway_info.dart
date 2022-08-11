class SubwayInfo {
  String trainLineNm;
  String recptnDt;
  String arvlMsg2;
  String arvlMsg3;
  String subwayHeading;

  SubwayInfo({
    required this.trainLineNm,
    required this.recptnDt,
    required this.arvlMsg2,
    required this.arvlMsg3,
    required this.subwayHeading,
  });

  factory SubwayInfo.fromJson(Map<String, dynamic> json) => SubwayInfo(
        trainLineNm: json['trainLineNm'],
        recptnDt: json['recptnDt'],
        arvlMsg2: json['arvlMsg2'],
        arvlMsg3: json['arvlMsg3'],
        subwayHeading: json['subwayHeading'],
      );

  @override
  String toString() {
    return 'SubwayInfo{trainLineNm: $trainLineNm, recptnDt: $recptnDt, arvlMsg2: $arvlMsg2, arvlMsg3: $arvlMsg3, subwayHeading: $subwayHeading}';
  }
}
