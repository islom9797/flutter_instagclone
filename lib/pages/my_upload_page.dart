import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class MyUploadPage extends StatefulWidget {
  @override
  _MyUploadPageState createState() => _MyUploadPageState();
}

class _MyUploadPageState extends State<MyUploadPage> {
  File _image;

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
backgroundColor: Colors.white,
        elevation: 0,
        title:Center(child:  Text("Upload",style: TextStyle(color: Colors.black,fontFamily: "Billabong",fontSize: 25),),),
        actions: [
          IconButton(
              icon: Icon(Icons.post_add,color: Color.fromRGBO(245, 96, 64, 1),),
              onPressed: (){})
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              GestureDetector(
                onTap: (){_imgFromGallery();},
                child: Container(
                  color: Colors.grey.withOpacity(0.4),
                  width:double.infinity,
                  height: MediaQuery.of(context).size.width/1.5,
                  child: Icon(Icons.add_a_photo,size: 60,),

                ),
              ),
              Expanded(
                  child: Container(
                   margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                    child: TextField(
                      //controller: captionController,
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: "Caption",
                        hintStyle: TextStyle(fontSize: 17,color: Colors.black38)

                      ),
                    ),
                  ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
