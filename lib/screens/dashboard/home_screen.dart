import 'package:flutter/material.dart';
import 'package:flutter_proficiency_task/utils/app_resource/image_resource.dart';
import 'package:flutter_proficiency_task/utils/app_resource/string_resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringRes.appName),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset(
                    ImageRes.placeholderImage,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Title Text",
                      ),
                      Text(
                        "Description Text",
                      )
                    ],
                  ),
                ),
              ]),
            ),
          );
        },
        itemCount: 10,
      ),
    );
  }
}
