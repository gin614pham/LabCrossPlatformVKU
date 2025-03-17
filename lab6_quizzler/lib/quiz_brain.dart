import 'question.dart';

class QuizBrain {
  int _questionIndex = 0;

  final List<Question> _questionBank = [
    Question('Amelia Watson là một thám tử.', true),
    Question('Gawr Gura có nguồn gốc từ Atlantis.', true),
    Question('Mori Calliope là một thiên thần bảo hộ.', false),
    Question('Takanashi Kiara sở hữu một nhà hàng gà rán.', true),
    Question('Ninomae Ina\'nis có thể điều khiển sức mạnh từ Eldritch.', true),
    Question('Gawr Gura là VTuber có lượt đăng ký cao nhất Hololive.', true),
    Question('Amelia Watson có thể điều khiển thời gian.', true),
    Question('Takanashi Kiara sợ nước.', false),
    Question('Mori Calliope thích rap và âm nhạc.', true),
    Question('Ninomae Ina\'nis có một chiếc bút lông kỳ bí.', true),
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
