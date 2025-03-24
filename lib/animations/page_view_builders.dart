import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PageViewBuilders extends StatefulWidget {
  const PageViewBuilders({super.key});

  @override
  State<PageViewBuilders> createState() => _PageViewBuildersState();
}

class _PageViewBuildersState extends State<PageViewBuilders> {

  PageController pageController = PageController();

  double currentPageIndex = 0.0;

  @override
  void initState() {
    pageController.addListener((){
      setState(() {
        currentPageIndex = pageController.page!;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final numOfPages = List.generate(10, (index) => '$index');
    return Scaffold(
      appBar: AppBar(
        title: Text('Page View Builder Transitions'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        onPageChanged: (value){
          if (kDebugMode) {
            print(value);
          }
        },
          physics: BouncingScrollPhysics(),
        pageSnapping: true,
        controller: pageController,
          itemCount: numOfPages.length,
          itemBuilder: (context,index){
            final firstPageItem = numOfPages[index];
            if(index == currentPageIndex.floor()){
              return Transform(transform: Matrix4.identity()..rotateZ(currentPageIndex - index),
                child: Container(
                  color: index % 2 == 0 ? Colors.indigo : Colors.green,
                  child: Center(child: Text('Page $firstPageItem',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                ));
            } else if(index == currentPageIndex.floor() + 1){
              return Transform(transform: Matrix4.identity()..rotateZ(currentPageIndex - index),
              child: Container(
                color: index % 2 == 0 ? Colors.indigo : Colors.green,
                child: Center(child: Text('Page $firstPageItem',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
              ));
            }else{
              return Container(
                color: index % 2 == 0 ? Colors.indigo : Colors.green,
                child: Center(child: Text('Page $firstPageItem')),
              );
            }
      })
    );
  }
}

// PageView(
// reverse: true,
// children: [
// Container(
// color: Colors.red,
// ),
// Container(
// color: Colors.green,
// ),
// Container(
// color: Colors.blue,
// ),
// Container(
// color: Colors.indigo,
// )
// ],
// ),