import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

import '../../../../constant/call_info.dart';


final int userID = Random().nextInt(1000);

class VideoCallPage extends StatelessWidget {
  const VideoCallPage(
      {super.key, required this.callId, required this.userName});

  final String callId;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      userName: userName,
      appID: CallInfo.appID,
      appSign: CallInfo.appSign,
      callID: "callID",
      userID: userID.toString(),
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
