import 'package:JoDija_DataSource/utilis/models/base_data_model.dart';

class CleintDataModel implements  BaseDataModel{

  String name;
  String phone;
  String phoneCard;
  int  price;
  DateTime  startDate;
  DateTime  endDate;
  DateTime? paymentDate;
  String? SepscreptionType ;
  String? sirealNumber;
  String? note;

  CleintDataModel(     {
    this.id ,
    required this.name,
    required this.phone,
    required this.phoneCard,
    required this.price,
    required this.startDate,
    required this.endDate,
    this.paymentDate,
    this.SepscreptionType,
    this.sirealNumber,
    this.note,

  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'phoneCard': phoneCard,
        'price': price,
        'startDate': startDate.toUtc(),
        'endDate': endDate.toUtc(),
        'paymentDate': paymentDate?.toUtc(),
        'serviceType': SepscreptionType,
        'serialNumber': sirealNumber,
        'note': note,

      };

  @override
  String? id;

  @override
  Map<String, dynamic>? map;
  }
