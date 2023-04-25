import 'package:trabalho_g1/response_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

///APIs class is for api tags
class Apis {
  static const String users = '/character/1,2,3,4,5,6,7,8,9,10';
}
@RestApi(baseUrl: "https://rickandmortyapi.com/api/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<ResponseData> getUsers();
}