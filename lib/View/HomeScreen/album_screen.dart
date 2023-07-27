import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm/ApiServices/api_response.dart';
import 'package:mvvm/Model/Response/get_albums_response_model.dart';
import 'package:mvvm/ViewModel/get_album_view.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  GetAlbumsViewModel getPhotosViewModel = Get.put(GetAlbumsViewModel());

  @override
  void initState() {
    getPhotosViewModel.getAlbumsViewModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<GetAlbumsViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == Status.COMPLETE) {
              List<AlbumResponseModel> data = controller.apiResponse.data;

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
                                Text('userId : ${data[index].userId}'),
                                Text('id : ${data[index].id}'),
                                Text('title : ${data[index].title}'),
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
