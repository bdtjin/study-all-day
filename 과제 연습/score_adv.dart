// import 'dart:io';
// import 'package:score_advanced/score_adv_lib.dart';

// void main() {
  // List<StudentScore> 학생 정보 불러오기, txt 파일 students에 저장
  // List<StudentScore> studentList = loadStudentData('lib/model/students.txt');
  // print('어떤 학생의 점수를 확인하시겠습니까?');
  // String userInput = stdin.readLineSync()!; // 사용자의 입력을 받아서 문자열로 반환
  // print(userInput);

  // 상황: studentList = [홍길동,김철수] => 1번리스트는 홍길동, 2번리스트는 김철수
  // case 1 사용자 입력이 홍길동이라고 했을 때
  // 1-1. 첫번째 비교 반복 for -> if 홍길동 동일 확인 -> print = 이름: 홍길동, 점수: 90
  // 1-2. 두번째 비교 반복 for -> if 입력값은 홍길동, 리스트는 김철수 -> false라서 else if로 넘어감 ->  else if 문 print
  // 최종 출력값 => 이름: 홍길동, 점수: 90 / 잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.

  // break 넣었을 때 출력값 => 이름: 홍길동, 점수:90

  // 상황: studentList = [홍길동,김철수]
  // case 2. 사용자 입력이 김철수 일때
  // 2-1. 첫번째 비교 반복 for -> if 입력값은 김철수, 리스트는 홍길동 -> false라서 else if로 넘어감 -> else if 문 print
  // 2-2. 두번째 비교 반복 for -> if 입력값, 리스트 김철수 동일 -> if 문 print 이름: 김철수, 점수: 80
  // 최종 출력값 => 잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요. / 이름: 김철수, 점수: 80

  // 상황: studentList = [홍길동,김철수]
  // case 3. 사용자 입력이 abc일 때,
  // 3-1. 첫번째 비교 반복 for -> if 입력값 abc, 리스트에 없음 -> false라서 else if로 넘어감 -> else if print
  // 3-2. 두번째 비교 반복 for -> if 입력값 abc, 리스트에 없음 -> false라서 else if로 넘어감 -> else if print
  // 최종 출력값 => 잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요. / 잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.

//   for (var student in studentList) {
//     if (student.name == userInput) {
//       print('이름: ${student.name}, 점수: ${student.score}');
//     } else if (student.name != userInput) {
//       print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
//     }
//   }
// }
//         // break;