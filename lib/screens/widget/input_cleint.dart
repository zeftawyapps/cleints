import 'package:JoDija_view/util/validators/email_validator.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/data_source_bloc_widgets/data_source_bloc_listner.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/dateTime_text_form_field_validation.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:cleints/data/models/cleint_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/client_bloc.dart';
import '../../consts/views/colors.dart';

class InputCleint extends StatefulWidget {
  InputCleint({super.key, this.title, this.data});
  String? title = 'اضافة عميل جديد';
  CleintDataModel? data;
  @override
  State<InputCleint> createState() => _InputCleintState();
}

class _InputCleintState extends State<InputCleint> {
  ValidationsForm form = ValidationsForm();

  TextEditingController nameContraller = TextEditingController();

  TextEditingController phoneContraller = TextEditingController();

  TextEditingController phoneCardContraller = TextEditingController();

  TextEditingController priceContraller = TextEditingController();

  TextEditingController startDateContraller = TextEditingController();

  TextEditingController endDateContraller = TextEditingController();

  ClientBloc clientBloc = ClientBloc();

  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return DataSourceBlocListener<CleintDataModel>(
      loading: () {},
      success: (d) {
        Navigator.pop(context);
      },
      failure: (e, c) {},
      bloc: clientBloc.cleintBloc,
      child: SingleChildScrollView(
        child: form.buildChildrenWithColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            context: context,
            children: [
              SizedBox(
                height: 20.h,
              ),
              widget.title != null
                  ? Text(
                      widget.title!,
                      style: TextStyle(fontSize: 20.sp),
                    )
                  : Container(),
              SizedBox(
                height: 20.h,
              ),
              TextFomrFildValidtion(
                initValue: widget.data?.name ?? null,
                controller: nameContraller,
                form: form,
                baseValidation: [RequiredValidator()],
                keyData: 'name',
                labalText: "اسم العميل",
                decoration: InputDecoration().copyWith(
                  prefixIcon: Icon(
                    Icons.person,
                    color: LightColors.iconColor,
                  ),
                ),
                textStyle: TextStyle(),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFomrFildValidtion(
                initValue: widget.data?.phone ?? null,
                controller: phoneContraller,
                form: form,
                baseValidation: [RequiredValidator()],
                textInputType: TextInputType.phone,
                keyData: 'phone',
                labalText: "رقم الهاتف",
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: LightColors.iconColor,
                  ),
                ),
                textStyle: TextStyle(),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFomrFildValidtion(
                initValue: widget.data?.phoneCard ?? null,
                controller: phoneCardContraller,
                textInputType: TextInputType.phone,
                form: form,
                baseValidation: [RequiredValidator()],
                keyData: 'phoneCard',
                labalText: "رقم الشريحة",
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.file_present_sharp,
                    color: LightColors.iconColor,
                  ),
                ),
                textStyle: TextStyle(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                  height: 100.h,
                  child: Row(
                    children: [
                      Expanded(
                        child: DateTimeTextFieldValidaion(
                          onChange: (v) {
                            print(v);

                            setState(() {
                              endDate = v as DateTime;
                              // startDate = v;
                            });
                          },
                          // initDate: widget.data?.startDate ?? startDate,
                          firestDate:
                              DateTime.now().subtract(Duration(days: 1000)),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                          form: form,
                          baseValidation: [RequiredValidator()],
                          keyData: 'startDate',
                          labalText: "تاريخ البداية",
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: LightColors.iconColor,
                            ),
                          ),
                          textStyle: TextStyle(),
                        ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Expanded(
                        child: DateTimeTextFieldValidaion(
                          onChange: (v) {
                            print(v);

                            setState(() {
                              endDate = v as DateTime;
                            });
                          },
                          initDate: widget.data?.endDate ?? endDate,
                          firestDate: endDate,
                          lastDate: endDate.add(Duration(days: 360)),
                          form: form,
                          baseValidation: [RequiredValidator()],
                          keyData: 'endDate',
                          labalText: "تاريخ النهاية",
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.date_range,
                              color: LightColors.iconColor,
                            ),
                          ),
                          textStyle: TextStyle(),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20.h,
              ),
              TextFomrFildValidtion(
                initValue: widget.data?.price ?? null,
                form: form,
                controller: priceContraller,
                textInputType: TextInputType.number,
                baseValidation: [RequiredValidator()],
                keyData: 'price',
                labalText: "سعر الاشتراك",
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.money,
                    color: LightColors.iconColor,
                  ),
                ),
                textStyle: TextStyle(),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MaterialButton(
                      onPressed: () {
                        var editData = widget.data;
                        if (editData != null) {
                          var data = form.getInputData();
                          data['id'] = editData.id;
                          clientBloc.editCleint(map: data);
                        } else {
                          var data = form.getInputData();
                          clientBloc.addCleint(map: data);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                            decoration: BoxDecoration(
                              color: LightColors.backgroundButtom,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              widget.data == null ? 'اضافة' : 'تعديل',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ))),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                            decoration: BoxDecoration(
                              color: LightColors.backgroundButtom2,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              'الغاء',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.sp),
                            ))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
            ]),
      ),
    );
  }
}
