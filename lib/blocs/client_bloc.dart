import 'package:JoDija_DataSource/reposetory/repsatory_http.dart';
import 'package:JoDija_DataSource/source/firebase/crud_firebase_source.dart';
import 'package:JoDija_DataSource/utilis/models/base_data_model.dart';
import 'package:JoDija_DataSource/utilis/models/remote_base_model.dart';
import 'package:JoDija_view/util/data_souce_bloc/base_bloc.dart';
import 'package:JoDija_view/util/data_souce_bloc/remote_base_model.dart';
import 'package:cleints/consts/values/firebase_collections.dart';
import 'package:cleints/data/models/cleint_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientBloc {

  // set singleton
  static final ClientBloc _singleton = ClientBloc._internal();
  factory ClientBloc() {
    return _singleton;
  }
  ClientBloc._internal();

  String nameKey = "name";
  String phoneKey = "phone";
  String phoneCardKey = "phoneCard";
  String priceKey = "price";
  String startDateKey = "startDate";
  String endDateKey = "endDate";
  DataSourceBloc<CleintDataModel> cleintBloc =
      DataSourceBloc<CleintDataModel>();
  DataSourceBloc<List<CleintDataModel>> listCleintBloc =
      DataSourceBloc<List<CleintDataModel>>();

  void addCleint({required Map<String, dynamic> map}) async {
    cleintBloc.loadingState();
    var data = CleintDataModel(
      name: map[nameKey],
      phone: map[phoneKey],
      phoneCard: map[phoneCardKey],
      price: map[priceKey],
      startDate: map[startDateKey],
      endDate: map[endDateKey],
    );

    CRUDrepo repo = CRUDrepo(
        inputSource: DataSourceCRUDFirebaseSource.insert(
            dataModel: data, path: FirebaseCollection.clients));
    var result = await repo.addData();
    result.pick(onData: (v) {
      cleintBloc.successState(data);
    }, onError: (error) {
      cleintBloc.failedState(ErrorStateModel(message: error.message), () {});
    });
  }

  //editCleint
  void editCleint({required Map<String, dynamic> map}) async {
    String id = map['id'];
    cleintBloc.loadingState();
    var data = CleintDataModel(
      id : map['id'],
      name: map[nameKey],
      phone: map[phoneKey],
      phoneCard: map[phoneCardKey],
      price: map[priceKey],
      startDate: map[startDateKey],
      endDate: map[endDateKey],
    );

    CRUDrepo repo = CRUDrepo(
        inputSource: DataSourceCRUDFirebaseSource.edit(
            dataModel: data, path: FirebaseCollection.clients));
    var result = await repo.updateData(id);
    result.pick(onData: (v) {
      cleintBloc.successState(data);
    }, onError: (error) {
      cleintBloc.failedState(ErrorStateModel(message: error.message), () {});
    });
  }

  //deleteCleint
  void deleteCleint(String id ) async {
    cleintBloc.loadingState();
    CRUDrepo repo = CRUDrepo(
        inputSource: DataSourceCRUDFirebaseSource.delete(
              path: FirebaseCollection.clients));
var result = await     repo.deleteData(id);
result.pick( onData: (v) {
      cleintBloc.successState(v);
    }, onError: (error) {
      cleintBloc.failedState(ErrorStateModel(message: error.message), () {});
    });

  }

  //getCleint
  void getCleint() async {
    listCleintBloc.loadingState();
    CRUDrepo repo = CRUDrepo(
        inputSource: DataSourceCRUDFirebaseSource(FirebaseCollection.clients
        , query: (Query query) {
          return query.orderBy(endDateKey, descending: false);
            }
        ));

    var result = await repo.getListData();
    result.pick(onData: (v) {
      List<BaseDataModel> listData = v.data as List<BaseDataModel>;
      List<CleintDataModel> list = [];
      listData.forEach((e) {
 Timestamp stDate = e.map![startDateKey];
 Timestamp enDate = e.map![endDateKey];
         list.add(CleintDataModel(
           id: e.id,
            name: e.map![nameKey],
            phone: e.map![phoneKey],
            phoneCard: e.map![phoneCardKey],
            price: e.map![priceKey],
            startDate: stDate.toDate(),
            endDate:  enDate.toDate()));
      });

      listCleintBloc.successState(list);
    }, onError: (error) {
      listCleintBloc.failedState(ErrorStateModel(message: error.message), () {});
    });
  }

  //getCleints
  void getCleints({required Map<String, dynamic> map}) async {
    cleintBloc.loadingState();
    var data = CleintDataModel(
      name: map[nameKey],
      phone: map[phoneKey],
      phoneCard: map[phoneCardKey],
      price: map[priceKey],
      startDate: map[startDateKey],
      endDate: map[endDateKey],
    );
    cleintBloc.successState(data);
  }
}
