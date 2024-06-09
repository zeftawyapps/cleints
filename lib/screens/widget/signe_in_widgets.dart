import 'package:JoDija_view/util/validators/email_validator.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:JoDija_view/util/widgits/screen_bloc_provider/screen_notfier.dart';
import 'package:JoDija_view/util/widgits/screen_provider/screen_notfier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../consts/views/colors.dart';

class SigneInWidgets extends StatefulWidget {
  SigneInWidgets(
      {super.key,
      required this.title,
      required this.emaalHint,
      required this.passwordHint,
      required this.signeInButton,
      required this.signeInButtonLoading,
      required this.decoration,
      required this.submit,
       this.isloading = false,
             }) ;

  Widget title;
  String emaalHint = "Email";
  String passwordHint = "Password";
  Widget signeInButton = Container();
  Widget signeInButtonLoading = Container();
  InputDecoration decoration;

  bool isloading = false;

  // call back to get the value of the drop down
  var submit;

  @override
  State<SigneInWidgets> createState() => _SigneInWidgetsState();
}

class _SigneInWidgetsState extends State<SigneInWidgets> {
  ValidationsForm form = ValidationsForm();
  bool isloading = false;
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    isloading = widget.isloading;
    return Column(
      children: [
        widget.title,
        SizedBox(
          height: 5.h,
        ),
        form.buildChildrenWithColumn(context: context, children: [
          TextFomrFildValidtion(
            form: form,
            baseValidation: [EmailValidator(), RequiredValidator()],
            decoration: widget.decoration.copyWith(
                prefixIcon: Icon(Icons.email,color: LightColors.iconColor, )),
            textStyle: TextStyle(color: LightColors.textFieldsFont , fontSize: 8.sp),
            labalText: widget.emaalHint,
            keyData: "email",
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFomrFildValidtion(
            form: form,
            baseValidation: [RequiredValidator()],
            decoration: widget.decoration.copyWith(
                prefixIcon:
                    Icon(Icons.lock, color: LightColors.iconColor ), // see password
                suffixIcon: IconButton(
                    icon: Icon(
                      isPassword
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: LightColors.iconColor ,
                    ),
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    })),
            textStyle: TextStyle(color:   LightColors.textFieldsFont , fontSize: 8.sp),
            labalText: widget.passwordHint,
             keyData: "pass",
            isPssword: isPassword,
          ),
          SizedBox(
            height: 25.h,
          ),
          MaterialButton(
            onPressed: () {
              if (isloading) {
                return;
              }

              if (form.form.currentState!.validate()) {
                form.form.currentState!.save();
                var data = form.getInputData();


                widget.submit(data["email"], data["pass"]);
              }
            },
            child:
                isloading ? widget.signeInButtonLoading : widget.signeInButton,
          ),
        ])
      ],
    );
  }
}
