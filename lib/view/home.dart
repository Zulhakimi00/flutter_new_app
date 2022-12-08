import 'package:flutter/material.dart';
import 'package:new_app/view/home2.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name : Zul'),
                    Text('Name : Zul'),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.cyan,
                          border: Border.all(color: Colors.grey)),
                      child: FlatButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(fontSize: 12.0, color: Colors.white),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home2(1)),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Text('Testing 2'),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Container(
                    child: Text('Testing 1'),
                  ),
                  Container(
                    child: Text('Testing 1'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
