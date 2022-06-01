import 'package:clean_architecture/core/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';

import '../../models/breaking_news_response_model.dart';

part 'news_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class NewsApiService {
  factory NewsApiService(Dio dio, {String? baseUrl}) = _NewsApiService;

  @GET("/top-headlines")
  Future<HttpResponse<BreakingNewsResponseModel>> getBreakingNewsArticle(
    @Query('apiKey') String apiKey,
    @Query('country') String country,
    @Query("category") String category,
    @Query("page") int page,
    @Query("pageSize") int pageSize,
  );
}
