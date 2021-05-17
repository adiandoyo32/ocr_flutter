import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ml_vision_flutter/camera_method.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String _imageFile;
  var _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Cropper'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: _previewImage(context),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 100.0,
            height: 50.0,
            child: FloatingActionButton.extended(
              label: Text("Camera"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                onImageButtonPressed(
                  ImageSource.camera,
                  context: context,
                  capturedImageFile: (s) {
                    setState(() {
                      _imageFile = s;
                    });
                  },
                );
              },
            ),
          ),
          Container(
            width: 100.0,
            height: 50.0,
            child: FloatingActionButton.extended(
              label: Text("Gallery"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                onImageButtonPressed(
                  ImageSource.gallery,
                  context: context,
                  capturedImageFile: (s) {
                    print("file path  $s");
                    setState(() {
                      _imageFile = s;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _previewImage(
    BuildContext context,
  ) {
    _width = MediaQuery.of(context).size.width;
    if (_imageFile != null) {
      return Container(
        height: _width * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "$_imageFile",
            height: _width * 0.34,
            width: _width,
            alignment: Alignment.center,
            fit: BoxFit.fitWidth,
          ),
        ),
      );
    } else {
      return Container(
        height: _width * 0.34,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Colors.grey,
        ),
        child: Center(
          child: Image.asset(
            'assets/images/wishlists/cam-img.png',
            width: 24,
            height: 20,
          ),
        ),
      );
    }
  }
}
