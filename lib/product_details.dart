import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedColorIndex = 0;
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SizedBox(
            height: 300,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              children: [
                Image.asset('assets/sofa-1 (1).png'),
                Image.asset('assets/sofa-1 (2).png'),
                Image.asset('assets/sofa-1 (3).png'),
                Image.asset('assets/sofa-1 (4).png'),
                Image.asset('assets/sofa-1 (5).png'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(index);
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: _currentImageIndex == index ? Colors.white : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      'assets/sofa-1 (${index + 1}).png',
                      width: 90,
                      height: 90,
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Lamy Wood Lounge Chair Blue Fabric',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Baskerville',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Baskerville',
              ),
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedColorIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _getColorFromIndex(index),
                    border: _selectedColorIndex == index
                        ? Border.all(color: Color(0xffD2D5DC), width: 2)
                        : null,
                  ),
                  width: 24,
                  height: 24,
                ),
              );
            }),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                '\₹1109.00',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Baskerville',
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffB6A26D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                  ),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontFamily: 'Baskerville', // Specify the custom font family
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffB6A26D),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                  ),
                ),
                child: const Text(
                  'Buy now',
                  style: TextStyle(
                    fontFamily: 'Baskerville', // Specify the custom font family
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getColorFromIndex(int index) {
    switch (index) {
      case 0:
        return const Color(0xffB7373C);
      case 1:
        return const Color(0xff3C5782);
      case 2:
        return Colors.brown;
      default:
        return Colors.transparent;
    }
  }
}
