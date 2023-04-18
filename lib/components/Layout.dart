import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              end: Alignment(-1, 3),
              begin: Alignment(1, -3),
              colors: [Color(0xff2600be), Color(0xff280047), Color(0xff760181)]
            )
        ),
        child: Column(
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
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                          image: AssetImage('assets/musicAppLogo.png'),
                          fit: BoxFit.cover
                        )
                      ),
                    ),
                    onTap: () async {

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
      ),
    );
  }
}