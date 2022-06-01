
import 'package:clean_architecture/core/params/article_request.dart';
import 'package:clean_architecture/core/resources/data_state.dart';
import 'package:clean_architecture/core/usecases.dart';
import 'package:clean_architecture/features/news_app/domain/entities/article.dart';
import 'package:clean_architecture/features/news_app/domain/repositories/article_repository.dart';

class GetArticleUseCase implements UseCases<DataState<List<Article>>,ArticleRequestParams>{
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<Article>>> call({required ArticleRequestParams params}) {
    // TODO: implement call
   return _articleRepository.getBreakingNewsArticle(params);
  }

}