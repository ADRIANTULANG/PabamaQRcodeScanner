import 'package:conductorapp/helpers/sizer.dart';
import 'package:conductorapp/pages/homepage/Home_api.dart';
import 'package:conductorapp/pages/homepage/Home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Seat> seatList = <Seat>[].obs;
  RxBool isLoadingGettingSeats = true.obs;
  RxBool isErrorGettingSeats = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getValues();
    getSeats();
  }

  RxString userid = ''.obs;
  RxString username = ''.obs;
  RxString password = ''.obs;
  RxString busid = ''.obs;
  RxString conductor_name = ''.obs;

  getValues() async {
    userid.value = await Get.arguments['userid'];
    username.value = await Get.arguments['username'];
    password.value = await Get.arguments['password'];
    busid.value = await Get.arguments['busid'];
    conductor_name.value = await Get.arguments['conductor_name'];
  }

  Future<void> getSeats() async {
    isLoadingGettingSeats(true);

    try {
      var result = await HomeApi.getSeats(busid: busid.value);
      seatList.assignAll(result);
      isLoadingGettingSeats(false);
    } catch (error) {
      isErrorGettingSeats(true);
      if (error == true) {}
    } finally {}
  }

  Future<void> updateSeat(
      {required String busid,
      required String seatNumber,
      required String status}) async {
    try {
      var result = await HomeApi.updateSeatStatusToVacant(
          busid: busid, seatno: seatNumber, status: status.toString());
      print(result);
      seatList.assignAll(await HomeApi.getSeats(busid: busid));
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  confirmationDialog(context, transactionID) {
    var sizer = Sizer();
    Get.dialog(
      AlertDialog(
        content: Container(
          height: sizer.height(context: context, height: 10),
          width: sizer.width(context: context, width: 70),
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  // height: sizer.height(context: Get.context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Text(
                    "RESULT",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  // height: sizer.height(context: Get.context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Text(
                    "VALID QR CODE: $transactionID",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            child: Text('Confirm'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  confirmUpdateSeat(context, seatStatus, busid, seatnumber, pickup) {
    var sizer = Sizer();
    Get.dialog(
      AlertDialog(
        content: Container(
          height: seatStatus == '2'
              ? sizer.height(context: context, height: 17)
              : sizer.height(context: context, height: 10),
          width: sizer.width(context: context, width: 70),
          child: Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  // height: sizer.height(context: Get.context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: Text(
                    "UPDATE SEAT STATUS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: sizer.height(context: context, height: 2),
                ),
                Container(
                  alignment: Alignment.center,
                  // height: sizer.height(context: Get.context, height: 5),
                  width: sizer.width(context: context, width: 70),
                  child: seatStatus == '1'
                      ? Text(
                          "THIS SEAT WILL BE VACANT AFTER CONFIRMING.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        )
                      : seatStatus == '2'
                          ? Column(
                              children: [
                                Text(
                                  "THIS SEAT IS RESERVED PICK UP TO: $pickup.",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height:
                                      sizer.height(context: context, height: 2),
                                ),
                                Text(
                                  "THIS SEAT WILL BE VACANT AFTER CONFIRMING.",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            )
                          : Text(
                              "THIS SEAT WILL NOT BE VACANT AFTER CONFIRMING.",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text(
                    'BACK',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
                TextButton(
                  child: Text(
                    'CONFIRM',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  onPressed: () async {
                    if (seatStatus == '1') {
                      await updateSeat(
                          busid: busid, seatNumber: seatnumber, status: '0');
                    } else if (seatStatus == '0') {
                      await updateSeat(
                          busid: busid, seatNumber: seatnumber, status: '1');
                    } else if (seatStatus == '2') {
                      await updateSeat(
                          busid: busid, seatNumber: seatnumber, status: '0');
                    }

                    Get.back();
                  },
                ),
              ],
            ),
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
