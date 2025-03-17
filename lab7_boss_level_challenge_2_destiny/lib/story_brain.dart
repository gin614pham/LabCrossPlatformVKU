import 'story.dart';

class StoryBrain {
  int _storyIndex = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle:
          'Bạn là thám tử Amelia Watson. Một bức thư nặc danh gửi đến văn phòng của bạn với nội dung:\n\n'
          '"Có điều gì đó không ổn. Họ không phải con người bình thường. Hãy tìm sự thật trước khi quá muộn."',
      choice1: 'Đến biệt thự bỏ hoang ngay lập tức.',
      choice2: 'Tìm thêm thông tin về họ trước.',
    ),
    Story(
      storyTitle:
          'Bạn đến biệt thự bỏ hoang và thấy cánh cửa chính mở toang. Có dấu hiệu của một cuộc ẩu đả. '
          'Bên trong tối đen, chỉ có ánh sáng mờ nhạt từ một căn phòng phía xa.',
      choice1: 'Bước vào và điều tra ngay.',
      choice2: 'Ẩn nấp quan sát từ xa xem có ai ở đó không.',
    ),
    Story(
      storyTitle:
          'Bạn tìm kiếm thông tin về nhóm người được nhắc đến và phát hiện rằng họ là những sinh vật huyền thoại sống '
          'giữa con người. Họ bao gồm:\n\n'
          '- **Calliope Mori**: Thần chết có nhiệm vụ dẫn dắt linh hồn.\n'
          '- **Ninomae Ina’nis**: Người nắm giữ sức mạnh của Cthulhu.\n'
          '- **Gawr Gura**: Một người cá bí ẩn.\n'
          '- **Takanashi Kiara**: Một phượng hoàng bất tử.\n\n'
          'Có vẻ như họ đang che giấu một bí mật lớn.',
      choice1: 'Tiếp tục đến biệt thự để điều tra.',
      choice2: 'Liên lạc với một trong số họ để hỏi chuyện.',
    ),
    Story(
      storyTitle:
          'Bạn bước vào biệt thự và tìm thấy một tấm bản đồ kỳ lạ với những ký tự không xác định. '
          'Có vẻ như đây là một dạng cổ ngữ liên quan đến phép thuật. '
          'Ngay lúc đó, một giọng nói vang lên phía sau bạn.',
      choice1: 'Quay lại ngay lập tức.',
      choice2: 'Tiếp tục kiểm tra bản đồ mà không để lộ mình đã nghe thấy gì.',
    ),
    Story(
      storyTitle:
          'Bạn ẩn nấp và quan sát từ xa. Bỗng bạn thấy một bóng người thấp bé chạy khỏi biệt thự. '
          'Khi nhìn kỹ hơn, đó chính là **Gawr Gura** – nhưng cô ấy đang trông rất lo lắng và hoảng sợ.',
      choice1: 'Đuổi theo Gura để tra hỏi cô ấy.',
      choice2: 'Tiếp tục quan sát xem có ai khác rời khỏi biệt thự không.',
    ),
  ];

  void nextStory(int choice) {
    if (_storyIndex == 0 && choice == 1) {
      _storyIndex = 1;
    } else if (_storyIndex == 0 && choice == 2) {
      _storyIndex = 2;
    } else if (_storyIndex == 1 && choice == 1) {
      _storyIndex = 3;
    } else if (_storyIndex == 1 && choice == 2) {
      _storyIndex = 4;
    } else if (_storyIndex == 2 && choice == 1) {
      _storyIndex = 1;
    } else if (_storyIndex == 2 && choice == 2) {
      _storyIndex = 4;
    } else {
      _storyIndex = 0;
    }
  }

  String getStory() {
    return _storyData[_storyIndex].storyTitle;
  }

  String getChoice1() {
    return _storyData[_storyIndex].choice1;
  }

  String getChoice2() {
    return _storyData[_storyIndex].choice2;
  }
}
