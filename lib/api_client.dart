import 'package:trabalho_g1/response_data.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

///APIs class is for api tags
class Apis {
  static const String users = '8601346f-7db2-41f5-b300-22e8696426b5';
}
@RestApi(baseUrl: "https://run.mocky.io/v3/")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET(Apis.users)
  Future<ResponseData> getUsers();
}