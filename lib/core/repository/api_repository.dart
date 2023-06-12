import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../constants.dart';
import '../models/categories.dart';
import '../models/dishes.dart';

part 'api_repository.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class ApiRepository {
  factory ApiRepository(Dio dio) = _ApiRepository;

  @GET('/v3/058729bd-1402-4578-88de-265481fd7d54')
  Future<Categories> getCategories();

  @GET('/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b')
  Future<Dishes> getDishes();
}
