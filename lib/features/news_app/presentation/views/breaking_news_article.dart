import 'package:clean_architecture/features/news_app/presentation/bloc/remote_article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../domain/entities/article.dart';

class BreakingNewsArticleView extends HookWidget {
  const BreakingNewsArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    useEffect(() {
      scrollController
          .addListener(() => _onScrollListener(context, scrollController));
    });
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Articles"),
      ),
      body: _buildBody(scrollController),
    );
  }

  void _onScrollListener(
      BuildContext context, ScrollController scrollController) {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;
    final remoteArticleBloc = BlocProvider.of<RemoteArticleBloc>(context);
    if (currentScroll == maxScroll) {
      remoteArticleBloc.add(GetArticles());
    }
  }

  _buildBody(ScrollController scrollController) {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (_, state) {
      if (state is RemoteArticleStateError) {
        return Center(child: Text("${state.error?.message}"));
      }
      if (state is RemoteArticleStateLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is RemoteArticleStateDone) {
        print(state.article?.length);
        return _buildArticle(
            scrollController, state.article ?? [], state.noMoreData ?? false);
      }
      return const SizedBox();
    });
  }

  _buildArticle(
      ScrollController controller, List<Article> article, bool noMoreData) {
    return ListView.builder(
      controller: controller,
      itemBuilder: (_, index) {
        return ListTile(
          leading: Text("$index"),
          title: Text("${article[index].title}"),
        );
      },
      itemCount: article.length,
    );
  }
}
