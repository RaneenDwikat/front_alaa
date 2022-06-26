// ignore_for_file: unnecessary_new

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//import 'package:Fluttertoast/Fluttertoast.dart';
class AuthService {
  Dio dio = new Dio();

  login(name, password) async {
    try {
      return await dio.post('http://10.0.2.2:3000/authenticate',
          data: {
            "name": name,
            "password": password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  loginw(name, password) async {
    try {
      return await dio.post('http://10.0.2.2:3000/authenticatew',
          data: {
            "name": name,
            "password": password,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  addUser(name, password, phonenumber) async {
    return await dio.post('http://10.0.2.2:3000/adduser',
        data: {"name": name, "password": password, "phonenumber": phonenumber},
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addWorker(name, password, phonenumber, List<String> category, region) async {
    return await dio.post('http://10.0.2.2:3000/addworker',
        data: {
          "name": name,
          "password": password,
          "phonenumber": phonenumber,
          "category": category,
          "region": region
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  addOrder(name, List<String> address, category, service, worker, time) async {
    return await dio.post('http://10.0.2.2:3000/addorder',
        data: {
          "name": name,
          "category": category,
          "service": service,
          "worker": worker,
          "time": time,
          "address": address
        },
        options: Options(contentType: Headers.formUrlEncodedContentType));
  }

  savelocation(latitude, longitude, name, region, address) async {
    try {
      return await dio.put('http://10.0.2.2:3000/savelocation',
          data: {
            "name": name,
            "latitude": latitude,
            "longitude": longitude,
            "region": region,
            "address": address,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getlocation(name) async {
    try {
      return await dio.get('http://10.0.2.2:3000/getlocation/$name');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getcategory() async {
    try {
      return await dio.get('http://10.0.2.2:3000/getcategory');
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  cancelrequest(_id) async {
    try {
      return await dio.put('http://10.0.2.2:3000/cancelrequest/$_id',
          data: {
            "_id": _id,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response!.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getorder(_id) async {
    try {
      return await dio.get('http://10.0.2.2:3000/getspacificorder/$_id');
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      // msg: e.response!.data['msg'],
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0);
    }
  }

  getworkernameandphonenumber(_id) async {
    try {
      return await dio
          .get('http://10.0.2.2:3000/getworkernameandphonenumber/$_id');
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      // msg: e.response!.data['msg'],
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0);
    }
  }

  setratefororder(_id, rate) async {
    try {
      return await dio.put('http://10.0.2.2:3000/rateorder/$_id',
          data: {
            "rating": rate,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      //     msg: e.response!.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  addtimeforworker(_id, time) async {
    try {
      return await dio.put('http://10.0.2.2:3000/addtimeforworker/$_id',
          data: {
            "time": time,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      //     msg: e.response!.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  getworkerinfo(name) async {
    try {
      return await dio.get('http://10.0.2.2:3000/getworkerinfo/$name');
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      // msg: e.response!.data['msg'],
      // toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.BOTTOM,
      // backgroundColor: Colors.red,
      // textColor: Colors.white,
      // fontSize: 16.0);
    }
  }

  updateworkerinfo(name, category, password, region, phonenumber) async {
    try {
      return await dio.put('http://10.0.2.2:3000/updateworkerinfo/$phonenumber',
          data: {
            "name": name,
            "category": category,
            "password": password,
            "region": region,
          },
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      // Fluttertoast.showToast(
      //     msg: e.response!.data['msg'],
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }
}
