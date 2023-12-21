import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quizer_app_master/block_theme/theme_bloc.dart';
import '../../../models/category.dart';
import '../../../models/question.dart';
import '../resultspage/quiz_finished.dart';
import 'package:html_unescape/html_unescape.dart';

class QuizPage extends StatefulWidget {
  final List<Question> questions;
  final Category category;

  const QuizPage({Key? key, required this.questions, required this.category})
      : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  PageController _pageController = PageController();
  final TextStyle _questionStyle = TextStyle(
      fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black);

  int _currentIndex = 0;
  final Map<int, dynamic> _answers = {};
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Question question = widget.questions[_currentIndex];
    final List<dynamic> options = question.incorrectAnswers;
    if (!options.contains(question.correctAnswer)) {
      options.add(question.correctAnswer);
      options.shuffle();
    }

    return Scaffold(
      key: _key,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            showDialog<bool>(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    content: Text(
                        "Are you sure you want to quit the quiz? All your progress will be lost."),
                    title: Text("Warning!"),
                    actions: <Widget>[
                      ElevatedButton(
                        child: Text("Yes"),
                        onPressed: () {
                          Navigator.pop(context, true);
                          Navigator.pop(context, true);
                        },
                      ),
                      ElevatedButton(
                        child: Text("No"),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      ),
                    ],
                  );
                });
          },
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          widget.category.name,
        ),
        elevation: 0,
      ),
      body: PageView.builder(
          scrollBehavior: ScrollBehavior(),
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (value) {},
          itemCount: widget.questions.length,
          itemBuilder: (context, _currentIndex) {
            return BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themestate) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(

                        color: themestate.isDarkTheme
                            ? Colors.grey[800]
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    CircleAvatar(
                                      child: Text("${_currentIndex + 1}"),
                                    ),
                                    SizedBox(width: 16.0),
                                    Expanded(
                                      child: Text(
                                        HtmlUnescape().convert(widget
                                            .questions[_currentIndex].question),
                                        softWrap: true,
                                        style:
                                            MediaQuery.of(context).size.width >
                                                    800
                                                ? _questionStyle.copyWith(
                                                    fontSize: 30.0)
                                                : _questionStyle.copyWith(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.0),
                                Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ...options.map((option) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: themestate.isDarkTheme
                                                      ? Colors.grey[600]
                                                      : Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: RadioListTile<dynamic>(
                                                title: Text(
                                                  HtmlUnescape()
                                                      .convert("$option"),
                                                  style: MediaQuery.of(context)
                                                              .size
                                                              .width >
                                                          800
                                                      ? TextStyle(
                                                          fontSize: 30.0)
                                                      : TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                ),
                                                groupValue:
                                                    _answers[_currentIndex],
                                                value: option,
                                                onChanged: (value) {
                                                  setState(() {
                                                    _answers[_currentIndex] =
                                                        option;
                                                  });
                                                },
                                              ),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.bottomCenter,
                    child: ButtonTheme(
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      minWidth: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        child: Text(
                          _currentIndex == (widget.questions.length - 1)
                              ? "Submit"
                              : "Next",
                          style: MediaQuery.of(context).size.width > 800
                              ? TextStyle(fontSize: 30.0)
                              : TextStyle(color: Colors.white),
                        ),
                        onPressed: _nextSubmit,
                      ),
                    ),
                  )
                ],
              );
            });
          }),
    );
  }

  void _nextSubmit() {
    if (_currentIndex < (widget.questions.length - 1)) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      setState(() {
        _currentIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (_) => FinishedQuizPage(
              questions: widget.questions, answers: _answers)));
    }
  }
}
