import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm/Model/Response/get_users_response_model.dart';
import 'package:mvvm/ViewModel/get_users_view.dart';
import '../../ApiServices/api_response.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  GetUsersViewModel getUsersViewModel = Get.put(GetUsersViewModel());

  @override
  void initState() {
    getUsersViewModel.getUsersViewModel();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<GetUsersViewModel>(
          builder: (controller) {
            if (controller.apiResponse.status == Status.COMPLETE) {
              List<UsersResponseModel> data = controller.apiResponse.data;

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
                                Text('id : ${data[index].id}'),
                                Text('name : ${data[index].name}'),
                                Text('username : ${data[index].username}'),
                                Text('email : ${data[index].email}'),
                                Text('street : ${data[index].address.street}'),
                                Text('suite : ${data[index].address.suite}'),
                                Text('city : ${data[index].address.city}'),
                                Text(
                                    'zipcode : ${data[index].address.zipcode}'),
                                Text('lat : ${data[index].address.geo.lat}'),
                                Text('lng : ${data[index].address.geo.lng}'),
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
