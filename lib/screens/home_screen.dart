import 'package:JoDija_view/util/main-screen/project-screen.dart';
import 'package:JoDija_view/util/main-screen/screen-type.dart';
import 'package:JoDija_view/util/widgits/data_source_bloc_widgets/data_source_bloc_consurmer.dart';
import 'package:cleints/data/models/cleint_data_model.dart';
import 'package:cleints/screens/add_cleint_dialog.dart';
import 'package:cleints/screens/widget/input_cleint.dart';
import 'package:cleints/screens/widget/list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../blocs/client_bloc.dart';
import 'add_cleint_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var bloc = ClientBloc();
  initState() {
    bloc.getCleint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ProjectScreenBulder(screenBulder: (context, screenType, h, w) {
      return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.grey,
          elevation: 5,
          title: Center(
            child: Text("الشاشة الرئيسية", style: TextStyle(fontSize: 8.sp)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // set shape to circular
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(200),
          ),
          onPressed: () {
            // Add your onPressed code here!

            screenType == ScreenType.mobile
                ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InputScreen()
                        .animate()
                        .fadeIn(duration: Duration(milliseconds: 500));
                  }))
                : showGeneralDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierLabel: MaterialLocalizations.of(context)
                        .modalBarrierDismissLabel,
                    barrierColor: Colors.black45,
                    transitionDuration: const Duration(milliseconds: 200),
                    pageBuilder: (BuildContext buildContext,
                        Animation animation, Animation secondaryAnimation) {
                      return InputCleintDialog(
                        title: "اضافة عميل ",
                      ).animate().fadeIn(duration: Duration(milliseconds: 500));
                    },
                  ).then((value) {
                    bloc.getCleint();
                  });
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 12.sp,
          ),
        ),
        body: DataSourceBlocConsumer<List<CleintDataModel>>(
          bloc: bloc.listCleintBloc,
          loading: () {
            return CircularProgressIndicator();
          },
          success: (data) {
            return ListView.builder(
                itemCount: data!.length + 1,
                itemBuilder: (context, i) {
                  return i < data.length
                      ? ListItem(
                          id: data[i].id!,
                          name: data[i].name,
                          phone: data[i].phone,
                          phoneCard: data[i].phoneCard,
                          price: data[i].price,
                          startDate: data[i].startDate,
                          endDate: data[i].endDate,
                          screenType: screenType)
                      : SizedBox(
                          height: 100.h,
                        );
                });
          },
          failure: (error, dynamic Function() callback) {
            return Center(
              child: Column(
                children: [
                  Text(error.message),
                  ElevatedButton(onPressed: callback, child: Text("try again"))
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
