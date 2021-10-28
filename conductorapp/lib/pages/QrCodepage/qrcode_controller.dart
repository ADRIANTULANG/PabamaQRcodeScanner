import 'package:conductorapp/helpers/sizer.dart';
import 'package:conductorapp/pages/QrCodepage/qrcode_api.dart';
import 'package:conductorapp/pages/QrCodepage/qrcode_model.dart';
import 'package:conductorapp/pages/homepage/Home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRcodeController extends GetxController {
  RxList<TransactionInfo> transactionInfoList = <TransactionInfo>[].obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  RxBool alreadyScanned = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
    });
  }

  Future<void> updateStatusTbl_Transaction(
      {required String transactionID, required String busID}) async {
    try {
      var result =
          await QRapi.updateStatus(transactionID: transactionID, busID: busID);
      print(result);
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  Future<void> updateSeatTbl_bus_seats(
      {required String seatnumber, required String busID}) async {
    try {
      var result =
          await QRapi.updateSeatNumber(seatnumber: seatnumber, busID: busID);
      print(result);
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  Future<void> getTransactionID(
      {required String transactionID, required context}) async {
    print("data : $transactionID");
    try {
      var result = await QRapi.getTransaction(transactionID: transactionID);
      print(result);

      transactionInfoList.assignAll(result);
      if (transactionInfoList[0].status == 'valid') {
        await updateStatusTbl_Transaction(
            transactionID: transactionID, busID: transactionInfoList[0].busid);
        await updateSeatTbl_bus_seats(
            seatnumber: transactionInfoList[0].seatnumber,
            busID: transactionInfoList[0].busid);
        var homeController = Get.put(HomeController());
        await homeController.confirmationDialog(context, transactionID);
        homeController.getSeats();
      } else {
        confirmUpdateSeat(context);
      }
      // if (userInfo.length != 0) {
      //   // Get.to(() => HomeView());
      // }
    } catch (error) {
      if (error == true) {}
    } finally {}
  }

  confirmUpdateSeat(context) {
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
                    "MESSAGE",
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
                  child: Text(
                    "THIS QR CODE IS NOT VALID",
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
                // TextButton(
                //   child: Text(
                //     'BACK',
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onPressed: () {
                //     Get.back();
                //   },
                // ),
                TextButton(
                  child: Text(
                    'CONFIRM',
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                  onPressed: () async {
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
