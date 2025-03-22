import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieAnimations extends StatefulWidget {
  const LottieAnimations({super.key});

  @override
  State<LottieAnimations> createState() => _LottieAnimationsState();
}

class _LottieAnimationsState extends State<LottieAnimations> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    
    controller.addStatusListener((status) async{
      if(status == AnimationStatus.completed){
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie Animations'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Center(
            child: Lottie.asset(
              'assets/delivery animation.json',
            ),
          ),
          SizedBox(height: 32,),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 43),
              textStyle: TextStyle(fontSize: 38,color: Colors.blue)
            ),
            icon: Icon(Icons.delivery_dining,size: 40,),
              onPressed: showDoneDialog, 
              label: Text('Order Pizza')
          )
        ],
      ),
    );
  }

  void showDoneDialog() => showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/done animation.json',repeat: false,controller: controller,
          onLoaded: (composition){
            controller.duration = composition.duration;
            controller.forward();
          }
          ),
          Text('Enjoy your order',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
          SizedBox(height: 16,)
        ],
      ),
    )
  );
}