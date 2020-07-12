import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_tester/constants.dart';
import 'Blocs/password.tester.bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Circular",
        scaffoldBackgroundColor: kWhite,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: new Stack(
          children: <Widget>[
            Container(
              height: size.height * .45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.centerRight,
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 70),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Align(
                          child: Container(
                            alignment: Alignment.center,
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              color: kOnix,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              "assets/icons/logo.svg",
                              color: kOrange,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Testador de senhas",
                          style: TextStyle(color: kWhite, fontSize: 16),
                        ),
                        Text(
                          "Teste a segurança da sua senha",
                          style: TextStyle(
                              color: Color(0xFFf1f1f1f1), fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 70, left: 30, right: 30, bottom: 25),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 15,
                            spreadRadius: -5,
                            color: kShadowColor,
                          )
                        ],
                      ),
                      child: TextField(
                        controller: textFieldController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: kKeppel.withAlpha(200)),
                            icon: SvgPicture.asset("assets/icons/icon.svg"),
                            border: InputBorder.none),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      child: Column(
                        children: <Widget>[
                          CheckItem(
                            textItem: "Contém no mínimo 8 caracteres",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CheckItem(
                            textItem: "Possui numeros",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CheckItem(
                            textItem: "Possui caracteres especiais",
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CheckItem(
                            textItem: "Letras maiúsculas",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Container(
                        height: 55,
                        width: 330,
                        decoration: BoxDecoration(
                          color: kCinnabar,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 17),
                              blurRadius: 15,
                              spreadRadius: -5,
                              color: kCinnabar.withAlpha(99),
                            )
                          ],
                        ),
                        child: FlatButton(
                          onPressed: () {
                            validarDados(textFieldController);
                          },
                          child: Text(
                            "Testar Senha",
                            style: TextStyle(color: kWhite),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CheckItem extends StatefulWidget {
  const CheckItem({
    Key key,
    this.textItem,
  }) : super(key: key);

  final String textItem;

  @override
  _CheckItemState createState() => _CheckItemState();
}

class _CheckItemState extends State<CheckItem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 9,
          width: 9,
          decoration: BoxDecoration(
            color: Color(0xFFC4C4C4),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          widget.textItem,
          style: TextStyle(color: kKeppel, fontSize: 12),
        ),
      ],
    );
  }
}
