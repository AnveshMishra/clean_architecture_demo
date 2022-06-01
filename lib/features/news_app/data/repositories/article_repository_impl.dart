import 'dart:io';

import 'package:clean_architecture/core/params/article_request.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/features/news_app/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture/features/news_app/domain/entities/article.dart';
import 'package:clean_architecture/features/news_app/domain/repositories/article_repository.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart' as dio;

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<Article>>> getBreakingNewsArticle(
      ArticleRequestParams params) async {
    try {
      final response = await _newsApiService.getBreakingNewsArticle(
          params.apiKey,
          params.country,
          params.category,
          params.page,
          params.pageSize);
      DioError error = _getDioErrorObject(response);

      if (response.response.statusCode == HttpStatus.ok) {
        if (response.data.articles != null) {
          return DataSuccess(response.data.articles!);
        } else {
          return DataFailed(error);
        }
      } else {
        return DataFailed(error);
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  DioError _getDioErrorObject(dio.HttpResponse response) {
    return DioError(
      requestOptions: response.response.requestOptions,
      error: response.response.statusMessage ?? "Something went wrong",
      response: response.response,
      type: DioErrorType.response,
    );
  }
}
