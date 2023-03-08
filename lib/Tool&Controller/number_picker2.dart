// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:dotted_line/dotted_line.dart';

class NumberPickerDialog2 extends StatelessWidget {
  final Function(int) onChanged;
  final Function(int) onChanged2;
  final value;
  final value2;

  const NumberPickerDialog2({
    Key? key,
    required this.onChanged,
    required this.onChanged2, this.value, this.value2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Text(
                      'Line',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                SizedBox(width: 15,),

                Container(
                  child: NumberPicker(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      border: Border.all(color: Colors.black26),
                    ),
                    selectedTextStyle: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                    itemCount: 5,
                    minValue: 0,
                    maxValue: 14,
                    itemHeight: 30,
                    itemWidth: 40,
                    haptics: false,
                    axis: Axis.vertical,
                    value: value,
                    onChanged: onChanged,
                  ),
                ),
                SizedBox(width: 15,),

                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Line',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 15,),

                    Container(
                      child: NumberPicker(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(color: Colors.black26),
                        ),
                        selectedTextStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        itemCount: 5,
                        minValue: 0,
                        maxValue: 14,
                        itemHeight: 30,
                        itemWidth: 40,
                        haptics: false,
                        axis: Axis.vertical,
                        value: value2,
                        onChanged: onChanged2,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

        ]
      ),



    );
  }
}
