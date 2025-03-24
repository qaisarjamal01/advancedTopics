import 'package:flutter/material.dart';

class PageViewBuilders extends StatefulWidget {
  const PageViewBuilders({super.key});

  @override
  State<PageViewBuilders> createState() => _PageViewBuildersState();
}

class _PageViewBuildersState extends State<PageViewBuilders> {
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
          itemCount: numOfPages.length,
          itemBuilder: (context,index){
            final firstPageItem = numOfPages[index];
        return Container(
          color: index % 2 == 0 ? Colors.indigo : Colors.green,
          child: Center(child: Text('Page $firstPageItem')),
        );
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