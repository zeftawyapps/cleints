import 'package:JoDija_view/util/validators/email_validator.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:cleints/consts/views/colors.dart';
import 'package:cleints/data/models/cleint_data_model.dart';
import 'package:cleints/screens/widget/input_cleint.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InputScreen extends StatefulWidget {
   InputScreen({super.key , this.data});
CleintDataModel? data;
  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget .  data == null ? 'اضافة عميل جديد' : "تعديل عمليل " ,style: TextStyle(color: Colors.white),)),
      ),
      body:   Container(
            child: Center(child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
                child: InputCleint(data:  widget.data ,)))),
      );
  }
}
