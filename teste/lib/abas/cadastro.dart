import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste/widgets/layoutApp.dart';
import '../controller.dart';

class CadastroPage extends StatefulWidget {
  static String tag = 'cadastroPage';

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final controller = Controller();

  _textField(
      {String labelText, obscureText, onChanged, String Function() errorText}) {
    return TextField(
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 10, left: 40, right: 40),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              alignment: Alignment(0.0, 1.15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image:
                      AssetImage('assets/images/iconeOfertas1.png'), //trocar ;(
                  fit: BoxFit.scaleDown,
                ),
              ),
              child: Container(
                height: 60,
                width: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1.0],
                    colors: [
                      LayoutApp.primaryTudodBom, // COR
                      LayoutApp.primaryTudodBom[600] // COR
                    ],
                  ),
                  border: Border.all(
                    width: 4.0,
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(60),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Observer(
              builder: (_) {
                return _textField(
                    obscureText: false,
                    errorText: controller.validateName,
                    labelText: "Nome",
                    onChanged: controller.client.changeName);
              },
            ),
            SizedBox(
              height: 10.0,
            ),
            Observer(builder: (_) {
              return _textField(
                  obscureText: false,
                  errorText: controller.validateEmail,
                  labelText: "Email",
                  onChanged: controller.client.changeEmail);
            }),
            SizedBox(
              height: 10.0,
            ),
            Observer(builder: (_) {
              return _textField(
                  obscureText: false,
                  errorText: controller.validateCpf,
                  labelText: "CPF",
                  onChanged: controller.client.changeCpf);
            }),
            SizedBox(
              height: 10.0,
            ),
            Observer(builder: (_) {
              return _textField(
                  errorText: controller.validatePassword,
                  labelText: "Senha",
                  obscureText: true,
                  onChanged: controller.client.changePassword);
            }),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 60,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1.0],
                  colors: [
                    LayoutApp.primaryTudodBom, // COR
                    LayoutApp.primaryTudodBom[600] // COR
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: SizedBox.expand(
                child: Observer(
                  builder: (_) {
                    return FlatButton(
                      onPressed: () {},
                      child: Center(
                        child: Text(
                          "Cadastrar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              height: 40.0,
              alignment: Alignment.center,
              child: FlatButton(
                child: Text(
                  'Esqueci a senha',
                  textAlign: TextAlign.center,
                ),
                onPressed: () =>
                    Navigator.of(context).pushNamed('esqueciSenha'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
