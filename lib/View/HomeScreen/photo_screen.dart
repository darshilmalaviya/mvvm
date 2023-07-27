import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm/ApiServices/api_response.dart';
import 'package:mvvm/Model/Response/get_photos_response_model.dart';
import 'package:mvvm/ViewModel/get_photos_view.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({super.key});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  GetPhotosViewModel getPhotosViewModel = Get.put(GetPhotosViewModel());

  @override
  void initState() {
    getPhotosViewModel.getPhotosViewModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<GetPhotosViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == Status.COMPLETE) {
              List<PhotosResponseModel> data = controller.apiResponse.data;

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
                                Text('albumId : ${data[index].albumId}'),
                                Text('id : ${data[index].id}'),
                                Text('title : ${data[index].title}'),
                                Image.network("${data[index].url}"),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: Image.network(
                                        "${data[index].thumbnailUrl}"),
                                  ),
                                ),
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
