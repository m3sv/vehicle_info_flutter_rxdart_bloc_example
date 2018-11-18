
import 'package:vehicle_search/network/api_manager.dart';

final apiManager = ApiManager();

class Injector {
  Injector._();

  static ApiManager getApiManager(){
    return apiManager;
  }
}