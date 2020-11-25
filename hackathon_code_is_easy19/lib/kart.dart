import 'dart:core';

import 'package:MeBusca/root.dart';
import 'package:flutter/material.dart';

class KartPage extends StatefulWidget {
  KartPage({
    Key key,
  }) : super(key: key);

  @override
  _KartPageState createState() => _KartPageState();
}

class _KartPageState extends State<KartPage> {
  List<String> nomeFrutas = <String>['Abacaxi', 'Abacate', 'Bolacha'];
  List<String> tipoProduto = <String>['Fruta', 'Fruta', 'Biscoito'];
  List<String> quantidades = <String>['3', '4', '2'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: <Widget>[
          ListView(
            children: [
              //Parte superior da tela, com informações básicas sobre os itens mostrados
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Text(
                  'Carrinho',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  'Aqui estão os itens selecionados para a sua cesta de compras',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              //Lista com os produtos a serem exibidos

              ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: nomeFrutas.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 100,
                      child: Card(
                        color: Color.fromARGB(255, 255, 182, 193),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.all(5),
                                child: Image.network(
                                  'https://picsum.photos/id/1080/300/300',
                                )),
                            Container(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        nomeFrutas[index],
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(
                                      'Tipo: ' + tipoProduto[index],
                                      style: TextStyle(fontSize: 18),
                                      textAlign: TextAlign.left,
                                    )),
                                    Expanded(
                                        child: Text(
                                      'Quantidade: ' + quantidades[index],
                                      style: TextStyle(fontSize: 17),
                                      textAlign: TextAlign.left,
                                    ))
                                  ],
                                )),
                            Expanded(
                                child: Container(
                                    alignment: Alignment.centerRight,
                                    child: FlatButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Quantidade'),
                                                );
                                              });
                                        },
                                        child: Icon(
                                          (Icons.delete),
                                          size: 40,
                                          color: Colors.white,
                                        ))))
                          ],
                        ),
                      ));
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      color: Colors.lightGreen,
                      child: Text('Voltar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  VerticalDivider(),
                  Expanded(
                      child: RaisedButton(
                    color: Colors.red,
                    child: Text('Reservar'),
                    onPressed: () {
                      Future<TimeOfDay> selectedTime = showTimePicker(
                          initialTime: TimeOfDay.now(),
                          context: context,
                          helpText: 'Selecione o horário de busca',
                          cancelText: 'CANCELAR');
                    },
                  ))
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}

class KartTile extends StatelessWidget {
  final String nomeProduto;
  final String tipoProduto;
  final int quantidade;

  KartTile({this.nomeProduto, this.tipoProduto, this.quantidade});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Placeholder();
          }));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Row(
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.account_circle,
                  size: 70,
                  color: AppRoot.getColor(context, 'iconColor'),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Produto: ' + this.nomeProduto,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Tipo: ' + this.tipoProduto,
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Quantidade: ' + this.quantidade.toString(),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: AppRoot.getColor(context, 'second'),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
