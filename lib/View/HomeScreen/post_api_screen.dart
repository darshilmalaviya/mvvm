import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/ApiServices/api_response.dart';
import 'package:mvvm/ViewModel/get_post_api_view.dart';

class PostApi extends StatefulWidget {
  const PostApi({super.key});

  @override
  State<PostApi> createState() => _PostApiState();
}

class _PostApiState extends State<PostApi> {
  GetPostApiView getPostApiView = Get.put(GetPostApiView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GetPostApiView>(
        builder: (controller) {
          if (controller.apiResponse.status == Status.COMPLETE ||
              controller.apiResponse.status == Status.INITIAL) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ElevatedButton(
                      onPressed: () async {
                        await controller.getPostApiViewmodel(
                          body: {
                            'title': 'demo',
                            'body': 'nothing',
                            'userId': "112",
                          },
                        );

                        if (controller.apiResponse.status == Status.COMPLETE) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Get success'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Something went wrong"),
                            ),
                          );
                        }
                      },
                      child: const Text('Add')),
                ),
              ],
            );
          } else if (controller.apiResponse.status == Status.LOADING) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.apiResponse.status == Status.ERROR) {
            return Text('${controller.apiResponse.message}');
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
