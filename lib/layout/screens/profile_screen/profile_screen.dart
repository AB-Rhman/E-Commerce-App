import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/constant.dart';
import '../../../cubits/user_data_cubit/user_data_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => UserDataCubit()..userModel,
      child: BlocConsumer<UserDataCubit, UserDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          final userData = BlocProvider.of<UserDataCubit>(context);
          return Builder(builder: (context) {
            //-------------------------------------------------------
            if (userData.userModel == null) userData.getUserData();
            //-------------------------------------------------------
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search,
                      color: fontColorOne,
                      size: 25,
                    ),
                  )
                ],
              ),
              body: userData.userModel != null
                  ? SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 14, start: 14, end: 14,bottom: 90),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My profile',
                            style: TextStyle(
                                fontSize: 32,
                                color: fontColorOne,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.account_circle_outlined,
                              size: 60,
                            ),
                            title: Text(
                              userData.userModel!.name!.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: fontColorOne),
                            ),
                            subtitle: Text(
                              userData.userModel!.email!.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                  color: fontColorOne.withOpacity(0.4)),
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const CustomContainer(
                              title: 'Account Information',
                              subTitle: 'phone number, email, password'),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomContainer(
                              title: 'Payment Methods',
                              subTitle: 'Visa **85'),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomContainer(
                              title: 'My Orders', subTitle: 'Have X orders'),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomContainer(
                              title: 'Shipping addresses',
                              subTitle: 'X addresses'),
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomContainer(
                              title: 'Settings',
                              subTitle: 'Notifications, passwords'),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  : Center(
                child: CircularProgressIndicator(
                  color: mainColor,
                ),
              ),
            );
          });
        },
      ),
    );
  }
}



class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key, required this.title, required this.subTitle})
      : super(key: key);
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: containColor, borderRadius: BorderRadius.circular(5)),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: fontColorOne),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(fontSize: 10, color: fontColorOne.withOpacity(.5)),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          color: fontColorOne,
        ),
      ),
    );
  }
}
