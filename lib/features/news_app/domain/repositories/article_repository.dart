import 'package:clean_architecture/core/params/article_request.dart';
import 'package:clean_architecture/features/news_app/domain/entities/article.dart';

import '../../../../core/resources/data_state.dart';

abstract class ArticleRepository {
  Future<DataState<List<Article>>> getBreakingNewsArticle(
      ArticleRequestParams params);
}
