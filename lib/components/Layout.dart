import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({
    super.key,
    this.isHomePage = false,
    this.title = '',
    required this.body,
  }) : super();

  final bool isHomePage;
  final String title;
  final Widget body;

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffedeff2),
      body: Column(
        children: [
          Container(
            constraints: const BoxConstraints(
              maxHeight: 150,
            ),
            padding: const EdgeInsets.fromLTRB(15, 45, 15, 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: const DecorationImage(
                        image: AssetImage('assets/avatar.png'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  onTap: () async {
                    final Reference storageRef = FirebaseStorage.instance.ref().child('');
                    final ListResult listResult = await storageRef.listAll();
                    for (Reference elem in listResult.prefixes) {
                      print(elem.name);
                    }
                    // for (var item in listResult.items) {
                    //   // The items under storageRef.
                    // }
                  },
                ),
                Container(
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white
                  ),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset('assets/searchIcon.png'),
                  ),
                )
              ],
            ),
          ),
          widget.body,
        ],
      ),
    );
  }
}