import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm/ViewModel/get_comment_view.dart';

import '../../ApiServices/api_response.dart';
import '../../Model/Response/get_comments_response_model.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  GetCommentsViewModel getCommentsViewModel = Get.put(GetCommentsViewModel());

  @override
  void initState() {
    getCommentsViewModel.getCommentViewmodel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<GetCommentsViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == Status.COMPLETE) {
              List<CommentResponseModel> data = controller.apiResponse.data;

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 392,
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('postId : ${data[index].postId}'),
                                Text('id : ${data[index].id}'),
                                Text('name : ${data[index].name}'),
                                Text('email : ${data[index].email}'),
                                Text('body : ${data[index].body}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (controller.apiResponse.status == Status.LOADING) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json'),
                ],
              );
            } else if (controller.apiResponse.status == Status.ERROR) {
              return Text('${controller.apiResponse.message}');
            } else {
              return const Text('Something went wrong');
            }
          },
        ),
      ),
    );
  }
}
