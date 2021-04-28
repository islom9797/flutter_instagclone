import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class MyUploadPage extends StatefulWidget {
  @override
  _MyUploadPageState createState() => _MyUploadPageState();
  PageController pageController;
  MyUploadPage({this.pageController});
}

class _MyUploadPageState extends State<MyUploadPage> {
  File _image;
  final ImagePicker _picker = ImagePicker();

  _imgFromGallery() async {
    PickedFile image = await _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = File(image.path);
    });
  }
  _imgFromCamera() async {
    PickedFile image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = File(image.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
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
              onPressed: (){
                widget.pageController.animateToPage(1,duration: Duration(milliseconds: 200),curve: Curves.easeIn);
              })
        ],
      ),
      body:SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  _showPicker(context);
                  },
                child: Container(
                  color: Colors.grey.withOpacity(0.4),
                  width:double.infinity,
                  height: MediaQuery.of(context).size.width/1.5,
                  child:_image==null? Icon(Icons.add_a_photo,size: 60,)
                      :Stack(
                    children: [
                      Image.file(_image,
                        height: double.infinity,
                        width: double.infinity,
                      fit: BoxFit.cover,),
                      Container(
                        width: double.infinity,
                        color: Colors.black12,
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(Icons.highlight_remove,color: Colors.white,),
                                onPressed: (){
                                  setState(() {
                                    _image=null;
                                  });

                            }
                            ),

                          ],
                        ),
                      )
                    ],
                  )

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
