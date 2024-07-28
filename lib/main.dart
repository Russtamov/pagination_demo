import 'package:flutter/material.dart';
import 'package:pagination_demo/feature/sceens/pagination.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pagination Example',
      home: PaginationPage(),
    );
  }
}
