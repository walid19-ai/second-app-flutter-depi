
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../search_result_screen/search_result_screen.dart';

class MainSearchScreen extends StatelessWidget {
 MainSearchScreen({super.key});
TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0,horizontal: 16),

          child:
            Row(
              children: [
                Expanded
            (child:
            TextFormField(
             controller:controller ,
                  onFieldSubmitted: (value){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchResultScreen(query: value,)));
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_sharp),
                    suffixIcon: GestureDetector(
                      onTap: (){
                        controller.clear();
                      },
                        child: Icon(Icons.close)),
                    filled: true,
                      fillColor: Color(0xffF0Eff0),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color:(Color(0xff0088FF)))
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color:(Color(0xff0088FF)))
                      ),

                      hintText: 'search',border: OutlineInputBorder()),)),
                    TextButton(onPressed: (){
                      controller.clear();
                    },child: Text("cancel",style: TextStyle(color: Colors.blue)),)
              ]

    
            )
        ),

    );
  }
}
