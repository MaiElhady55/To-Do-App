import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.payload}) : super(key: key);

  final String payload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payload = '';
  @override
  void initState() {
    _payload = widget.payload;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios,
           color: Get.isDarkMode? Colors.white:darkGreyClr,
          ),
        ),
        elevation: 0,
        backgroundColor: context.theme.backgroundColor,
        title: Text(
          _payload.toString().split('|')[0],
          style: TextStyle(
            color: Get.isDarkMode? Colors.white:darkGreyClr,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text('Hello , Mai',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight:FontWeight.w900,
                  color: Get.isDarkMode? Colors.white:darkGreyClr,
                ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('You Have New Reminder',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight:FontWeight.w300,
                  color: Get.isDarkMode? Colors.grey[300]:darkGreyClr,
                ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(child:Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: primaryClr
              ),
              child: SingleChildScrollView(child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.text_format,color: Colors.white,size: 35,),
                      SizedBox(width: 20,),
                      Text('TiTle',style: TextStyle(color: Colors.white,fontSize: 30),),
                      SizedBox(height: 20,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                 _payload.toString().split('|')[0],
                 style: TextStyle(
                  color: Colors.white,
                  fontSize: 20 )),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.description,color: Colors.white,size: 35,),
                      SizedBox(width: 20,),
                      Text('Description',style: TextStyle(color: Colors.white,fontSize: 30),),
                      SizedBox(height: 20,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                     _payload.toString().split('|')[1],
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                       )),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Icon(Icons.calendar_today_outlined,color: Colors.white,size: 35,),
                      SizedBox(width: 20,),
                      Text('Date',style: TextStyle(color: Colors.white,fontSize: 30),),
                      SizedBox(height: 20,),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(
                     _payload.toString().split('|')[2],
                      style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                       )),
                ],
                
              )
              ,),
            ) ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
