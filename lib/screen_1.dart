import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Renter Dashboard",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 34,
                  ),
                ),
                Image.asset('assets/images/Vector.png'),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Balance: \$30.55 ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 96,
                  decoration: BoxDecoration(
                    color: Color(0xffBC0063),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "05",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.pink[200],
                          ),
                        ),
                        Text(
                          "Total Parking",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 96,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "05",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff01DB3E),
                          ),
                        ),
                        Text(
                          "Booked Parking",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: 96,
                  decoration: BoxDecoration(
                    color: Color(0xff848484),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "05",
                          style: TextStyle(
                            fontSize: 25,
                            color: Color(0xff353535),
                          ),
                        ),
                        Text("Free Parking"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Recent Booked ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20)),
              height: 137,
              width: 358,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: Image.asset('assets/images/Rectangle63.png')),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Allinggton Paddock",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '7518 Washington Alley',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RichText(
                            text: TextSpan(text: '\$6.58', children: [
                          TextSpan(text: '/2 hours'),
                          TextSpan(
                              text: '    Booked',
                              style: TextStyle(color: Color(0xff01DB3E))),
                        ]))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20)),
              height: 137,
              width: 358,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: Image.asset('assets/images/Rectangle63.png')),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Allinggton Paddock",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '7518 Washington Alley',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RichText(
                            text: TextSpan(text: '\$6.58', children: [
                          TextSpan(text: '/2 hours'),
                          TextSpan(
                              text: '    Booked',
                              style: TextStyle(color: Color(0xff01DB3E))),
                        ])),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20)),
              height: 137,
              width: 358,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: Image.asset('assets/images/Rectangle63.png')),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Allinggton Paddock",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '7518 Washington Alley',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RichText(
                            text: TextSpan(text: '\$6.58', children: [
                          TextSpan(text: '/2 hours'),
                          TextSpan(
                              text: '    Booked',
                              style: TextStyle(color: Color(0xff01DB3E))),
                        ]))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffD9D9D9),
                  borderRadius: BorderRadius.circular(20)),
              height: 137,
              width: 358,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(child: Image.asset('assets/images/Rectangle63.png')),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Allinggton Paddock",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '7518 Washington Alley',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        RichText(
                            text: TextSpan(text: '\$6.58', children: [
                          TextSpan(text: '/2 hours'),
                          TextSpan(
                              text: '    Booked',
                              style: TextStyle(color: Color(0xff01DB3E))),
                        ]))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
