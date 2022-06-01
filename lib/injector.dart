import 'package:clean_architecture/features/news_app/data/datasources/remote/news_api_service.dart';
import 'package:clean_architecture/features/news_app/data/repositories/article_repository_impl.dart';
import 'package:clean_architecture/features/news_app/domain/repositories/article_repository.dart';
import 'package:clean_architecture/features/news_app/domain/usecases/get_article_usecase.dart';
import 'package:clean_architecture/features/news_app/presentation/bloc/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;

Future<void> initDependency() async {
  injector.registerSingleton<Dio>(Dio());
  injector.registerSingleton<NewsApiService>(NewsApiService(injector()));
  injector
      .registerSingleton<ArticleRepository>(ArticleRepositoryImpl(injector()));
  injector.registerSingleton<GetArticleUseCase>(GetArticleUseCase(injector()));
  injector.registerSingleton<RemoteArticleBloc>(RemoteArticleBloc(injector()));
}
