import 'package:flutter/material.dart';
import 'package:flutter_quizer_app_master/Database/databasemethods.dart';
import '../../../models/question.dart';
import '../check_answers/check_answers.dart';

class FinishedQuizPage extends StatefulWidget {
  final List<Question> questions;
  final Map<int, dynamic> answers;

  FinishedQuizPage({Key? key, required this.questions, required this.answers})
      : super(key: key) {}

  @override
  State<FinishedQuizPage> createState() => _FinishedQuizPageState();
}

class _FinishedQuizPageState extends State<FinishedQuizPage> {
  late int correctAnswers;

  @override
  Widget build(BuildContext context) {
    int correct = 0;
    this.widget.answers.forEach((index, value) {
      if (this.widget.questions[index].correctAnswer == value) correct++;
    });
    insertresult(correct, widget.questions.length - correct);
    final TextStyle titleStyle = TextStyle(
        color: Colors.black87, fontSize: 16.0, fontWeight: FontWeight.w500);
    final TextStyle trailingStyle = TextStyle(
        color: Theme.of(context).primaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        title: Text('Result', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.grey[100]),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Total Questions", style: titleStyle),
                  trailing: Text(
                    "${widget.questions.length}",
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Score", style: titleStyle),
                  trailing: Text(
                    "${correct / widget.questions.length * 100}%",
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Correct Answers", style: titleStyle),
                  trailing: Text(
                    "$correct/${widget.questions.length}",
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text("Incorrect Answers", style: titleStyle),
                  trailing: Text(
                    "${widget.questions.length - correct}/${widget.questions.length}",
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton(
                    child: Text("Goto Home",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  ElevatedButton(
                    child: Text("Check Answers",
                        style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => CheckAnswersPage(
                                questions: widget.questions,
                                answers: widget.answers,
                              )));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
