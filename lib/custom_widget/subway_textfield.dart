import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class CustomWidget extends StatefulWidget {
  final Function(String) onSubmitted;

  const CustomWidget({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {

  FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  final List<String> _kOptions = <String>[
    '구글본사','로컬스티치약수','로컬스티치을지로',
    '가능',	'개봉',	'관악',	'광명',	'광운대'	'구로',	'구일',	'군포',	'금천구청',	'남영',	'녹양',	'녹천',	'당정',	'대방',	'덕계',	'덕정',	'도봉',	'도원',	'도화',	'독산',	'동두천',	'동두천중앙',	'동암',	'동인천',	'두정',	'망월사',	'명학',	'배방',	'백운',	'병점',	'보산',	'봉명',	'부개',	'부천',	'부평',	'서동탄',	'서정리',	'석수',	'성균관대',	'성환',	'세류',	'세마',	'소사',	'소요산',	'송내',	'송탄',	'수원',	'신이문',	'신창',	'쌍용',	'아산',	'안양',	'양주',	'역곡',	'영등포',	'오류동',	'오산',	'오산대',	'온양온천',	'외대앞',	'용산',	'월계',	'의왕',	'의정부',	'인천',	'제기동',	'제물포',	'종각',	'종로5가',	'주안',	'중동',	'지행',	'직산',	'진위',	'천안',	'청량리',	'탕정',	'평택',	'평택지제',	'화서',	'회기',	'회룡',	'간석',	'시청',	'신도림',	'신설동',	'종로3가',	'금정',	'동대문',	'서울',	'창동',	'방학',	'신길',	'석계',	'가산디지털단지',	'도봉산',	'온수',	'노량진',	'강변',
    '구로디지털단지',	'구의',	'낙성대',	'도림천',	'뚝섬',	'문래',	'방배',	'봉천',	'삼성',	'상왕십리',	'서울대입구',	'서초',	'선릉',	'성수',	'신답',	'신대방',	'신림',	'신정네거리',	'신촌',	'아현',	'양천구청',	'역삼',	'용답',	'용두',	'을지로입구',	'이대',	'잠실나루',	'잠실새내',	'한양대',	'홍대입구',	'교대',	'을지로3가',	'동대문역사문화공원',	'사당',	'까치산',	'영등포구청',	'왕십리',	'을지로4가',	'충정로',	'신당',	'합정',	'건대입구',	'대림',	'잠실',	'당산',	'종합운동장',	'경복궁',	'경찰병원',	'구파발',	'금호',	'남부터미널',	'녹번',	'대곡',	'대청',	'대치',	'대화',	'도곡',	'독립문',	'동대입구',	'마두',	'매봉',	'무악재',	'백석',	'삼송',	'수서',	'신사',	'안국',	'압구정',	'양재',	'옥수',	'원당',	'원흥',	'일원',	'잠원',	'정발산',	'주엽',	'지축',	'학여울',	'홍제',	'화정',	'충무로',	'오금',	'불광',	'약수',	'연신내',	'고속터미널',	'가락시장',	'경마공원',	'고잔',	'과천',	'정부과천청사',	'길음',	'남태령',	'당고개',	'대공원',	'대야미',	'명동',	'미아',	'미아사거리',	'반월',	'범계',
    '별내별가람',	'산본',	'상계',	'상록수',	'선바위'	'성신여대입구',	'수리산',	'수유',	'숙대입구',	'신길온천',	'신용산',	'쌍문',	'안산',	'오남',	'오이도',	'이촌',	'인덕원',	'정왕',	'중앙',	'진접',	'초지',	'평촌',	'한대앞',	'한성대입구',	'혜화',	'회현',	'삼각지',	'노원',	'이수',	'동작',	'강동',	'강일',	'개롱',	'개화산',	'거여',	'고덕',	'광나루',	'광화문',	'굽은다리',	'길동',	'답십리',	'둔촌동',	'마곡',	'마장',	'마천',	'마포',	'명일',	'목동',	'미사',	'발산',	'상일동',	'서대문',	'송정',	'신금호',	'신정',	'아차산',	'애오개',	'양평',	'여의나루',	'오목교',	'우장산',	'장한평',	'하남검단산',	'하남시청',	'하남풍산',	'행당',	'화곡',	'공덕',	'청구',	'군자',	'천호',	'김포공항',	'방이',	'여의도',	'올림픽공원',	'고려대',	'광흥창',	'구산',	'녹사평',	'서강대',	'독바위',	'돌곶이',	'동묘앞',	'디지털미디어시티',	'마포구청',	'망원',	'버티고개',	'보문',	'봉화산',	'상수',	'상월곡',	'새절',	'신내',	'안암',	'역촌',	'월곡',	'월드컵경기장',	'응암',	'이태원',	'증산',	'창신',
    '한강진',	'화랑대',	'효창공원앞',	'태릉입구',	'강남구청','공릉',	'광명사거리',	'굴포천',	'까치울',	'남구로',	'남성',	'내방',	'논현',	'뚝섬유원지',	'마들',	'먹골',	'면목',	'반포',	'보라매',	'부천시청',	'부천종합운동장',	'부평구청',	'사가정',	'산곡',	'삼산체육관',	'상도',	'상동',	'상봉',	'석남',	'수락산',	'숭실대입구',	'신대방삼거리',	'신중동',	'신풍',	'어린이대공원',	'용마산',	'장승배기',	'장암',	'중계',	'중곡',	'중화',	'천왕',	'철산',	'청담',	'춘의',	'하계',	'학동',	'강동구청',	'남위례',	'남한산성입구',	'단대오거리',	'모란',	'몽촌토성',	'문정',	'복정',	'산성',	'송파',	'수진',	'신흥',	'암사',	'장지',	'석촌',	'가양',	'개화',	'공항시장',	'구반포',	'국회의사당',	'노들',	'둔촌오륜',	'등촌',	'마곡나루',	'봉은사',	'사평',	'삼성중앙',	'삼전',	'샛강',	'석촌고분',	'선유도',	'선정릉',	'송파나루',	'신논현',	'신목동',	'신반포',	'신방화',	'양천향교',	'언주',	'염창',	'중앙보훈병원',	'증미',	'한성백제',	'흑석',	'강남',
  ];

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58; /// 520   ~ 519.68
    double mainBoxWidth = appWidth * 0.915; /// 378.81   ~ 380

    return Container(
      width: appHeight * 0.2791,
      height: appHeight * 0.07255,
      child:

      Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          }
          return _kOptions.where((String option) {
            return option.contains(textEditingValue.text.toLowerCase());
          });
        },
        onSelected: (String selection) {
          debugPrint('You just selected $selection');
        },
        fieldViewBuilder:
            (context, _controller, focusNode, onFieldSubmitted) {
          return TextField(
            controller: _controller,
            focusNode: _focusNode,
            onEditingComplete: onFieldSubmitted,
            decoration: InputDecoration(
                hintText: '입력 후 완료버튼을 누르세요',
                labelText: 'Enter Destination',
                hintStyle: TextStyle(color: Colors.black),

                /// 'Enter Destination'
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(
                  Icons.subway,
                  color: Colors.black,
                ),
                suffixIcon: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {
                      _controller.clear();
                    },
                    child: Icon(
                      Icons.clear,
                      color: Colors.black,
                      size: appHeight * 0.0168,
                    ),
                  ),
                ),
            ),
            onSubmitted: widget.onSubmitted,
          );
        },
      ),
    );
  }
}
