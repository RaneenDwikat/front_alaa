// ignore_for_file: sort_child_properties_last

import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/worker/loginw.dart';
import 'package:flutter_app/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class CreatProfile extends StatefulWidget {
  var name;
  CreatProfile(this.name);

  @override
  _CreatProfileState createState() => _CreatProfileState(name);
}

class _CreatProfileState extends State<CreatProfile> {
  var name;
  late List<String> category = [];
  _CreatProfileState(this.name);
  TextEditingController namecontrol = TextEditingController();
  TextEditingController phonenumbercontrol = TextEditingController();
  TextEditingController categorycontrol = TextEditingController();
  TextEditingController regioncontrol = TextEditingController();
  TextEditingController aboutcontrol = TextEditingController();
  // final networkHandler = NetworkHandler();
  PickedFile? _imageFile;
  var region;
  final ImagePicker _picker = ImagePicker();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
    init();
  }

  // var item;

  init() {
    List<String> cat = [];
    AuthService().getworkerinfo(name).then((val) {
      print(val.data!['category'][0]);
      phonenumber = val.data['phonenumber'].toString();
      phonenumbercontrol.text = val.data['phonenumber'].toString();
      for (int i = 0; i < val.data['category'].length; i++) {
        cat.add(arabicitems[items.indexOf(val.data['category'][i].toString())]);
      }
      //  item = val.data['category'].toString();
      print(arabicit[it.indexOf(val.data['region'].toString())]);
      regioncontrol.text = arabicit[it.indexOf(val.data['region'].toString())];
      // categorycontrol.text = val.data['category']
      //     .toString()
      //     .replaceAll("[", "")
      //     .replaceAll("]", "");
      categorycontrol.text =
          cat.toString().replaceAll("[", "").replaceAll("]", "");
      namecontrol.text = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE63220),
        title: const Text(
          '?????????? ????                                              ',
          textDirection: TextDirection.rtl,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              // <-- SEE HERE

              decoration: BoxDecoration(
                  color: Color(0xffE63220),
                  image: DecorationImage(
                    image: AssetImage("assets/logo3.png"),
                    scale: 2.3,
                    alignment: FractionalOffset.center,
                  )),
              accountName: Text(
                "",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              accountEmail: Text(
                "services at your fingertips",
                style: TextStyle(
                  height: 4,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              //   currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              trailing: Icon(
                Icons.account_circle,
              ),
              title: const Text('?????????? ??????????',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatProfile(name)));
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.shopping_cart,
              ),
              title: const Text('????????????',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => BookingPage(name)));
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.home_repair_service,
              ),
              title: const Text('?????????????? ?????????? ????????',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textDirection: TextDirection.rtl),
              onTap: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => SignupWPage()));
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.help,
              ),
              title: const Text(
                '????????????????',
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              trailing: Icon(
                Icons.logout,
              ),
              title: const Text(
                '?????????? ????????????',
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPagew()));
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            const SizedBox(
              height: 20,
            ),
            nameTextField(),
            const SizedBox(
              height: 20,
            ),
            dobField(),
            const SizedBox(
              height: 20,
            ),
            titleTextField(),
            const SizedBox(
              height: 20,
            ),
            professionTextField(),
            const SizedBox(
              height: 20,
            ),
            passTextField(),
            const SizedBox(
              height: 20,
            ),
            cpassTextField(),
            const SizedBox(
              height: 20,
            ),
            aboutTextField(),
            const SizedBox(
              height: 20,
            ),
            butt(),
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 80.0,
          backgroundImage: _imageFile == null
              ? const AssetImage("assets/def.png") as ImageProvider
              : FileImage(File(_imageFile!.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Color(0xffE63220),
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "???????? ???????? ?????????? ????????????",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: const Icon(Icons.camera),
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              label: const Text("Camera"),
            ),
            TextButton.icon(
              icon: const Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: const Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  var phonenumber, password;
  Widget nameTextField() {
    return TextField(
      textAlign: TextAlign.right,
      onChanged: ((value) {
        name = value;
      }),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.teal,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        suffixIcon: Icon(
          Icons.person,
          color: Color(0xffE63220),
        ),
      ),
      controller: namecontrol,
    );
  }

  Widget butt() {
    return ElevatedButton(
      child: const Text(
        "?????? ??????????????????",
        textDirection: TextDirection.rtl,
      ),
      onPressed: () {
        print(password);
        print(phonenumber);
        AuthService()
            .updateworkerinfo(name, category, password, region, phonenumber)
            .then((val) {
          // Fluttertoast.showToast(
          //     msg: val.response!.data['msg'],
          //     toastLength: Toast.LENGTH_SHORT,
          //     gravity: ToastGravity.BOTTOM,
          //     backgroundColor: Colors.red,
          //     textColor: Colors.white,
          //     fontSize: 16.0);
        });
      },
      style: ElevatedButton.styleFrom(
        primary: const Color(0xffE63220),
        onPrimary: Colors.white,
        //shape: RoundedRectangleBorder(
        //borderRadius: BorderRadius.circular(32.0),
        //),
      ),
    );
  }

  Widget professionTextField() {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: Colors.grey, style: BorderStyle.solid, width: 1.50),
        ),
        child: DropdownButton2(
          isExpanded: true,
          hint: Align(
            alignment: AlignmentDirectional.center,
            child: ListTile(
                title: TextField(
              decoration: InputDecoration(border: InputBorder.none),
              controller: regioncontrol,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20,
              ),
            )),
          ),
          items: arabicit
              .map((arabicit) => DropdownMenuItem<String>(
                    value: arabicit,
                    child: Text(
                      arabicit,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          alignment: Alignment.topRight,
          onChanged: (value) {
            region = it[arabicit.indexOf(value.toString())];
            print(region);
            //print(it[arabicit.indexOf(value.toString())]);
            setState(() {
              selectedValue = value as String;
            });
          },
          buttonHeight: 50,
          buttonWidth: 300,
          itemHeight: 40,
          itemPadding: const EdgeInsets.only(left: 5, top: 1, bottom: 1),
          dropdownMaxHeight: 200,
          dropdownPadding: null,
          scrollbarRadius: const Radius.circular(40),
          scrollbarThickness: 6,
          scrollbarAlwaysShow: true,
          offset: const Offset(-20, 0),
        ),
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      controller: phonenumbercontrol,
      onChanged: (value) {
        phonenumber = value;
      },
      readOnly: true,
      textAlign: TextAlign.right,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xffE63220),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        suffixIcon: Icon(
          Icons.phone,
          color: Color(0xffE63220),
        ),
        hintText: "Enter your valid phone number",
      ),
    );
  }

  Widget titleTextField() {
    return DropdownButtonHideUnderline(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: Colors.grey, style: BorderStyle.solid, width: 1.50),
        ),
        child: DropdownButton2(
          isExpanded: true,
          hint: Align(
            alignment: AlignmentDirectional.center,
            child: ListTile(
                title: TextField(
              decoration: InputDecoration(border: InputBorder.none),
              controller: categorycontrol,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).hintColor,
              ),
            )),
          ),
          items: arabicitems.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              //disable default onTap to avoid closing menu when selecting an item
              enabled: false,
              child: StatefulBuilder(
                builder: (context, menuSetState) {
                  // ignore: no_leading_underscores_for_local_identifiers
                  final _isSelected = selectedItems.contains(item);
                  return InkWell(
                    onTap: () {
                      print(item);
                      _isSelected
                          ? {
                              selectedItems.remove(item),
                              category.remove(items[arabicitems.indexOf(item)]),
                              print(category),
                              print("updated")
                            }
                          : {
                              selectedItems.add(item),
                              category.add(items[arabicitems.indexOf(item)]),
                              print(category),
                              print(item)
                            };
                      //This rebuilds the StatefulWidget to update the button's text
                      setState(() {});
                      //This rebuilds the dropdownMenu Widget to update the check mark
                      menuSetState(() {});
                    },
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          _isSelected
                              ? const Icon(Icons.check_box_outlined)
                              : const Icon(Icons.check_box_outline_blank),
                          const SizedBox(width: 20),
                          Text(
                            item,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }).toList(),
          //Use last selected item as the current value so if we've limited menu height, it scroll to last item.
          value: selectedItems.isEmpty ? null : selectedItems.last,
          onChanged: (value) {},
          buttonHeight: 50,
          buttonWidth: 300,
          itemHeight: 40,
          itemPadding: EdgeInsets.all(1.0),
          selectedItemBuilder: (context) {
            return items.map(
              (item) {
                return Container(
                  alignment: AlignmentDirectional.center,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    selectedItems.join(', '),
                    style: const TextStyle(
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
                  ),
                );
              },
            ).toList();
          },
        ),
      ),
    );
  }

  Widget passTextField() {
    return TextFormField(
      obscureText: true,
      onChanged: (value) {
        password = value;
      },
      textAlign: TextAlign.right,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffE63220),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          )),
          suffixIcon: Icon(
            Icons.lock,
            color: Color(0xffE63220),
          ),
          hintText: "???????? ???????? ???????? ",
          hintTextDirection: TextDirection.rtl),
    );
  }

  Widget cpassTextField() {
    return TextFormField(
      textAlign: TextAlign.right,
      obscureText: true,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffE63220),
          )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.orange,
            width: 2,
          )),
          suffixIcon: Icon(
            Icons.lock,
            color: Color(0xffE63220),
          ),
          hintText: "?????????? ???????? ????????",
          hintTextDirection: TextDirection.rtl),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      maxLines: 4,
      textAlign: TextAlign.right,
      decoration: const InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xffE63220),
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.orange,
          width: 2,
        )),
        hintText: "???????? ???? ????????",
      ),
    );
  }
}

final List<String> it = [
  'Nablus',
  'Ramallah',
  'Jenin',
  'Tolkarm',
  'Jericho',
  'Hebron',
  'Bethlehem'
];
final List<String> arabicit = [
  '??????????',
  '?????? ????????',
  '????????',
  '????????????',
  '??????????',
  '????????????',
  '?????? ??????'
];
String? selectedValue;

///list
final List<String> items = [
  'Cleaning',
  'Plumber',
  'Electrician',
  'Painter',
  'Gardener',
  'Carpenter',
];
final List<String> arabicitems = [
  '??????????????',
  '??????????????',
  '????????????????',
  '????????????',
  '??????????',
  '??????????????',
];
List<String> selectedItems = [];

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xffE63220);
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
