import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_proficiency_task/utils/app_resource/image_resource.dart';

import '../../bloc/home_bloc/home_bloc.dart';
import '../../model/home_model.dart';
import '../../utils/app_resource/string_resources.dart';
import '../../utils/common_search_textfield.dart';
import '../../utils/custom_cache_network_image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeResponse homeResponse;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    context.read<HomeBloc>().add(GetHomeData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (BuildContext context, state) {
        if (state is HomeFailure) {
          return Scaffold(
            body: Center(
                child: Text(
              state.message,
              style: const TextStyle(
                fontSize: 16,
              ),
            )),
          );
        }
        if (state is HomeSuccess) {
          homeResponse = state.homeResponse;
          return Scaffold(
            appBar: AppBar(
              title: Text(homeResponse.title.toString()),
            ),
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                SearchTextField(
                  text: StringRes.search,
                  controller: controller,
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10, top: 5, bottom: 5),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 70,
                                  width: 70,
                                  child: CustomNetworkImage(
                                    placeholderWidget:
                                        Image.asset(ImageRes.placeholderImage),
                                    imageUrl: homeResponse.rows[index].imageHref
                                        .toString(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        homeResponse.rows[index].title ??
                                            StringRes.noTitle,
                                      ),
                                      Text(
                                        homeResponse.rows[index].description ??
                                            StringRes.noDescription,
                                      )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      );
                    },
                    itemCount: homeResponse.rows.length,
                  ),
                ),
              ],
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
