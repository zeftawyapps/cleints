import 'package:JoDija_view/util/functions/date_time.dart';
import 'package:JoDija_view/util/functions/launchers.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:cleints/consts/views/assets.dart';
import 'package:cleints/data/models/cleint_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/client_bloc.dart';
import '../add_cleint_dialog.dart';
import '../add_cleint_screen.dart';

class ListItem extends StatelessWidget {
  ListItem({
    super.key,
    required this.id,
    required this.name,
    required this.phone,
    required this.phoneCard,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.screenType,
  });

  String id;

  String name;
  String phone;
  String phoneCard;
  int price;
  DateTime startDate;
  DateTime endDate;
  ScreenType screenType = ScreenType.web;
  late CleintDataModel dataModel;
  int titlefontSize = 8;
  int datafontSize = 7;
  @override
  Widget build(BuildContext context) {
    return screenType == ScreenType.web
        ? listweb(context)
        : listMobile(context);
  }

  Widget listweb(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [
                lastDateStatus(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("الاسم:",
                                style: TextStyle(
                                    fontSize: titlefontSize.sp,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(name,
                                style: TextStyle(
                                    fontSize: datafontSize.sp,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
                Row(
                  children: [
                    // phone and phoneCard
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("الهاتف:",
                                style: TextStyle(
                                    fontSize: titlefontSize.sp,
                                    color: Colors.grey[800])),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(phone,
                                  style: TextStyle(fontSize: datafontSize.sp))),
                        ],
                      ),
                    ),

                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("رقم الشريحة:",
                                style: TextStyle(
                                    fontSize: titlefontSize.sp,
                                    color: Colors.grey[800])),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(phoneCard,
                                  style: TextStyle(fontSize: datafontSize.sp))),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("تاريخ البداية:",
                                style: TextStyle(
                                    fontSize: titlefontSize.sp,
                                    color: Colors.grey[800])),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(startDate.toStringFormat(),
                                style: TextStyle(fontSize: datafontSize.sp)),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("تاريخ النهاية:",
                                style: TextStyle(
                                    fontSize: titlefontSize.sp,
                                    color: Colors.grey[800])),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(endDate.toStringFormat(),
                                style: TextStyle(fontSize: datafontSize.sp)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("السعر:",
                                style: TextStyle(
                                    fontSize: titlefontSize.sp,
                                    color: Colors.grey[800])),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(price.toString(),
                                  style: TextStyle(fontSize: datafontSize.sp))),
                        ],
                      ),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  editOnWeb(context);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 10.sp,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  delete(context);
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 10.sp,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  sendWhatsapp();
                },
                child: Image(
                  image: AssetImage(AppAsset.whatsapp),
                  width: 10.sp,
                  height: 10.sp,
                  color: Colors.green,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  Widget listMobile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [
                lastDateStatus(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text("الاسم:",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold)),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(name,
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    // phone and phoneCard
                    Expanded(
                      child: Text("الهاتف:",
                          style: TextStyle(
                              fontSize: 14.sp, color: Colors.grey[800])),
                    ),

                    Expanded(
                        flex: 2,
                        child: Text(phone, style: TextStyle(fontSize: 12.sp))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text("رقم الشريحة:",
                          style: TextStyle(
                              fontSize: 14.sp, color: Colors.grey[800])),
                    ),
                    Expanded(
                        flex: 2,
                        child:
                            Text(phoneCard, style: TextStyle(fontSize: 12.sp))),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text("تاريخ البداية:",
                          style: TextStyle(
                              fontSize: 14.sp, color: Colors.grey[800])),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(startDate.toStringFormat(),
                          style: TextStyle(fontSize: 12.sp)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text("تاريخ النهاية:",
                          style: TextStyle(
                              fontSize: 14.sp, color: Colors.grey[800])),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(endDate.toStringFormat(),
                          style: TextStyle(fontSize: 12.sp)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text("السعر:",
                          style: TextStyle(
                              fontSize: 14.sp, color: Colors.grey[800])),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(price.toString(),
                            style: TextStyle(fontSize: 12.sp))),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            children: [
              MaterialButton(
                onPressed: () {
                  editOnMobile(context);
                },
                child: Icon(
                  Icons.edit,
                  color: Colors.blue,
                  size: 10.sp,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  delete(context);
                },
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 10.sp,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  sendWhatsapp();
                },
                child: Icon(
                  Icons.send,
                  color: Colors.green,
                  size: 10.sp,
                )
              ),
            ],
          ))
        ],
      ),
    );
  }

  String massage() {
    /*
    * مرحبا
نفيدك بأنه تم الاقتراب  استنفاد من رصيد النت لباقتك

يمكنك الاشتراك بأحد باقات نت أعمال  والتي تقدم الكثير من المميزات من خلال موقعنا https://salla.sa/zwq-wkyef
يومك سعيد
    * */
    return "مرحبا نفيدك بأنه تم الاقتراب  استنفاد من رصيد النت لباقتك يمكنك الاشتراك بأحد باقات نت أعمال  والتي تقدم الكثير من المميزات من خلال موقعنا https://salla.sa/zwq-wkyef يومك سعيد";
  }

  void sendWhatsapp() {
    LaunchUrl.sendWhatsapp("+966", phone, massage());
  }

  void delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("هل تريد حذف هذا العميل"),
            actions: [
              TextButton(
                  onPressed: () {
                    ClientBloc().deleteCleint(id);
                    Navigator.pop(context);
                  },
                  child: Text("نعم")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("لا")),
            ],
          );
        }).then((value) {
      ClientBloc().getCleint();
    });
  }

  void editOnMobile(BuildContext context) {
    dataModel = CleintDataModel(
      id: id,
      name: name,
      phone: phone,
      phoneCard: phoneCard,
      price: price,
      startDate: startDate,
      endDate: endDate,
    );
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return InputScreen(
        data: dataModel,
      ).animate().fadeIn(duration: Duration(milliseconds: 500));
    })).then((value) {
      ClientBloc().getCleint();
    });
  }

  void editOnWeb(BuildContext context) {
    dataModel = CleintDataModel(
      id: id,
      name: name,
      phone: phone,
      phoneCard: phoneCard,
      price: price,
      startDate: startDate,
      endDate: endDate,
    );
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return InputCleintDialog(
          title: "تعديل عميل ",
          data: dataModel,
        ).animate().fadeIn(duration: Duration(milliseconds: 500));
      },
    ).then((value) {
      ClientBloc().getCleint();
    });
  }

  Widget  lastDateStatus() {
    int days = endDate.Daydifference( );
    switch (days) {
      case > 60:
        return  Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("باقي على انتهاء الباقة اكثر من شهرين",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
      case > 30 && < 60:
        return  Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.green[500],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("باقي على انتهاء الباقة اكثر من شهر",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
      case > 15 && < 30:
        return  Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.orange[600],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("باقي على انتهاء الباقة اكثر من نصف شهر",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
      case > 7 && < 15:
        return  Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.orange[700],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("باقي على انتهاء الباقة اكثر من اسبوع",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
      case > 3 && < 7:
        return  Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("باقي على انتهاء الباقة اكثر من 3 ايام",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
      case > 1 && < 3:
        return  Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.red[700],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("باقي على انتهاء الباقة اكثر من يومين",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
      case < 1:
        return  Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.red[900],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("لقد انتهت الباقة",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
      default:
        return  Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text("باقي على انتهاء الباقة اكثر من شهرين",
              style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)));
    }
  }
}
