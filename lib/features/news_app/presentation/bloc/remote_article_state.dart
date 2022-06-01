part of 'remote_article_bloc.dart';

abstract class RemoteArticleState extends Equatable {
  final List<Article>? article;
  final bool? noMoreData;
  final DioError? error;

  const RemoteArticleState({this.article, this.noMoreData, this.error});
}

class RemoteArticleStateLoading extends RemoteArticleState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RemoteArticleStateDone extends RemoteArticleState {
  const RemoteArticleStateDone(List<Article> article, {bool? noMoreData})
      : super(article: article,noMoreData: noMoreData);
  @override
  List<Object?> get props => [article,noMoreData];
}

class RemoteArticleStateError extends RemoteArticleState {
  const RemoteArticleStateError(DioError? error)
      : super(error: error);
  @override
  List<Object?> get props => [error];
}
