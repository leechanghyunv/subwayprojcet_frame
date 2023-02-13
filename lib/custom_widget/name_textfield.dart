import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NameTextField extends StatefulWidget {
  final Function(String) onSubmitted;
  final TextEditingController NameController;

  const NameTextField({
    Key? key,
    required this.onSubmitted,
    required this.NameController,
  }) : super(key: key);

  @override
  State<NameTextField> createState() => _NameTextFieldState();
}


class _NameTextFieldState extends State<NameTextField> {

  // @override
  // void dispose() {
  //   widget.NameController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double appHeight = MediaQuery.of(context).size.height;    ///  896.0 IPHONE11
    double appWidth = MediaQuery.of(context).size.width;    /// 414.0 IPHONE11
    double appRatio = MediaQuery.of(context).size.aspectRatio;
    double mainBoxHeight = appHeight * 0.58;    /// 520   ~ 519.68
    double mainBoxWidth = appWidth * 0.915;    /// 378.81   ~ 380

    return Container(
      width: appHeight * 0.2791,
      height: appHeight * 0.07255,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          suffixIcon: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10.0),
              onTap: () {
                widget.NameController.clear();
              },
              child: Icon(
                Icons.clear,
                color: Colors.black,
                size: appHeight * 0.0168,
              ),
            ),
          ),
          labelText: 'Enter your name',
          hintStyle: TextStyle(color: Colors.black),
          hintText: '입력 후 완료버튼을 누르세요',
        ),
        onSubmitted: widget.onSubmitted,
      ),
    );
  }
}
