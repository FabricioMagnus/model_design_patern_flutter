// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:model_design_patern_flutter/functions/formaters.dart';
import 'package:model_design_patern_flutter/services/api.dart';
import 'package:model_design_patern_flutter/services/vendedores.dart';

class Sellers extends StatefulWidget {
  const Sellers({super.key});

  @override
  State<Sellers> createState() => _SellersState();
}

class _SellersState extends State<Sellers> {
  TextEditingController searchController = TextEditingController(text: "");
  List<dynamic> sellers = [];

  setFormaterName(String name) {
    Formaters formater = Formaters();

    return formater.captionFormater(name);
  }

  getSellers() async {
    try {
      String token = await Api.getToken();

      VendedoresApi vendedoresApi = VendedoresApi(token);

      List<dynamic> vendedores =
          await vendedoresApi.getSellersApi(searchController.text);

      setState(() {
        sellers = vendedores;
      });
    } catch (e) {
      debugPrint("error: $e");
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
          "Erro na requisição de vendedores",
        ),
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    getSellers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(0xFFEDFBEE),
          appBar: AppBar(
            title: const Text("Vendedores"),
            titleTextStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Ação do botão de venda
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                ),
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 16),
                      labelText: "Pesquisar",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        getSellers();
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: sellers.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Representante",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Vendedor",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: setFormaterName(
                                    "${sellers[index]["nomeRepresentante"]}"),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: setFormaterName(
                                    "${sellers[index]["nomeVendedor"]}"),
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                    );
                  },
                ),
              )
            ],
          )),
    );
  }
}
