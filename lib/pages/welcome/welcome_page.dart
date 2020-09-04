import 'package:crypto_wallet/utils/items.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final _pageViewController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffe0e9f8),
        elevation: 0.0,
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 45,
            child: InkWell(
              onTap: () {},
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xff347af0),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageViewController,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xffe0e9f8),
                  child: Image.asset(
                    Items.welcomeData[index]['image'],
                    width: 326,
                    height: 250,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 375,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(
                              4,
                              (indicator) => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3.0),
                                height: 10.0,
                                width: 10.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: indicator == index
                                      ? Color(0xff347af0)
                                      : Color(0xffedf1f9),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          Items.welcomeData[index]['title'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Text(
                          Items.welcomeData[index]['text'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff485068),
                            fontSize: 15,
                          ),
                        ),
                        Spacer(),
                        FlatButton(
                          onPressed: () {
                            if (index < 3) {
                              _pageViewController.animateToPage(index + 1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease);
                            } else {

                            }
                          },
                          color: index != 3
                              ? Colors.transparent
                              : Color(0xff347af0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(
                              color: Color(0xff347af0),
                            ),
                          ),
                          child: Container(
                            width: 160,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text(
                              index != 3 ? 'Next Step' : 'Let\'s Get Started',
                              style: TextStyle(
                                color: index != 3
                                    ? Color(0xff347af0)
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          itemCount: 4,
        ),
      ),
    );
  }
}
