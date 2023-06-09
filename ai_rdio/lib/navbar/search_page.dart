import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:ai_rdio/model/testing.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  List<Autogenerated> list = [];
  Future<List<Autogenerated>> getPostApi() async {
    final response = await http.get(
        Uri.parse('https://utkarsh277001.github.io/dummy.json/dummys.json'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Autogenerated lis =
            Autogenerated(username: i['Username'], gender: i['Gender']);
        list.add(lis);
      }
      return list;
    } else {
      return list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, AsyncSnapshot<List<Autogenerated>> snapshot) {
                if (!snapshot.hasData) {
                  return Text("Loading");
                } else {
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              color: Color.fromARGB(209, 152, 86, 223),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.person,
                                        color: Colors.white70,
                                        size: 60,
                                      ),
                                      title: Text(
                                        snapshot.data![index].username
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Text(
                                          list[index].gender.toString(),
                                          style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        );
                      });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
