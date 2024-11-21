import 'package:base/configurations/app_states.dart';
import 'package:base/features/news_search/domain/models/news_model.dart';
import 'package:base/features/news_search/ui/blocs/news_search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/news_card_view.dart';
import '../widgets/news_input_search_field.dart';

class NewsSearchScreen extends StatelessWidget {
  const NewsSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        title: const Text("News Search"),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          //============================== Search Input Field ==============================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NewsSearchInputField(

              onChanged: (value) {
                BlocProvider.of<NewsSearchCubit>(context).searchNews(value);
              },
            ),
          ),
          //============================== News List View ==============================
          Expanded(
            child: BlocBuilder<NewsSearchCubit, AppStates>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is EmptyState) {
                  return const Center(child: Text("No Data Found"));
                } else if (state is ErrorState) {
                  return const Center(child: Text("Something went wrong"));
                }
                else if (state is LoadedState) {
                  var newsList = (state.data);
                  return ListView.builder(
                    itemCount: newsList.length,
                    itemBuilder: (context, index) {
                      return NewsCardView(newsModel: newsList[index]);
                    },
                  );
                }
                else return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }
}