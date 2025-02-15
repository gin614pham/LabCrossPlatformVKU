import 'question.dart';

class QuizBrain {
  int _questionIndex = 0;

  final List<Question> _questionBank = [
    Question('Flutter được phát triển bởi Google.', true),
    Question('Flutter chỉ hỗ trợ lập trình Android.', false),
    Question('Dart là ngôn ngữ chính của Flutter.', true),
    Question('StatelessWidget có thể thay đổi trạng thái.', false),
  ];

  void nextQuestion() {
    if (_questionIndex < _questionBank.length - 1) {
      _questionIndex++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionIndex].questionText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionIndex].questionAnswer;
  }
}
