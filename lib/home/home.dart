import 'package:depi_bloc/home/home_cubit.dart';
import 'package:depi_bloc/home_details/home_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ['All', 'Politic', 'Sports', 'Education'];
  int curindex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getHomeData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: const Text('HomeScreen'),
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [

              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {

                    bool isSelected = curindex == index;
                    SizedBox(height: 5,);
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          curindex = index;
                        });
                        if (categories[index] == 'All') {
                          context.read<HomeCubit>().getHomeData();
                        } else {
                          context.read<HomeCubit>().getSearchData(
                            query: categories[index],
                          );
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: isSelected ? Colors.amber : Colors.white,
                          border: Border.all(),
                        ),
                        child: Center(child: Text(categories[index])),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(width: 20);
                  },
                  itemCount: categories.length,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('News For You'),
                  Text('Show More',style: TextStyle(color: Colors.blue),),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    if (state is HomeLoading) {
                      return  Center(
                          child: Lottie.asset('assets/lottie/loading (3).json'));
                    }
                    if (state is HomeFailure) {
                      return Center(child: Text(state.msg));
                    }
                    if (state is HomeSucccess) {
                      if (state.data.isEmpty) {
                        return const Center(child: Text('No data found'));
                      }
                      return ListView.separated(
                        itemCount: state.data.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HomeDetails(model: state.data[index]),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      state.data[index].image ??
                                          'https://picsum.photos/id/237/400/400',
                                      errorBuilder: (context, error, stackTrace) {
                                        return const Icon(
                                          Icons.error,
                                          color: Colors.red,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.data[index].author ?? 'No author',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        Text(
                                          state.data[index].description ??
                                              'Description',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Align(
                                          alignment:
                                          AlignmentDirectional.centerEnd,
                                          child: Text(
                                            state.data[index].date ?? 'Date',
                                            textAlign: TextAlign.end,
                                            style: const TextStyle(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}