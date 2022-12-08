import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/model/questionModel.dart';

class Home2 extends StatefulWidget {
  Home2(@required this.questionId);
  int questionId;
  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  Future<List<QuestionModel>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/question1.json');
    // final responseString = await json.decode(response);
    return questionModelFromJson(response);
  }

  int? _mark;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Home'),
        ),
        body: FutureBuilder<List<QuestionModel>?>(
            future: readJson(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final listQuestiion = snapshot.data;

                final finalQuestion = listQuestiion
                    ?.where((element) => element.id == widget.questionId)
                    .first;
                print(finalQuestion?.id);
                return Container(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("${finalQuestion?.question}"),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: finalQuestion?.answer.length,
                          itemBuilder: (BuildContext ctxt, int index2) {
                            return RadioListTile(
                              title: Text(finalQuestion!.answer[index2].value),
                              value: finalQuestion.answer[index2].mark,
                              groupValue: _mark,
                              onChanged: (value) {
                                setState(() {
                                  print(value.toString());
                                  _mark = int.parse(value.toString());
                                });
                              },
                            );
                          }),
                      Container(
                        margin: EdgeInsets.all(25),
                        child: FlatButton(
                          child: Text(
                            'Next',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Home2(widget.questionId + 1),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ));
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
