import 'dart:convert';
import 'package:http/http.dart' as http;

class getcat {
  String baseUrl = "http://10.0.2.2:3000/getcategory";
  Future<List> getAllCategory() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        // print("object");
        // print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getservice {
  String baseUrl = "http://10.0.2.2:3000/getservice";
  Future<List> getAllCategory() async {
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        //print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getorders {
  Future<List> getorder(String name) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/getorder/$name";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        //print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class cancelorder {
  Future<List> cancel(String _id) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/cancelrequest/$_id";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        //print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getspacificorder {
  Future<List> getspacific(String _id) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/getspacificorder/$_id";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}

class getworkers {
  Future<List> getworker(String category, region) async {
    try {
      String baseUrl = "http://10.0.2.2:3000/getworkers/$category/$region";
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        print(jsonDecode(response.body));
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
