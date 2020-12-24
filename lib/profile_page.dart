import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:portfolio_web/responsive_widget.dart';
import 'coolers.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  List<Widget> navButtons() => [
        NavButton(
          text: "Home",
          onPressed: () {
            //html.window.open("https://pawan.live", "Pk");
          },
        ),
        NavButton(
          text: "Work",
          onPressed: () {
            html.window.open("https://github.com/muzztafa", "Pk");
          },
        ),
        NavButton(
          text: "Contact",
          onPressed: () {
            html.window.open(
                "https://www.linkedin.com/in/ahmed-mustafa-a2b249183/", "Pk");
          },
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Scaffold(
        backgroundColor: Coolers.primaryColor,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Coolers.primaryColor,
        ),
        drawer: ResponsiveWidget.isSmallScreen(context)
            ? Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: navButtons(),
                ),
              )
            : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  NavHeader(navButtons: navButtons()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  ProfileInfo(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  Projects(),
                  SocialInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedPadding(
        duration: Duration(seconds: 1),
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: ResponsiveWidget(
          largeScreen: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.25,
                color: Colors.blue,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.25,
                color: Colors.blue,
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.25,
                color: Colors.blue,
              ),
            ],
          ),
          smallScreen: Container(
            height: 100,
            width: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class NavHeader extends StatelessWidget {
  final List<Widget> navButtons;

  const NavHeader({Key key, this.navButtons}) : super(key: key);

  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ///PKDot(),
//          Spacer(),
          if (!ResponsiveWidget.isSmallScreen(context))
            Row(
              children: navButtons,
            )
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.deepOrange,
//            borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("mustaf.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "Ahmed\nMustafa",
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        //"A Google Developer Expert for Flutter, Dart & Web Tech.\n"
        //"I am also a youtuber having MTechViral youtube channel\n"
        //"where I make tutorials for technology.",
        "I'm a senior year Computer Science student at the IBA\n"
        "I'm passionate about software development and data science"
        "\nand I'm also the Android Lead for DSC - IBA this year.",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume"),
            color: Colors.red,
            onPressed: () {
              html.window.open(
                  "https://drive.google.com/file/d/1LM5x9Ffsy2kxJkI954FRiBdXh0RleOmU/view?usp=sharing",
                  "GDE");
            },
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("Say Hi!"),
            color: Colors.red,
            onPressed: () {
              html.window.open(
                  "https://www.linkedin.com/in/ahmed-mustafa-a2b249183/", "Pk");
            },
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }
}

class SocialInfo extends StatelessWidget {
  List<Widget> socialMediaWidgets() {
    return [
      MaterialButton(
          child: Icon(AntDesign.github, size: 50),
          onPressed: () {
            html.window.open("https://github.com/muzztafa", "Git");
          },
          padding: EdgeInsets.all(16),
          shape: CircleBorder()),
      MaterialButton(
          child: Icon(AntDesign.linkedin_square, size: 50),
          onPressed: () {
            html.window.open(
                "https://www.linkedin.com/in/ahmed-mustafa-a2b249183/",
                "LinkedIn");
          },
          padding: EdgeInsets.all(16),
          shape: CircleBorder()),
      MaterialButton(
          child: Icon(AntDesign.twitter, size: 50),
          onPressed: () {
            html.window.open("https://twitter.com/muzztafa_", "Git");
          },
          padding: EdgeInsets.all(16),
          shape: CircleBorder()),
    ];
  }

  Widget copyRightText() => Text(
        "Ahmed Mustafa ©️2020",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.grey,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: socialMediaWidgets(),
          ),
          copyRightText(),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ...socialMediaWidgets(),
          copyRightText(),
        ],
      ),
    );
  }
}
