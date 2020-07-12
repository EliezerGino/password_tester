import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:password_tester/constants.dart';

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
  final TextEditingController passwordController = TextEditingController();

  String passwordResult = "Resutado";

  Color colorTrue;

  validarDados(textFieldController) {
    String senha = textFieldController.text;
    int forca = 0;

    if ((senha.length >= 4) && (senha.length <= 7)) {
      forca += 10;
    } else if (senha.length > 7) {
      forca += 25;
    }
    if ((senha.length >= 5) && (senha.contains(new RegExp(r'[a-z]')))) {
      forca += 10;
    }
    if ((senha.length >= 6) && (senha.contains(new RegExp(r'[A-Z]')))) {
      forca += 20;
    }
    if ((senha.length >= 5) && (senha.contains(new RegExp(r'[@#$%^&*_]')))) {
      forca += 25;
    }

    mostrarFoorca(forca);
  }

  mostrarFoorca(forca) {
    setState(() {
      if (forca < 30) {
        passwordResult = "Senha Fraca";
      } else if ((forca >= 30) && (forca < 50)) {
        passwordResult = 'Senha Media';
      } else if ((forca >= 50) && (forca < 70)) {
        passwordResult = 'Senha Forte';
      } else if ((forca >= 70) && (forca < 100)) {
        passwordResult = 'Senha Exelente';
      }
    });
  }

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
                        controller: passwordController,
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
                            validarDados(passwordController);
                          },
                          child: Text(
                            "Testar Senha",
                            style: TextStyle(
                                color: kWhite, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      child: Container(
                        alignment: Alignment.center,
                        height: 44,
                        width: 44,
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(3, 0),
                              blurRadius: 15,
                              spreadRadius: -5,
                              color: kCinnabar.withAlpha(99),
                            )
                          ],
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
                    Text(passwordResult)
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
