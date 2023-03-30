# 2023-wero-Solution-Challenge-server

<br>

# Wero: A health protector for all of us

<img width="204" alt="image" src="https://user-images.githubusercontent.com/82595288/228839635-92427d9b-3475-4310-8e81-45162fd4a8d0.PNG">

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
[![All Contributors](https://img.shields.io/badge/all_contributors-4-orange.svg?style=flat-square)](#Contributors)

2023 GDSC Solution Challenge Project

# Index
- [Getting Start](#getting-start)
- [Skills](#skills)
- [Google Technology](#google-technology)
- [Architecture](#architecture)
- [Functions](#functions)
  - [PATI](#pati)
  - [Daily Test & Graph](#daily-test-&-graph)
  - [Diary](#diary)
  - [Notice Board](#notice-board)
  - [Recommendation](#recommendation)
  - [Group Therapy](#group-therapy)
- [Expected Effect](#expected-effect)
- [How to run this application](#how-to-run-this-application)
- [Contributor](#contributor)

<br>
<hr>
<br>

# Getting-Start



### About Health

<p align="center">
<img width="500" alt="image" src="https://user-images.githubusercontent.com/82595288/228840596-f94e6248-8d52-4a7d-a6ac-16b23566fcac.png">  

  
***`Don't give up! We're always by your side.`***
  
  Health refers to a state in which the body and mind are functioning well without any pain or discomfort. It signifies complete functioning and well-being in terms of an individual's ***physiological***, ***psychological***, and ***social aspects***. Health is associated with vitality, energy, and quality of life that we experience on a daily basis.
  
### The importance of health
The growing emphasis on the significance of health in today's society is ***undeniable***, as it holds a prime position among the most crucial values in our lives. When we possess good health, it enables us to pursue more and lead a contented life. Conversely, if our health is poor, it may bring discomfort in daily activities and cause a decline in the quality of our lives. Therefore, maintaining good health is pivotal, as it constitutes one of the most critical factors that contribute to enhancing the overall happiness and quality of our lives.
  
### Physical health
  - Physical health refers to the state of the body being healthy and full of energy.
  - Maintaining physical health is important through regular exercise and proper eating habits, among other factors.
  - When physical health is good, individuals can do more in their daily lives, and having a healthy body is necessary for maintaining good mental health as well.

### Mental health
  - Mental health refers to a healthy and stable state of mind.
  - Good mental health leads to a happier life and can also contribute to maintaining good physical health.
  - Maintaining mental health requires managing stress, getting enough rest and sleepand practicing proper self-care, among other things.
  

## What is Sustainable Development Goals?

![image](https://user-images.githubusercontent.com/33146152/160327143-e36bb1b9-ccea-4f96-b3b2-d92338dd56c5.png)

The Sustainable Development Goals (SGDs) or Global Goals are a collection of 17 interlinked global goals designed to be a "blueprint to achieve a better and more sustainable future for all.
As can be seen in the figure above, there are 17 goals.

### Our goal
We decided to create a Flutter application with the goal of ensuring health and promoting well-being for all age groups, among the United Nations' 17 sustainable development goals (SDGs). After the COVID-19 pandemic, we came across an article stating that there is a significant increase in people's interest in health. After reading this article, we began developing an application with the main idea of diagnosing the health status of people all over the world and managing their health through the application, especially for those who are too busy to take care of their health.
  
#### Good Health and Well-Being

<img width="143" alt="image" src="https://user-images.githubusercontent.com/33146152/160327288-21a43bdc-3de2-4d36-a26e-9953dc86bc4f.png">
Wero is an application that can manage physical health as well as mental health, and furthermore build consensus based on physical and health levels rather than specific age groups.

### The reason why we named "Wero"
![image](https://user-images.githubusercontent.com/82595288/228853918-aa32e6e4-3823-4547-8845-95c0c072c8ec.png)
  
"Wero" means "Consolation" in Korean. Additionally, "Wero" is an abbreviation of "We are around u," which represents our commitment to always be by the user's side, managing their physical and mental health. With the slogan "When you feel tired and exhausted, join us. I'm always waiting for you in this place," "Wero" is an app that provides users with the gift of health.

<br>
<hr>
<br>

# Skills

### Backend
- Java 11
- Spring Boot 2.7.6
- Spring Security 2.7.6
- Spring Data JPA 2.7.6
- Gradle 7.6.1
- Swagger 3.0
- JWT 0.11.2
- Google Cloud Platform(GCP
  - Compute Engine(VM Instance - Ubuntu18.04)
  - SQL(MySQL 8.0)  
  - Cloud Storage
  - API & Services(OAuth2 - Social login)
  - Cloud DNS
- MySQL 8.0.2
- DBeaver
- Intellij

### App
- Flutter 3.7.5
- Dart 2.19.2
- Intellij

### Machine Learing
- Python 3.8.8
- Tensorflow 2.11.0 
- Keras 2.11.0
- Numpy 1.21.0
- Pandas 1.2.3 
- Anaconda 4.9.2
- Jupyter notebook 6.2.0

### Design
- Adobe XD
- Illustrator

<br>
<hr>
<br>

# Google-Technology

![image](https://user-images.githubusercontent.com/74396651/228865073-9f8befde-2106-4a73-907d-5957978afaa6.png)


<br>
<hr>
<br>

# Architecture

![image](https://user-images.githubusercontent.com/74396651/228843955-9e522fea-e780-49c7-abf2-7a221a7a7ad7.png)


<br>
<hr>
<br>

# Functions

### PATI

<사진 영역>

> We transformed the existing MBTI into PATI, which is WERO's MBTI. You can check the PATI type corresponding to your physical and mental health through 40 questions related to physical and mental health. Physical health and mental health are the criteria for PATI, and physical health can be checked through eating habits and activities, and mental health can be checked through self-esteem and interpersonal relationships.

- Define PATI type through animals
  - **Eating habits (E, H) (elephant, hamster), activity (B, S) (Beagle, Sloth))**
  - **Self-esteem (L, M) (Lion, Meerkat), interpersonal relationships (C, F) (Cafibara, Fox)**

<br>

### Daily-Test-&-Graph

<사진 영역>

> You can check 10 questions about physical and mental health every day and how you feel on the day through emoticons. Check your mental and physical health through your test results and provide support messages based on accumulated scores and mood emoticons over the past 7 days! And also You can check the score from the Daily Test on the graph for 7 days!

<br>

### Diary

<사진 영역>

> You can write a diary at the end of the day! Through the date lookup function of the calendar, you can check how I was in the past. For your information, modifications are not possible to fully remember how you felt that day!

<br>

### Notice-Board

<사진 영역>

> You can post your concerns about your body and health according to the bulletin board function and communicate through comments. What should be noted here is that the author's PATI was exposed to posts and comments so that a consensus could be formed. Our bulletin board also provides news about mental and physical health. Useful news about physical and mental health will help you maintain a healthier lifestyle!

- **Check the issues that are considered a lot by PATI (further development)**

<br>

### Recommendation

<사진 영역>

> It's a song recommendation function. We're not just recommending it, but we're recommending those songs after checking out what songs you've heard a lot of with the same PATI as you! In addition, I recommend songs based on Daily Test's mood emoticons!

<br>

### Group-Therapy

<사진 영역>

> Group therapy is consulted by real psychologists and coaches. We guarantee complete secrecy, so feel free to share your concerns! You can also group therapy by tying the same PATI type! You'll be able to relate to each other more because they're the same PATI! Finally, you can test it through a professional psychological test paper, and you can also consult based on the test results!

<br>
<hr>
<br>

# Expected-effect
![image](https://user-images.githubusercontent.com/82595288/228863954-2b41d857-3282-4da6-8fb9-cc7e4d806263.png)
### Better Lifestyle Habits
Using health applications can improve  dietary habits, exercise routines, and sleep habits, ultimately leading to a healthier lifestyle.
<br/><br/> 
![image](https://user-images.githubusercontent.com/82595288/228864130-2f04a135-41f0-49f6-9ab8-6d70c33be9f2.png)
### Stress Reduction
Applications equipped with stress management features can help users manage and reduce stress more effectively.
<br/><br/> 
![image](https://user-images.githubusercontent.com/82595288/228864181-857a1cb9-7f05-4dcd-a38e-0a42f6e951f9.png)
### Personalized Advice
Health applications can provide tailored advice based on the user's health status, allowing them to discover individualized health management strategies.
<br/><br/> 
![image](https://user-images.githubusercontent.com/82595288/228864246-1b0073be-6ba4-44b3-9ffc-e5eccc4a6f51.png)
### Healthy Social Relationships
Health applications can assist users in maintaining healthy social relationships.

<br>
<hr>
<br>

# How-to-run-this-application

### App

<정범님 설명>

### Backend

The backend server is already deployed in GCP VM Instance. And the domain is http://seonghokim.com:9999, so please refer to it.<br>
If you clone and use the project, you must create application-db.yml, application-oauth.yml, application-cloud.yml, and the Json file of GCP IAM Service Account in the resources directory. 

Thank you.

<br>
<hr>
<br>

# Contributor

<table>
   <td align="center">
      <img src="https://avatars.githubusercontent.com/u/127945348?v=4" width="100px;" alt=""/><br>
      <b>Min Ye Choi</b><br>
      <img src="https://img.shields.io/badge/Design-UI/UX-FFCA28?style=flat-square&logo=firebase&logoColor=white"/><br>
      :octocat: <a href="https://github.com/Celia63">Github Link</a><br>
    </td>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/u/56466165?v=4" width="100px;" alt=""/><br>
      <b>Jeong Beom Han</b><br>
      <img src="https://img.shields.io/badge/Front-end-FFCA28?style=flat-square&logo=firebase&logoColor=white"/><br>
      :octocat: <a href="https://github.com/dino2331">Github Link</a><br>
    </td>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/u/74396651?v=4" width="100px;" alt=""/><br>
      <b>Seong Ho Kim</b><br>
      <img src="https://img.shields.io/badge/Back-end-FFCA28?style=flat-square&logo=firebase&logoColor=white"/><br>
      :octocat: <a href="https://github.com/OOOIOOOIO">Github Link</a><br>
    </td>
    <td align="center">
      <img src="https://avatars.githubusercontent.com/u/82595288?v=4" width="100px;" alt=""/><br>
      <b>Min Ki Son</b><br>
      <img src="https://img.shields.io/badge/Machine-Learing-FFCA28?style=flat-square&logo=firebase&logoColor=white"/><br>
      :octocat: <a href="https://github.com/thflgg133">Github Link</a><br>
    </td>
  <tr>
<table>

<code>Click Github Link! you can contact us!!</code>






