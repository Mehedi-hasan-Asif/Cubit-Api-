import 'package:cubit_api/cubit/user_cubit.dart';
import 'package:cubit_api/cubit/user_cubit_state.dart';
import 'package:cubit_api/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<UserCubit>().getAllUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Api Calling',),
        ),
        body: BlocBuilder<UserCubit, UserCubitState>(builder: (context, state) {
          if (state is UserCubitLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserCubitError) {
            return Center(
              child: Text(state.message.toString()),
            );
          } else if (state is UserCubitData) {
            return ListView.builder(
              itemBuilder: (context, itemIndex) {
                UserModel userModel = state.userList[itemIndex];
                return ListTile(
                  leading: Text(userModel.id.toString()),
                  title: Text(userModel.name.toString()),
                  subtitle: Text(userModel.email.toString()),
                );
              },
              itemCount: state.userList.length,
            );
          } else {
            return const SizedBox();
          }
        }));
  }
}
