
/*
식습관
 1
활동성
2
자존감
3
대인성
4
 */

var mbtiQuestions =  [
  {
    'questionNumber': 1, //질문번호
    'questionText': "I eat meals at the following frequencies per day",//질문 텍스트
    'answers': [1,2,3,4,5], //입력할 답안
    'score' : 3, //체크된 변수
    'domain': 1 //영역
  },
  {
    'questionNumber': 2,
    'questionText': "When I have a meal, I eat rice in the following amounts",
    'answers': [1,2,3,4,5],
    'domain': 1
  },
  {
    'questionNumber': 3,
    'questionText': "It takes me the following amount of time to finish a meal",
    'answers': [1,2,3,4,5],
    'domain':1
  },
  {
    'questionNumber': 4 ,
    'questionText': "I eat midnight snack at the following frequencies",
    'answers': [1,2,3,4,5],
    'domain': 1
  },
  {
    'questionNumber': 5,
    'questionText': "I have drinking gatherings at the following frequencies",
    'answers': [1,2,3,4,5],
    'domain': 1
  },
  {
    'questionNumber': 6,
    'questionText': "When I drink alcohol, I consume the following amounts",

    'answers': [1,2,3,4,5],
    'domain': 1
  },
  {
    'questionNumber': 7,
    'questionText': "I eat instant food, fried food, etc. at the following frequencies",

    'answers': [1,2,3,4,5],
    'domain': 1
  },
  {
    'questionNumber': 8,
    'questionText': "I drink water as follows per day",

    'answers': [1,2,3,4,5],
    'domain': 1
  },
  {
    'questionNumber': 9,
    'questionText': "It takes me the following amount of time to lie down after eating",

    'answers': [1,2,3,4,5],
    'domain': 1
  },
  {
    'questionNumber': 10,
    'questionText': "I smoke cigarettes as follows per day",

  'answers': [1,2,3,4,5],
    'domain': 1
  },
  {
    'questionNumber': 11,
    'questionText':"My occupation belongs to the following category",

    'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 12,
    'questionText': "I often feel tired after finishing work/daily routine.",

    'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 13,
    'questionText': "I sweat a lot at work/school.",

    'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 14,
    'questionText': "Compared to others in the same age group, my occupation is physically demanding.",

    'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 15,
    'questionText': "I exercise the following number of times per week.",

    'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 16,
    'questionText': "Compared to others in the same age group, I engage in relatively less physical activity.",

    'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 17,
    'questionText': "I often sweat even when I am not doing anything.",

  'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 18,
    'questionText': "I spend the following amount of time on my phone during my leisure time.",

    'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 19,
    'questionText': "On average, I walk the following amount of time per day.",

    'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 20,
    'questionText': "My average daily sleep time is the following.",

  'answers': [1,2,3,4,5],
    'domain': 2
  },
  {
    'questionNumber': 21,
    'questionText': "When I do what I want to do, I feel confident and can easily start.",

    'answers': [1,2,3,4,5],
    'domain':3
  },
  {
    'questionNumber': 22,
    'questionText': "I make an effort to maintain a healthy lifestyle on a regular basis, which helps me reduce stress.",

    'answers': [1,2,3,4,5],
    'domain': 3
  },
  {
    'questionNumber': 23,
    'questionText':"It feels good to praise myself when I do something well.",

    'answers': [1,2,3,4,5],
    'domain': 3
  },
  {
    'questionNumber': 24,
    'questionText': "I am aware of my weaknesses and make an effort to improve them.",

    'answers': [1,2,3,4,5],
    'domain': 3
  },
  {
    'questionNumber': 25,
    'questionText': "I am not too obsessed with being perfect at everything and I am satisfied with doing my best.",

    'answers': [1,2,3,4,5],
    'domain': 3
  },
  {
    'questionNumber': 26,
    'questionText':"I tend to criticize myself often when I make mistakes.",

    'answers': [1,2,3,4,5],
    'domain': 3
  },
  {
    'questionNumber': 27,
    'questionText': "I frequently feel satisfied with the life I am living.",

    'answers': [1,2,3,4,5],
    'domain': 3
  },
  {
    'questionNumber': 28,
    'questionText': "I feel proud of myself when I accomplish something and like to brag about it to others.",

    'answers': [1,2,3,4,5],
    'domain': 3
  },
  {
    'questionNumber': 29,
    'questionText': "I believe that having confidence and enjoying what I am doing can lead to better results.",

    'answers': [1,2,3,4,5],
    'domain': 3
  },
  {
    'questionNumber': 30,
    'questionText': "I generally maintain a positive attitude about what I am doing and make an effort to reduce stress.",
    'answers': [1,2,3,4,5],
    'domain':3
  },
  {
    'questionNumber': 31,
    'questionText': "I am very observant and act accordingly.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
  {
    'questionNumber': 32,
    'questionText': "I am satisfied with the people around me.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
  {
    'questionNumber': 33,
    'questionText': "I understand my own emotions well.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
  {
    'questionNumber': 34,
    'questionText': "I understand the emotions of others well.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
  {
    'questionNumber': 35,
    'questionText': "I find it difficult to communicate with others.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
  {
    'questionNumber':36,
    'questionText': "I take the lead in conversations in group settings.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
  {
    'questionNumber': 37,
    'questionText': "I often hear that I have a good personality.",
    'answers': [1,2,3,4,5],
    'domain':4
  },
  {
    'questionNumber': 38,
    'questionText': "I have a strong sense of self-assertion.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
  {
    'questionNumber': 39,
    'questionText': "I am not worried about my future interpersonal relationships.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
  {
    'questionNumber': 40,
    'questionText':"I am interested in others.",

    'answers': [1,2,3,4,5],
    'domain': 4
  },
];