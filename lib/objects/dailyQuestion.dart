
//
//1 신체 테스트
//2 정신 테스트
//

var dailyQuestions =  [
  {
    'questionNumber': 1, //질문번호
    'questionText': "How was your sleep last night?",//질문 텍스트
    'answers': [1,2,3,4,5], //입력할 답안
    'item' :['<4', '4~5', '5~6', '6~7', '7+'] ,
    'domain': 1 //영역
  },
  {
    'questionNumber': 2,
    'questionText': "Are you sick or injured anywhere today?",
    'answers': [1,2],
    'item' :['Yes', 'No'] ,
    'domain': 1
  },
  {
    'questionNumber': 3,
    'questionText': "How much time do you use your cell phone today?",
    'answers': [1,2,3,4,5],
    'item' :['<3', '3~4', '4~5', '5~6', '6+'] ,
    'domain':1
  },
  {
    'questionNumber': 4 ,
    'questionText': "How was your appetite today?",
    'answers': [1,2,3],
    'item' :['Good', 'Soso', 'Bad',] ,
    'domain': 1
  },
  {
    'questionNumber': 5,
    'questionText': "How much time do you exercise today?",
    'answers': [1,2,3,4,5],
    'item' :['<0.5', '0.5~1', '1~1.5', '1.5~2', '2+'] ,
    'domain': 1
  },
  {
    'questionNumber': 6,
    'questionText': "Did you feel lonely and depressed today?",
    'answers': [1,2],
    'item' :['Yes', 'No'] ,
    'domain': 2
  },
  {
    'questionNumber': 7,
    'questionText': "Did you have a hard time organizing your thoughts and making a plan?",
    'answers': [1,2],
    'item' :['Yes', 'No'] ,
    'domain': 2
  },
  {
    'questionNumber': 8,
    'questionText': "How much stress have you felt today?",

    'answers': [1,2,3,4,5],
    'item' :['Never', 'Rare', 'Some', 'Often', 'Very Oft'] ,
    'domain': 2
  },
  {
    'questionNumber': 9,
    'questionText': "Were you honest about your feelings today?",

    'answers': [1,2,3,],
    'item' :['No', 'Normal', 'Yes'] ,
    'domain': 2
  },
  {
    'questionNumber': 10,
    'questionText': "When you look back on your day, how satisfied are you with your day?",

    'answers': [1,2,3,4,5],
    'item' :['Worst', 'Bad', 'Mediocre', 'Satisfied', 'Best'] ,
    'domain': 2
  },
];