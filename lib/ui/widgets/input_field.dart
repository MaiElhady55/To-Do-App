import 'package:flutter/material.dart';
import 'package:todo_app/ui/theme.dart';
import 'package:get/get.dart';
import '../size_config.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.title,
     required this.hint,
     this.controller,
     this.widget
     }) : super(key: key);

  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: EdgeInsets.only(top:14),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,style:Titlestyle,),
                  Container(
                  padding: EdgeInsets.only(left: 14),
                  margin: EdgeInsets.only(top:8),
                  width: SizeConfig.screenWidth,
                  height: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.grey
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: TextFormField(
                        controller: controller,
                        autofocus: false,
                        cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[700],
                        readOnly: widget!=null?true:false,
                        style: SubTitlestyle,
                        decoration: InputDecoration(
                          hintText: hint,
                          helperStyle: SubTitlestyle,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              //color: context.thene.backgroundColor,
                              color: primaryClr,
                              width: 0
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              //color: context.thene.backgroundColor,
                              color: darkGreyClr,
                              width: 0
                            ),
                          ),
                        ),
                      )),
                      widget??Container(),
                    ],
                  ),
                  ),
                ],
              ),
              
              );
  }
}
