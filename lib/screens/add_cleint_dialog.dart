import 'package:cleints/consts/views/colors.dart';
import 'package:cleints/data/models/cleint_data_model.dart';
import 'package:cleints/screens/widget/input_cleint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InputCleintDialog extends StatelessWidget {
    InputCleintDialog({super.key , this.data , this.title});
CleintDataModel? data;
String? title = 'اضافة عميل جديد';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        child: InputCleint(title: "$title",data: data,),
      ),
    );
  }
}
