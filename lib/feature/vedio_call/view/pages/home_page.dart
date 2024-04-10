import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:video_call_zego_cloud/feature/vedio_call/view/pages/vedio_call_zego_ui_page.dart';

import '../../view_model/cubit/video_call_cubit.dart';
import '../../view_model/cubit/video_call_state.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class HomeCallIDPage extends StatelessWidget {
  HomeCallIDPage({super.key});

  final TextEditingController callIDController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final HomeCallIDCubit cubit = BlocProvider.of<HomeCallIDCubit>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text(
            'Join Video Call',
            style: GoogleFonts.agbalumo()
                .copyWith(fontWeight: FontWeight.w400, fontSize: 25),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/animation.json', height: 250, width: 250),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  labelText: 'Enter Name',
                  hintText: 'Enter your name',
                  controller: userNameController,
                  backgroundColor: Colors.white24,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  labelText: 'Enter Call ID',
                  hintText: 'Enter the call ID to join',
                  controller: callIDController,
                  backgroundColor: Colors.white24,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                // Button
                BlocConsumer<HomeCallIDCubit, HomeCallIDState>(
                  listener: (BuildContext context, HomeCallIDState state) {
                    if (state is HomeCallIDSuccessState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoCallPage(
                            userName: state.userName,
                            callId: state.callId.toString(),
                          ),
                        ),
                      );
                    } else if (state is HomeCallIDErrorState) {
                      showCustomSnackBar(context, state.message);
                    }
                  },
                  builder: (BuildContext context, HomeCallIDState state) {
                    return CustomElevatedButton(
                      onPressed: () {
                        final String callID = callIDController.text.trim();
                        final String userName = userNameController.text.trim();
                        cubit.joinCall(userName, callID);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
