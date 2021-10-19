import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:jsiondata/model/card_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'model/card_model.dart';

class Mycard extends StatefulWidget {
  // const Mycard({Key? key}) : super(key: key);

  @override
  _MycardState createState() => _MycardState();
}

class _MycardState extends State<Mycard> {
  Model? data;

  Future<String> _loadAStudentAssert() async {
    return await rootBundle.loadString('assets/data.json');
  }

  Future loadStudent() async {
    String jsonString = await _loadAStudentAssert();
    final jsonResponse = json.decode(jsonString);
    // Model data = Model.fromJson(jsonResponse);
    setState(() {
      data = Model.fromJson(jsonResponse);
    });
  }

  @override
  void initState() {
    loadStudent();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  BottomSheet() {
    return showModalBottomSheet(
        barrierColor: Colors.black54,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
        context: context,
        builder: (_) {
          return ListTile(
            leading: Text("df"),
            title: Text("fsds"),
            trailing: Text("data"),
          );
        });
    //   setState(() {
    //     indicator = false;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Image.network(
                '${data?.profilePic}',
                width: double.infinity,
                fit: BoxFit.cover,
                height: 550,
                scale: 1.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: ListTile(
                title: Text(
                  "${data?.firstName} ${data?.lastName}",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                subtitle: Text("${data?.region} , ${data?.country}"),
                trailing: FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    size: 40,
                  ),
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 12, right: 25, left: 25, bottom: 12),
              child: Text(
                '${data?.bio}',
                style: TextStyle(
                    fontSize: 10, fontWeight: FontWeight.w300, height: 1.3),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      Text(
                        "Post",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data?.post}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    BottomSheet();
                  },
                  child: Column(
                    children: [
                      Text(
                        "Followers",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data?.followers}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    children: [
                      Text(
                        "Following",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        '${data?.following}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
