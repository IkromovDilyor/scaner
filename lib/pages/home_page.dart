import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scaner/pages/qr_scaner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Qr Scanner"),),
    body: Center(
    child: SingleChildScrollView(
    padding: EdgeInsets.all(20),


          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QrImage(
                data: controller.text,
                size: 200,
              backgroundColor: Colors.white,
              ),
              SizedBox(height: 40,),
              buildTextField(context),
              SizedBox(height: 30,),
              IconButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context,ScanPage.id);
                },
                icon: Icon(Icons.qr_code_scanner,size: 50,),
              ),SizedBox(height: 20,),
              Text("     to scanner",style: TextStyle(color: Colors.black),)

            ],
          ),
        ),

      ),

    );
  }
  Widget buildTextField(BuildContext context)=>TextField(
    controller: controller,
    style: TextStyle(
      fontSize: 20,
    ),
    decoration: InputDecoration(
      hintText: "Enter the data",
      hintStyle: TextStyle(color: Colors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.white),

      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: Theme.of(context).accentColor,
        )
      ),
      suffixIcon: IconButton(
        color: Theme.of(context).accentColor,
        icon: Icon(Icons.done),
        onPressed: ()=>setState((){}),

      )
    ),

  );
}
