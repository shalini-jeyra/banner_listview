import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
late PageController _pageController;
  int _currentPage = 0;
  List<String> images = [
'https://picsum.photos/250?image=1',
               'https://picsum.photos/250?image=2',
              'https://picsum.photos/250?image=3',
                'https://picsum.photos/250?image=9',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage, viewportFraction: 1);
  
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
    void _startAutoSlide() {
    Future.delayed(Duration(seconds: 3), () {
      final nextPage = _currentPage + 1 == images.length ? 0 : _currentPage + 1;
      _pageController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      _startAutoSlide();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flipkart'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
             Container(
                height: 200,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(4, (innerIndex) {
                        return Image.network(
                          images[(index * 4 + innerIndex) % images.length],
                          fit: BoxFit.cover,
                        );
                      }),
                    );
                  },
                ),
              ),
               SizedBox(height: 10,),
                 Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(images.length, (index) {
                  return Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index ? Colors.blue : Colors.grey,
                    ),
                  );
                }),
              ),
              SizedBox(height: 20,),
              Container(
                height: 200,
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    Image.network('https://picsum.photos/250?image=1'),
                    Image.network('https://picsum.photos/250?image=2'),
                    Image.network('https://picsum.photos/250?image=3'),
                    Image.network('https://picsum.photos/250?image=9'),
                  ],
                ),
              ),
              
             
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: 150,
                        child: Column(
                          children: [
                            Image.network('https://picsum.photos/250?image=9'), 
                            SizedBox(height: 10,),
                            Text('Product $index'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
               Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(4, (index) {
                    return Card(
                      child: Container(
                        height: 150,
                        child: Center(
                          child: Text('Category $index'),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              
               Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Trending',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: 150,
                        child: Column(
                          children: [
                            Image.network('https://picsum.photos/250?image=9'),
                            SizedBox(height: 10,),
                            Text('Trending $index'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

