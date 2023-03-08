
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:numberpicker/numberpicker.dart';

class NumberPickerDialog extends StatelessWidget {

  final Function(int) onChanged;
  final value;

   NumberPickerDialog({
    Key? key,
    required this.onChanged, this.value,
  }) : super(key: key);

  String stringNumber = 'Line2';


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
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
              Container(
                  child: Text(
                    '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
