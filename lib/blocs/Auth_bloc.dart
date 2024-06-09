import 'package:JoDija_DataSource/https/http_urls.dart';
import 'package:JoDija_DataSource/model/user/base_model/inhertid_models/user_model.dart';
import 'package:JoDija_DataSource/reposetory/user/auth_repo.dart';
import 'package:JoDija_DataSource/source/user/accountLoginLogout/auth_email_source.dart';
import 'package:JoDija_DataSource/utilis/shardeprefrance/shard_check.dart';
import 'package:JoDija_view/util/data_souce_bloc/base_bloc.dart';
import 'package:JoDija_view/util/data_souce_bloc/remote_base_model.dart';





class AuthBloc {
  String emailKey = "email";
  String nameKey = "name";
  String passKey = "pass";
  String phone = "phone";
  String rePass = "rePass";

  DataSourceBloc<UserModule> userBloc =
  DataSourceBloc<UserModule>();

  void signUp({required Map<String, dynamic> map}) async {
    AuthRepo accountSource = AuthRepo(EmailPassowrdAuthSource(email: map[emailKey], pass: map[passKey]));
    userBloc.loadingState();
 var data =    UserModule(name : map[nameKey], email: map[emailKey], phone: map[phone]);
    var result = await accountSource.createAccountAndProfile(data);
    result.pick(onData: (v) {
      SharedPrefranceChecking sharedPrefranceChecking =  SharedPrefranceChecking();
      sharedPrefranceChecking.setDataInShardRefrace(    email: v.email! , pass: map[passKey]!
          , token: v.token!
      );
      HttpHeader().setAuthHeader(v.token! ,Bearer:  "Bearer__");
      userBloc.successState( UserModule.formJson(v.toJson())  )   ;
    }, onError: (error) {
      userBloc.failedState(ErrorStateModel(message: error.message) , () {});
    });

  }

  void signeInAsAdmin({required Map<String, dynamic> map}) async {
    AuthRepo accountSource = AuthRepo(EmailPassowrdAuthSource(email: map[emailKey], pass: map[passKey]));
    userBloc.loadingState();
    var result = await accountSource.logIn();
    result.pick(onData: (v) {
      SharedPrefranceChecking sharedPrefranceChecking =  SharedPrefranceChecking();
      sharedPrefranceChecking.setDataInShardRefrace(    email: v.email! , pass: map[passKey]!
          , token: v.token!
      );
// HttpHeader().setAuthHeader(v.token! ,Bearer:  "Bearer__");
      userBloc.successState( UserModule.formJson(v.toJson())  )   ;
    }, onError: (error) {
      userBloc.failedState(ErrorStateModel(message: error.message) , () {});
    });
  }

}
