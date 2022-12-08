// To parse this JSON data, do
//
//     final questionModel = questionModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

List<QuestionModel> questionModelFromJson(String str) =>
    List<QuestionModel>.from(
        json.decode(str).map((x) => QuestionModel.fromJson(x)));

String questionModelToJson(List<QuestionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel {
  QuestionModel({
    required this.id,
    required this.question,
    required this.answer,
  });
  int id;
  String question;
  List<Answer> answer;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"],
        question: json["question"],
        answer:
            List<Answer>.from(json["answer"].map((x) => Answer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": List<dynamic>.from(answer.map((x) => x.toJson())),
      };
}

class Answer {
  Answer({
    required this.value,
    required this.mark,
  });

  String value;
  int mark;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        value: json["value"],
        mark: json["mark"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "mark": mark,
      };
}
