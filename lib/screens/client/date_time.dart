// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_null_comparison

import 'package:flutter_app/screens/client/FadeAnimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/index.dart';
import 'package:flutter_app/screens/client/services.dart';
import 'package:flutter_app/screens/client/workers.dart';
import 'package:flutter_app/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'dart:convert';

// ignore: must_be_immutable
class DateAndTime extends StatefulWidget {
  var name, address, category, service, worker;
  List<dynamic> timing;

  // ignore: use_key_in_widget_constructors
  DateAndTime(this.name, this.address, this.category, this.service, this.worker,
      this.timing);
  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _DateAndTimeState createState() =>
      _DateAndTimeState(name, address, category, service, worker, timing);
}

class _DateAndTimeState extends State<DateAndTime> {
  List<dynamic> timing;
  String name, address, category, service, worker;
  _DateAndTimeState(this.name, this.address, this.category, this.service,
      this.worker, this.timing);
  getworkers servic = getworkers();
  int _selectedRepeat = 0;
  String _selectedHour = '13:30';
  String selected_h = "";
  // ignore: prefer_final_fields
  ItemScrollController _scrollController = ItemScrollController();
  final List<String> hours = <String>[
    'Today 08:00-9:00',
    'Today 09:00-10:00',
    'Today 10:00-11:00',
    'Today 11:00-12:00',
    'Today 12:00-13:00',
    'Today 13:00-14:00',
    'Today 14:00-15:00',
    'Today 15:00-16:00',
    'Today 16:00-17:00',
    'Today 17:00-18:00',
    'Today 18:00-19:00',
    'Tomorrow 08:00-9:00',
    'Tomorrow 09:00-10:00',
    'Tomorrow 10:00-11:00',
    'Tomorrow 11:00-12:00',
    'Tomorrow 12:00-13:00',
    'Tomorrow 13:00-14:00',
    'Tomorrow 14:00-15:00',
    'Tomorrow 15:00-16:00',
    'Tomorrow 16:00-17:00',
    'Tomorrow 17:00-18:00',
    'Tomorrow 18:00-19:00',
  ];
  final List<String> _hours = <String>[
    '?????????? 08:00-9:00',
    '?????????? 09:00-10:00',
    '?????????? 10:00-11:00',
    '?????????? 11:00-12:00',
    '?????????? 12:00-13:00',
    '?????????? 13:00-14:00',
    '?????????? 14:00-15:00',
    '?????????? 15:00-16:00',
    '?????????? 16:00-17:00',
    '?????????? 17:00-18:00',
    '?????????? 18:00-19:00',
    '?????? 08:00-9:00',
    '?????? 09:00-10:00',
    '?????? 10:00-11:00',
    '?????? 11:00-12:00',
    '?????? 12:00-13:00',
    '?????? 13:00-14:00',
    '?????? 14:00-15:00',
    '?????? 15:00-16:00',
    '?????? 16:00-17:00',
    '?????? 17:00-18:00',
    '?????? 18:00-19:00',
  ];
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 500), () {
      _scrollController.scrollTo(
        index: 24,
        duration: Duration(seconds: 3),
        curve: Curves.easeInOut,
      );
    });

    print(int.parse(timing[0].split("-")[1].split(":")[0]));
    print(timing[0]
        .toString()
        .split(" ")[1]
        .replaceAll(RegExp('[^[]]'), '')
        .split(":")[0]);
    for (int i = 0; i < timing.length; i++) {
      var j = int.parse(timing[i]
          .toString()
          .split(" ")[1]
          .replaceAll(RegExp('[^[]]'), '')
          .split(":")[0]);
      var comp =
          timing[i].toString().replaceAll(RegExp('[^[]]'), '').split(":")[0];
      print("comp= $comp");
      var x = int.parse(timing[i].split("-")[1].split(":")[0]);
      var z = x - j;
      print("z= $z");

      int s = 1;
      for (int t = 0; t < hours.length; t++) {
        print("object0");
        if (hours[t].split(":")[0] == comp) {
          s = t;
          print("index = $s");

          break;
        }
      }
      for (int y = 0; y < z; y++) {
        hours.removeAt(s);
        _hours.removeAt(s);
        print("s= $s");
        print(hours);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.all(15.0),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: <Widget>[
        //       FloatingActionButton(
        //         heroTag: "before",
        //         onPressed: () {
        //           print(name);
        //           print(category);
        //           print(address);
        //           Navigator.push(
        //               context,
        //               MaterialPageRoute(
        //                   builder: (context) =>
        //                       servicesPage(name, address, category)));
        //         },
        //         child: Icon(Icons.navigate_before),
        //         backgroundColor: Color(0xffE63220),
        //       ),
        //     ],
        //   ),
        // ),
        appBar: PreferredSize(
          preferredSize:
              const Size.fromHeight(153.0), // here the desired height
          child: AppBar(
            backgroundColor: const Color(0xffF8C80E),
            flexibleSpace: const Image(
              image: AssetImage('assets/logo3.png'),
              fit: BoxFit.none,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                  child: FadeAnimation(
                1,
                Padding(
                  padding: EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
                  child: Text(
                    'Select Day and Time',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.grey.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ))
            ];
          },
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    1,
                    Row(
                      children: [
                        const Text(""),
                        const Spacer(),
                        IconButton(
                          padding: const EdgeInsets.all(0),
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_drop_down_circle_outlined,
                            color: Colors.grey.shade700,
                          ),
                        )
                      ],
                    )),
                const SizedBox(
                  height: 10,
                ),
                FadeAnimation(
                    1.2,
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border:
                            Border.all(width: 1.5, color: Colors.grey.shade200),
                      ),
                      child: ScrollablePositionedList.builder(
                          itemScrollController: _scrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: hours.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected_h = hours[index];
                                  print(selected_h);
                                  _selectedHour = hours[index];
                                });
                              },
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: _selectedHour == hours[index]
                                      ? Colors.orange.shade100.withOpacity(0.5)
                                      : Colors.orange.withOpacity(0),
                                  border: Border.all(
                                    color: _selectedHour == hours[index]
                                        ? Colors.orange
                                        : Colors.white.withOpacity(0),
                                    width: 1.5,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      _hours[index],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    )),
                const SizedBox(
                  height: 40,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 100.0),
                  child: MaterialButton(
                      minWidth: 150.0,
                      height: 50.0,
                      color: const Color(0xffF8C80E),
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Color(0xffF8C80E),
                              width: 2,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text('?????????? ??????????',
                          style: TextStyle(
                              color: Color(0xffE63220),
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                      onPressed: () {
                        if (address != null) {
                          List<String> add = address.split(",");

                          print("ok");
                          print(add);
                          AuthService().addtimeforworker(worker, selected_h);
                          AuthService()
                              .addOrder(name, add, category, service, worker,
                                  selected_h)
                              .then(
                            (val) {
                              Fluttertoast.showToast(
                                  msg: val.data['msg'],
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            },
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "???? ???????????? ???????????? ????????",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => workersPage(
                                    name, address, category, service)));
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
