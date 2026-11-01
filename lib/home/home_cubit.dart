

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/article_model.dart';



part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final dio = Dio();
  Future<void>getHomeData() async{

    try{
      emit(HomeLoading());
     final Response response =
    await dio.get("https://newsapi.org/v2/top-headlines",
        queryParameters:{
      'apiKey':'6cfb10f790934afe8ae4cf35fe745ebf',
      'country':'us'
    });
     final article =response.data['articles'] as List;
    final data = article.map((e) => ArticleModel.fromJson(e)).toList();
     emit(HomeSucccess(data));
  } on DioException catch(e){
      emit(HomeFailure(e.message ?? 'dio exception'));
    }catch(e){
      emit(HomeFailure(e.toString()));
    }
  }
 Future<void>getSearchData({required String query})async{
    try{
      emit(HomeLoading());

      final Response response = await dio.get('https://newsapi.org/v2/everything',
      queryParameters: {
        'q':query,
        'apiKey':'6cfb10f790934afe8ae4cf35fe745ebf'});
     final articles =  response.data['articles'] as List;
     final data = articles.map((e) => ArticleModel.fromJson(e),).toList();
     emit(HomeSucccess(data));
    }on DioException catch(e){
      emit(HomeFailure(e.message ??'DioExp'));
    }catch(e){
      emit(HomeFailure(e.toString()));
    }
 }

}
