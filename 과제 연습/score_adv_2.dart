// 파일을 읽고 쓰는 기능(File 클래스)를 사용하기 위해 필요
import 'dart:io';

// Score 부모 클래스 정의해주기 (점수 표현)
class Score {
  int score; // int 타입의 score 변수 선언 (점수 값을 저장하는 변수)
  Score(this.score); // 생성자. this.score는 클래스의 score 변수를 의미
  void showInfo() {
    // showInfo()라는 메서드함수 정의
    print('점수: $score'); // $score는 변수 값을 문자열에 넣는 방법
  }
}

// 자식 클래스 시작
class StudentScore extends Score {
  // extends는 Score 클래스를 상속받겠다.
  String name; // name 변수 선언 (학생 이름 저장)
  StudentScore(
    this.name,
    super.score,
  ); // 생성자임. 상속받은 StudentScore에 score 포함되어있음. super로 같이 가져가겠다.

  @override // 부모 생성자를 다시 정의합니다.
  void showInfo() {
    // 정의로 인해 부모의 showInfo와 내용이 달라
    print('이름: $name, 점수: $score'); // 변수값을 문자열에 넣어주기
  }
}

// 파일 읽기 함수
List<StudentScore> loadStudentData(String filePath) {
  // loadSt..: 함수이름, String file: 매개변수, List<std>: 반환타입
  List<StudentScore> students = []; // 빈 리스트를 만듬, 나중에 여기에 학생 객체들을 추가 할 예정

  try {
    // try: 에러 발생할 수 있는 코드를 실행, 에러나면 catch 블록으로 감
    final file = File(filePath); // File 객체를 만들고, filePath에 있는 파일을 가르킴
    final lines = file
        .readAsLinesSync(); // 파일의 모든 줄을 읽어서 리스트로 만듬, Sync는 파일을 다 읽을 때까지

    for (var line in lines) {
      // line의 각 줄을 하나씩 꺼내서 반복.
      final parts = line.split(
        ',',
      ); // split은 쉼표 기준으로 문자열을 나눔. ex. parts[0]은 홍길동, parts[1]은 90
      if (parts.length != 2)
        throw FormatException('잘못된 데이터 형식: $line'); // 데이터가 정확히 2개가 아닐 경우, 에러 발생
      String name = parts[0]; // parts[0]은 첫번째 값이름을 name 변수에 저장
      int score = int.parse(parts[1]); // int.parse() int90을 문자열로 변환

      // StudentScore 객체 생성 및 추가
      StudentScore student = StudentScore(
        name,
        score,
      ); // 객체를 생성했음 => ex. StudentScore('홍길동', 90)
      students.add(student); // 리스트에 학생 객체를 추가해줌
    }
  } catch (e) {
    // 에러 발생 시에 여기로 옴. e는 에러 정보를 담음, 에러 메세지 출력하고 빈 리스트를 반환
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return students; // 반복문이 끝나면 students 리스트를 반환 (여기서 함수 호출한 곳에서 학생 리스트를 받을 수 있음!)
}
