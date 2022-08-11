class SubwayInfo {
  String trainLineNm;
  String recptnDt;
  String arvlMsg2;
  String arvlMsg3;
  String subwayHeading;

  SubwayInfo({
    required this.trainLineNm,
    required this.subwayHeading,
    required this.recptnDt,
    required this.arvlMsg2,
    required this.arvlMsg3,
  });

  factory SubwayInfo.fromJson(Map<String, dynamic> json) => SubwayInfo(
        trainLineNm: json['trainLineNm'],
        subwayHeading: json['subwayHeading'],
        recptnDt: json['recptnDt'],
        arvlMsg2: json['arvlMsg2'],
        arvlMsg3: json['arvlMsg3'],
      );

  @override
  String toString() {
    return 'SubwayInfo{trainLineNm: $trainLineNm, recptnDt: $recptnDt, arvlMsg2: $arvlMsg2, arvlMsg3: $arvlMsg3, subwayHeading: $subwayHeading}';
  }
}
