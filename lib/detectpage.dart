import 'package:flutter/material.dart';

import 'package:camera/camera.dart';



class DetectPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  DetectPage(this.cameras);



  @override
  _DetectPageState createState() => _DetectPageState();
}

class _DetectPageState extends State<DetectPage> {
  CameraController controller;
  final _vController = TextEditingController();
  final _aController = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    _vController.addListener(_printv);
    _aController.addListener(_printa);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  _printv() {
    print("velocity is : ${_vController.text}");
  }
  _printa() {
    print("acceleration is : ${_aController.text}");
  }

  _calculate(){

  }


  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Row(
      children:[
        /*
          Column(
          children: <Widget>[
            TextFormField(controller: _vController,),
            TextFormField(controller: _aController,),
            RaisedButton(
              onPressed: _calculate,
                  child: Text('Login'),
          )
          ],
          ),

        TextFormField(
          validator: (value) {
            if (value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false
              // otherwise.
              if (1==1) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit'),
          ),
        ),
        */
        RotatedBox(
            quarterTurns: 3,
            child: AspectRatio(
              aspectRatio:
              controller.value.aspectRatio,
              child: CameraPreview(controller))
        ),

        Expanded(
          child: Container(
            width: 40,
            color: Colors.green,
          )
        )
      ]
    );
  }
}