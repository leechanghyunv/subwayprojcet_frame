// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class DropdownCustom<T> extends StatefulWidget {
  final dynamic onChanged;
  final T value;

  const DropdownCustom({
    Key? key,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  @override
  State<DropdownCustom> createState() => _DropdownCustomState();
}

class _DropdownCustomState extends State<DropdownCustom> {
  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;/// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;/// 520   ~ 519.68
    double mainBoxWidth = appWidth * 0.915;/// 378.81   ~ 380

    return Container(
      height: appWidth * 0.13,
      width: mainBoxHeight / 5.5,
      color: Colors.black,
      alignment: Alignment.center,
      child: DropdownButton<dynamic>(
          value: widget.value,
          dropdownColor: Colors.black,
          underline: Container(
            alignment: Alignment.center,
            color: Colors.black,
          ),
          icon: SizedBox.shrink(),
          style: const TextStyle(
            color: Colors.white,
          ),
          onChanged: widget.onChanged,
          items: <dynamic>[
            'Line1', 'Line2', 'Line3', 'Line4', 'Line5', 'Line6', 'Line7', 'Line8', 'Line9', '신분당', '수인분당', '경의중앙'
          ].map<DropdownMenuItem<dynamic>>((dynamic value) {
            return DropdownMenuItem<dynamic>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: mainBoxHeight / 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            );
          }).toList()),
    );
  }
}
