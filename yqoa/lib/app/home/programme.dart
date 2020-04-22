import 'package:flutter/material.dart';

class Programme extends StatelessWidget {
  final ProgrammeViewModel data;

  const Programme({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Stack(
              fit: StackFit.passthrough,
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                Image.network(
                  this.data.coverImgUrl,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      Helper.numFormat(this.data.playsCount),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    )
                  ),
                ),
              ].where((item) => item != null).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class Helper {
  static String numFormat(int num) {
    if (num / 10000 < 1) {
      return 'num';
    } else if (num / 100000000 < 1) {
      return '${num ~/ 10000}万';
    } else {
      return '${num ~/ 100000000}亿';
    }
  }
}

class ProgrammeViewModel {
  /// 节目名称
  final String title;

  /// 播放量
  final int playsCount;

  /// 封面图地址
  final String coverImgUrl;

  /// 是否需要vip才能观看
  final bool needVip;

  const ProgrammeViewModel({
    this.title,
    this.playsCount,
    this.coverImgUrl,
    this.needVip,
  });
}
