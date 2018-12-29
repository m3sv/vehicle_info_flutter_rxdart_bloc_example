
import 'package:vehicle_search/network/api_manager.dart';

final _apiManager = ApiManager();

class Injector {
  Injector._();

  static ApiManager getApiManager(){
    return _apiManager;
  }
}