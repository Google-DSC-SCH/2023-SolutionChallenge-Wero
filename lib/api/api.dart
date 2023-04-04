//사용할 api 전부선언
Map<String, String> requestHeaders = {
  'accessToken': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJwcm92aWRlciI6Imdvb2dsZSIsImVtYWlsIjoiZGlub2hqYjIzMzFAZ21haWwuY29tIiwiaWF0IjoxNjgwNTQxMjgwLCJleHAiOjE2ODA2Mjc2ODB9.rSXTeZY0gH91mFBoa0gXe8Irwv_nzwYNj04m5oE-b20',
  'refreshToken': '746ecb9f-91f1-44ac-bed2-6ccb7c19b3b0'
};

class API {
  static const hostConnectUrl = 'http://34.170.144.171:9999/';
  //seonghokim.com:9999
  static const socialLoginUrl = 'http://seonghokim.com:9999/oauth2/authorization/google'; //Get 소셜로그인
  static const userInfoSaveUrl = '${hostConnectUrl}api/user/info';//사용자 개인 정보 입력 후 저장 Post

  //MBTI
  static const enterMbtiUrl = '${hostConnectUrl}api/mbti';//Get MBTI 페이지 진입
  static const modifyMbtiUrl = '${hostConnectUrl}/api/mbti/test';// Put MBTI 검사 등록 및 수정

  //Board
  static const enterCommunityUrl = '${hostConnectUrl}api/board'; //Get 게시판 페이지 진입
  static const rgistCommunityUrl = '${hostConnectUrl}api/board'; //Post 게시판 등록
  static const correctCommunityUrl = '${hostConnectUrl}api/board/';//Put 게시판 수정 뒤에 /게시글 아이디 붙여야함
  static const deleteCommunityUrl = '${hostConnectUrl}api/board/'; //Delete 게시판 삭제  게시글 ID url

  //Reply
  static const enterCommentUrl = '${hostConnectUrl}api/reply/';//Get 댓글 페이지 진입 - 게시판id
  static const registCommentUrl = '${hostConnectUrl}api/reply/';//Post 댓글 등록 - 게시판 id 뒤에 추가
  static const correctCommentUrl = '${hostConnectUrl}api/reply/';//Put 댓글 수정 - 게시판 id 뒤에 추가
  static const deleteCommentUrl = '${hostConnectUrl}api/reply/';//Delete 댓글 삭제 - 게시판 id 뒤에 추가

  //Diary
  static const enterDiaryUrl = '${hostConnectUrl}api/diary';// Get 일기조회 날짜별
  static const registDiaryUrl = '${hostConnectUrl}api/diary';// Post 일기등록

  //DailyTest
  //daily paging 변경
  static const enterDailyGraphUrl = '${hostConnectUrl}api/daily/paging?page=0&size=7';//Get 데일리 그래프 페이징
  static const saveDailyScoreUrl = '${hostConnectUrl}/api/daily/test';//Post 점수 저장
}

//로그인시 엑세스토큰 NULL여부 체크로 사용자 정보입력창, mbti 검사창 처리
