import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subway_info/view_model/subway_view_model.dart';

import '../model/subway_info.dart';
import '../repository/subway_info_repository.dart';

class SubwayInfoScreen extends StatefulWidget {
  const SubwayInfoScreen({Key? key}) : super(key: key);

  @override
  State<SubwayInfoScreen> createState() => _SubwayInfoScreenState();
}

class _SubwayInfoScreenState extends State<SubwayInfoScreen> {
  final _repository = SubwayInfoRepository();
  final _textController = TextEditingController();
  List<SubwayInfo> _subwayInfos = [];

  Timer? _debounce;
  _onSearchChanged(String? query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      print(_textController.text);
    });
  }

  @override
  void initState() {

    super.initState();
    _repository.fetchSubwayInfo("문래").then((value) {
      setState(() {
        _subwayInfos = value;
      });
    });
      // Future.delayed(Duration.zero, (){
      //   final viewModel = context.read<SubwayInfoViewModel>();
      //   viewModel.fetchSubwayInfo('문래');
      //}
      //);
  }


  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  OutlineInputBorder _genOutLineInputer() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.secondary,
        width: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final subwayViewModel = context.watch<SubwayInfoViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('실시간 지하철 정보 앱'),
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              onChanged: _onSearchChanged(_textController.text),
              decoration: InputDecoration(
                enabledBorder: _genOutLineInputer(),
                // TextField height 설정과 borderLine 유지하기
                contentPadding: const EdgeInsets.fromLTRB(12.0, 0.1, 0.0, 0.1),
                focusedBorder: _genOutLineInputer(),
                suffixIcon: InkWell(
                  onTap: ()  async{
                    // 키보드 닫기 이벤트 처리
                    FocusManager.instance.primaryFocus?.unfocus();
                    _subwayInfos =
                    await _repository.fetchSubwayInfo(_textController.text);
                    _textController.clear();
                    setState(() {});
                    //provider viewModel error check
                    //subwayViewModel.fetchSubwayInfo(_textController.text);
                  },
                  child: const Icon(Icons.search),
                ),
                hintText: '검색어를 입력하세요',
              ),
            ),
            const SizedBox(height: 20),
            // SingleChildScrollView(child: _subwayImage()),
            Expanded(
              child: ListView.separated(
                itemCount: _subwayInfos.length,
                itemBuilder: (BuildContext context, int index) {
                  SubwayInfo subwayInfo = _subwayInfos[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text('열차명: ${subwayInfo.trainLineNm}'),
                        const SizedBox(height: 10),
                        Text('내리실 문: ${subwayInfo.subwayHeading}'),
                        const SizedBox(height: 10),
                        Text('현재위치: ${subwayInfo.arvlMsg2}'),
                        const SizedBox(height: 10),
                        Text('종착역: ${subwayInfo.arvlMsg3}'),
                        const SizedBox(height: 15),
                        Text('현재시각: ${subwayInfo.recptnDt}'),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
