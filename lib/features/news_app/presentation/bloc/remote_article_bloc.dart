import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/params/article_request.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/entities/article.dart';
import '../../domain/usecases/get_article_usecase.dart';

part 'remote_article_event.dart';

part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;
  final List<Article> _article = [];
  int _page = 1;
  static const int _pageSize = 20;

  RemoteArticleBloc(this._getArticleUseCase)
      : super(RemoteArticleStateLoading()) {
    on<RemoteArticleEvent>((event, emit) async{
      // TODO: implement event handler
      if (event is GetArticles) {
        emit(RemoteArticleStateLoading());
        print("GetArticles");
        emit(await remoteArticleState());
      }
    });
  }

  _get(emit)async{
    RemoteArticleState data = await remoteArticleState();
    emit(data);
  }

  Future<RemoteArticleState> remoteArticleState() async {
    final dataState = await _getArticleUseCase(
        params: ArticleRequestParams(page: _page, pageSize: _pageSize));
    if (dataState is DataSuccess &&
        dataState.data != null &&
        dataState.data!.isNotEmpty) {
      print("success ------------>");
      print(dataState.toString());
      final article = dataState.data;
      _article.addAll(article!);
      _page++;
      return RemoteArticleStateDone(_article,noMoreData: false);
    }
    if(dataState is DataFailed){
      print("failed ------------>");
      print(dataState.error?.message);
      return RemoteArticleStateError(dataState.error);
    }
    return RemoteArticleStateLoading();
  }
}
