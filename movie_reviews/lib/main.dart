// flutter/material 패키지를 가져옵니다. 이 패키지는 Flutter 애플리케이션을 구축하기 위한 기본적인 UI 요소와 도구들을 제공합니다.
import 'package:flutter/material.dart';

// 애플리케이션의 진입점입니다. runApp 함수를 호출하여 MyApp 위젯을 실행시킵니다.
void main() {
  runApp(MyApp());
}

// MyApp 클래스를 선언합니다. 이 클래스는 StatelessWidget을 상속받아 애플리케이션의 루트 위젯을 정의합니다.
class MyApp extends StatelessWidget {
  // MyApp 클래스의 생성자입니다. super 키워드를 사용하여 StatelessWidget 클래스의 생성자를 호출합니다.
  const MyApp({Key? key}) : super(key: key);

  // 어노테이션 : 어노테이션을 메서드 위에 붙이면, 해당 메서드가 상위 클래스나 인터페이스의 메서드를 재정의하는 것임을 명시적으로 나타냅니다.
  @override
  // build 메서드는 MyApp 위젯의 메인 렌더링 함수입니다. BuildContext를 매개변수로 받아 현재의 위젯 트리에 대한 빌드를 수행합니다.
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기`
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "category": "탑건: 매버릭",
        "imgUrl": "https://i.ibb.co/sR32PN3/topgun.jpg",
      },
      {
        "category": "마녀2",
        "imgUrl": "https://i.ibb.co/CKMrv91/The-Witch.jpg",
      },
      {
        "category": "범죄도시2",
        "imgUrl": "https://i.ibb.co/2czdVdm/The-Outlaws.jpg",
      },
      {
        "category": "헤어질 결심",
        "imgUrl": "https://i.ibb.co/gM394CV/Decision-to-Leave.jpg",
      },
      {
        "category": "브로커",
        "imgUrl": "https://i.ibb.co/MSy1XNB/broker.jpg",
      },
      {
        "category": "문폴",
        "imgUrl": "https://i.ibb.co/4JYHHtc/Moonfall.jpg",
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      // appBar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Movie Review",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("myButton");
              },
              icon: Icon(
                Icons.person_outline,
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "영화 제목을 검색해주세요",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    print("search");
                  },
                ),
              ),
            ),
          ),
          Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                String category = dataList[index]['category'];
                String imgUrl = dataList[index]['imgUrl'];

                return Card(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.network(
                        imgUrl,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
