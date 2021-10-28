import 'package:conductorapp/helpers/sizer.dart';
import 'package:conductorapp/pages/QrCodepage/qrcode_view.dart';
import 'package:conductorapp/pages/homepage/Home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    var sizer = Sizer();
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          // backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          title: Container(
            //
            height: sizer.height(context: context, height: 8),
            alignment: Alignment.centerLeft,
            child: Container(
              width: sizer.width(context: context, width: 12),
              decoration: BoxDecoration(
                // color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/images/splashscreen.jpeg'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
          ),
          actions: [
            Container(
                width: sizer.width(context: context, width: 15),
                // color: Colors.red,
                alignment: Alignment.center,
                child: GestureDetector(
                    onTap: () {
                      Get.to(() => QRViewExample());
                    },
                    child: Icon(Icons.qr_code_scanner_outlined))),
          ]),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: sizer.height(context: context, height: 2),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "SEAT MANAGEMENT",
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: sizer.font(context: context, fontsize: 20)),
              ),
            ),
            SizedBox(
              height: sizer.height(context: context, height: 2),
            ),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "RESERVED",
                  style: TextStyle(
                      color: Colors.orange, fontWeight: FontWeight.bold),
                ),
                Text(
                  "VACANT",
                  style: TextStyle(
                      color: Colors.green[500], fontWeight: FontWeight.bold),
                ),
                Text(
                  "OCCUPIED",
                  style: TextStyle(
                      color: Colors.red[500], fontWeight: FontWeight.bold),
                ),
              ],
            )),
            SizedBox(
              height: sizer.height(context: context, height: 2),
            ),
            Expanded(
              child: Obx(
                () => controller.isLoadingGettingSeats.value == true
                    ? Container()
                    : Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            // color: Colors.blue,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        // height: sizer.height(context: context, height: 20),
                        width: sizer.width(context: context, width: 90),
                        child: Obx(
                          () => GridView.builder(
                            // shrinkWrap: true,
                            // physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8),
                            itemCount: controller.seatList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.confirmUpdateSeat(
                                      context,
                                      controller.seatList[index].seatStatus,
                                      controller.seatList[index].busId,
                                      controller.seatList[index].seatNumber,
                                      controller.seatList[index].pickup);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: sizer.width(
                                          context: context, width: 3)),
                                  alignment: index.isEven
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  height: sizer.height(
                                      context: context, height: 20),
                                  width:
                                      sizer.width(context: context, width: 20),
                                  // color: index.isEven ? Colors.red : Colors.green,
                                  child: Icon(
                                    Icons.chair_rounded,
                                    color:
                                        controller.seatList[index].seatStatus ==
                                                '0'
                                            ? Colors.green[500]
                                            : controller.seatList[index]
                                                        .seatStatus ==
                                                    '2'
                                                ? Colors.orange
                                                : Colors.red[500],
                                    size: sizer.font(
                                        context: context, fontsize: 40),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
