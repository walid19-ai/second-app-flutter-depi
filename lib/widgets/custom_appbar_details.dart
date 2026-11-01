


import 'package:flutter/material.dart';

import '../circle_icon/circle_icon.dart';

class CustomAppbarDetails extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbarDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth:50 ,
      leading:GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: CircleIcon(icon: Icons.arrow_back_ios_rounded,),
          )),
      title: Text('News Detail',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
      centerTitle: true,
      actions: [Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: CircleIcon(icon: Icons.save),
      )],
      backgroundColor: Colors.grey.shade200,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(56);
}
