import 'package:JoDija_view/util/validators/email_validator.dart';
import 'package:JoDija_view/util/validators/required_validator.dart';
import 'package:JoDija_view/util/widgits/bloc_provider.dart';
import 'package:JoDija_view/util/widgits/data_source_bloc_widgets/data_source_bloc_listner.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/form_validations.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/dateTime_text_form_field_validation.dart';
import 'package:JoDija_view/util/widgits/input_form_validation/widgets/text_form_vlidation.dart';
import 'package:cleints/data/models/cleint_data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
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
  TextEditingController serialNumberContraller = TextEditingController();
  TextEditingController paymentDateContraller = TextEditingController();
  TextEditingController typeOfSubscriptionContraller = TextEditingController();
  TextEditingController noteContraller = TextEditingController();

  ClientBloc clientBloc = ClientBloc();

  DateTime endDate = DateTime.now();
  DateTime startDate = DateTime.now();
  DateTime paymentDate = DateTime.now();
  String? name, phone, phoneCard;
  String? serialNumber;

  String? typeOfSubscription;
  String? note;

  @override
  void initState() {
    name = widget.data?.name;
    phone = widget.data?.phone;
    phoneCard = widget.data?.phoneCard;
    serialNumber = widget.data?.sirealNumber;
    typeOfSubscription = widget.data?.SepscreptionType;
    note = widget.data?.note;

    // TODO: implement initState
    super.initState();
  }

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
                initValue: name ?? null,
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
                initValue: phone ?? null,
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
                initValue: phoneCard ?? null,
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
              TextFomrFildValidtion(
                initValue: serialNumber ?? "",
                form: form,
                controller: serialNumberContraller,
                textInputType: TextInputType.number,
                baseValidation: [RequiredValidator()],
                keyData: 'serialNumber',
                labalText: " الرقم التسلسلي ",
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
              DateTimeTextFieldValidaion(
                onChange: (v) {
                  print(v);

                  setState(() {
                    paymentDate = v as DateTime;
                  });
                },
                initDate: widget.data?.paymentDate ?? paymentDate,
                firestDate: paymentDate,
                lastDate: endDate.add(Duration(days: 360)),
                form: form,
                baseValidation: [RequiredValidator()],
                keyData: 'paymentDate',
                labalText: "تاريخ  السداد",
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.date_range,
                    color: LightColors.iconColor,
                  ),
                ),
                textStyle: TextStyle(),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFomrFildValidtion(
                initValue: typeOfSubscription ?? "",
                controller: typeOfSubscriptionContraller,
                form: form,
                baseValidation: [RequiredValidator()],
                keyData: 'serviceType',
                labalText: "نوع الاشتراك",
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
                initValue: note ?? "",
                controller: noteContraller,
                form: form,
                baseValidation: [],
                keyData: 'note',
                labalText: "ملاحظات",
                mulitLine: 3,
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

                          bool chick = clientBloc.checkSerialNumberEdit(
                              data['serialNumber'].toString(), data['id']);
                          if (chick) {
                            // alarm  dialog
                            showDialog(context: context, builder:
                            (context){
                              return AlertDialog(
                                title: Text('تحذير'),
                                content: Text('الرقم التسلسلي موجود بالفعل'),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('موافق'))
                                ],
                              );
                            }
                            );

                            return;
                          }
                          clientBloc.editCleint(map: data);
                        } else {
                          var data = form.getInputData();
                          bool chick = clientBloc.checkSerialNumber(
                              data['serialNumber'].toString());
                          if (chick) {
                            showDialog(context: context, builder:
                                (context){
                              return AlertDialog(
                                title: Text('تحذير'),
                                content: Text('الرقم التسلسلي موجود بالفعل'),
                                actions: [
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text('موافق'))
                                ],
                              );
                            }
                            );
                            return;
                          }

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
