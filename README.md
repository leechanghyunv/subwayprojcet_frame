# subway_project_230208

<img src = "https://user-images.githubusercontent.com/87881735/224252814-01b59a9f-8b2f-4293-b301-67d0bd858e97.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224252840-36904301-a9a8-4cc0-accf-cdb4b3104065.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224255813-35142982-270d-4cd5-a9ec-3644272ca65f.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224255839-57e4c90b-9d3e-4b4b-968b-44babc55e583.PNG" width="20%" height="20%"><img src = "https://user-images.githubusercontent.com/87881735/224255853-f90ce829-943e-4c40-92c1-a689dc56f91c.PNG" width="20%" height="20%">

subway_project_230208는 지하철 하차 알림 어플리케이션입니다. 지하철 정보 관련 어플리케이션이지만 흔한 지하철 노선도가 없습니다. 지하철 축발지점 및 목적지 관련 정보를 가시성있게 보여주기 위함입니다. subway_project_230208은 '지하철 하차 알림','지하철 시간표','실시간 상하행선 정보','SMS민원','미세먼지알림' 기능이 포함되어 있습니다.  

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224343144-f408740c-297c-4b9a-861b-3f163210c926.gif" width="20%" height="20%" > <img src ="https://user-images.githubusercontent.com/87881735/224355453-fd3d67e9-e025-4570-8cd4-2aa274456d88.PNG" width="20%" height="20%" > 
</p>

위 이미지는 처음 앱을 시작하실때 나오는 오프닝 화면입니다. UI상에선 특별한 설정화면이 없는 것처럼 보이지만 제공되는 이미지와 같이 4개의 구간을 탭하여 제공되는 기능을 활용하실 수 있습니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224592055-375827e1-1708-4912-a6c3-03897c9964df.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224591892-807b829c-a130-4ed5-aad3-dad5af11b03a.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224591885-984c885a-b7ad-4522-b394-580fed870dce.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224591894-67989409-4625-42af-a92c-257c731ee418.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224591898-44445313-7d1a-4c40-9c68-72575c606311.PNG" width="20%" height="20%">
</p>

(+추가된기능) 미세먼지 알림기능을 추가했습니다. 처음 앱이 실행될때 보이는 좌측 바는 미세먼지의 농도를 나타냅니다. 
미세먼지농도가 30이하 라면 4호선을 상징하는 파란색 (좋음)
미세먼지농도가 80이하 라면 2호선을 상징하는 노촉색 (보통)
미세먼지농도가 150이하 라면 3호선을 상징하는 노촉색 (나쁨)
미세먼지농도가 151이상 이라면 8호선을 상징하는 적색 (매우나쁨)

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224472633-1347f095-705c-467b-ae67-055e38855093.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224356289-8f5cdae5-2c7d-426a-862e-7b99b19e90fc.PNG" width="20%" height="20%" ><img src ="https://user-images.githubusercontent.com/87881735/224357874-51405d80-cadb-4795-9105-0ce2cb5768fa.PNG" width="20%" height="20%" ><img src ="https://user-images.githubusercontent.com/87881735/224357890-70c1c66a-9cae-4dfa-b512-e0bae5c99f19.PNG" width="20%" height="20%" ><img src ="https://user-images.githubusercontent.com/87881735/224361464-f9cdf95d-3257-408c-bd5e-ebc982ab4856.PNG" width="20%" height="20%">
</p>


화면에 보이는 아이콘을 탭하시면 정보 입력란을 볼 수 있습니다. 이미지에서 보이는 텍스트 입력란 중 Enter Destination을 탭 하시고 원하시는 역의 이름을 타이핑 하시면 자동완성 기능으로 역 이름 리스트가 보여집니다. 원하시는 목적지를 선택 후 다음 그림과 같이 호선을 선택해주셔야 합니다. 1~9호선 이외에 신분당선,수인분당선,우이신설,신림 선의 경우 Line10,11,12,13,14 을 선택해주셔야 합니다. 이후 Enter your name 란에 성함을 기재하셔야 합니다. 지하철목적지와 다르게 성함은 앱 상에 영구저장되어 UI상에 남게 됩니다.  

이름,목적지 입력후에는 오른쪽 그림과 같이 UI상에 나타낼 수 있습니다. 지정하신 호선에 따라서 UI상에 보이는 왼쪽 바의 색이 바뀔 수 있습니다. Adapt 버튼을 누르셨다면 GEOLOCATOR package를 통해 위치 추적기능이 활성화되어 목적지에 도착할때 쯤 하차 알람을 받으실 수 있습니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224363941-6b1c4550-7ab5-45f1-b818-d6268f125af0.PNG" width="20%" height="20%" > <img src ="https://user-images.githubusercontent.com/87881735/224364869-ec2c9253-8b59-4eb1-a030-bc706437d471.PNG" width="20%" height="20%" > <img src ="https://user-images.githubusercontent.com/87881735/224613185-70923db2-185c-4ead-be6d-f61b48b3c587.PNG" width="20%" height="20%" >
</p>

subway_project는 지하철 출퇴근, 등하교시에 편의성 제공에 목적이 있습니다. 이를 위해 subway_project는 어플리케이션 내에 save 기능을 통해 출발역과 도착역을 설정하면 실시간 열차정보 및 열차 시간표를 제공 받으실 수 있습니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224468770-2ba87678-90c9-4b0d-9fae-f9897a6358ba.jpg" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/87881735/224468408-21d6c7c7-72fb-43af-9869-283341c3c4f7.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/87881735/224468413-c6cb7d67-23cd-4cab-b91d-f332b407219c.png" width="20%" height="20%">
</p>

Save 버튼을 통해 2번의 목적지 저장이 가능합니다. 목적지를 입력하신 이후에 Save버튼을 짧게 탭하시면 목적지A을 저장합니다. Save버튼을 길게 탭하시면 목적지A을 저장합니다. 어플리케이션은 목적지의 저장여부를 메시지로 알려줍니다. 평소 출퇴근길을 저장해두시면 어플리케이션은 보다 다양한 기능을 제공합니다.  

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224469515-eafd92d4-8c68-44df-9331-908f057123c8.PNG"  width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224469511-5c56dfd2-ac25-4c6c-ac16-bda4744275db.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224469504-6e8a3474-552a-49ec-8066-97883ac69886.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224469890-70943b8b-a5d0-4931-990f-e385f492832f.PNG" width="20%" height="20%">
</p>



위 이미지는 4호선 정부과천청사를 목적지A 4호선 숙대입구를 목적지B로 저장한 이미지입니다. A부분에 아이콘 >> 을 누르게되면 출발지점을 숙대입구로,목적지를 정부과천청사로 보고 숙대입구의 실시간 열차정보를 제공합니다. 반대로 A부분에 아이콘 << 을 누르게되면 목적지를 정부과천청사 출발지점을 숙대입구로 보고 정부과천청사의 실시간 위치정보를 제공합니다. 반면에 UI는 목적지 중심으로 변경되어 보여집니다. Adapt를 누르시면 목적지에 도착시 하차 알림 기능을 제공합니다. 오른쪽 이미지처럼 급행 혹은 일반 열차의 여부도 파악이 가능합니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224472633-1347f095-705c-467b-ae67-055e38855093.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224472259-12a38261-9208-4b8e-8399-21affaa53d70.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224472257-0818ef89-2624-4b86-b84e-09a3e0755184.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224472250-c6f23297-d95b-4670-98fd-12a2f8a1b370.PNG" width="20%" height="20%"> 
</p>

subway_project_230208는 환승역의 여부도 고려해 만든 프로젝트입니다. 붉은상자안에 아이콘을 길게 누르시면 환승역 정보를 입력하 실 수 있는 다이얼로그 란을 보여줍니다. 동일한 방법으로 목적지를 입력하시면 환승역의 실시간 위치정보를 제공받습니다. 다른 목적지와 달리 환승역 정보는 별도의 버튼이 없이도 정보를 영구 저장해 위치 데이터를 제공합니다. 


<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224470515-a49c7d66-f6d9-4897-b6e9-67dd3e09d6a8.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224470513-ed7241b3-0a34-4971-957c-ba8a2616398b.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224470509-75c90f57-b116-4032-9d7a-bac4e3d7295e.PNG" width="20%" height="20%">
</p>

위 이미지와 같이 박스안에 아이콘으로도 실시간 위치 정보 제공이 가능합니다. 별도의 동작이 없이도 5초 후에 자동으로 정보제공 메시지가 소멸되어 보다 편리하게 정보를 제공받을 수 있습니다. 별도의 위치 추적 및 하차 알림기능은 제공하지 않습니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224471744-d7cc4bf8-91e9-46b6-8cee-4ef05f463901.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224471736-9ee1a034-8e5c-4fc0-81f4-3dd396f6f963.gif" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224471743-3dcdc86a-531b-4bea-955e-c9c9286d92f3.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224471742-f0b1e975-cb2f-44be-924a-c09c25280147.PNG" width="20%" height="20%"> 
</p>

위 이미지에서 나타낸 박스를 탭하신다면 앞서 저장된 지하철역 위치정보를 이용해 운행 시간표를 제공할 수 있습니다. 시간표에는 앞서 저장된 목적지A, 목적지B의 운행정보가 포함되어 있습니다. 각각의 시간표 정보는 좌측 하단에 도형을 탭하시면 제공합니다. 원형의 아이콘은 목적지A의 운행 시간표를 사각형 아이콘은 목적지B의 운행 시간표를 콜백합니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224471744-d7cc4bf8-91e9-46b6-8cee-4ef05f463901.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224473130-8902abb7-9092-4689-a303-699cfc4603ad.PNG" width="20%" height="20%"> <img src ="https://user-images.githubusercontent.com/87881735/224682388-aa0cd430-7b9d-48e6-8cad-ac06daeed114.gif" width="20%" height="20%">
</p>

위 이미지에 나타낸 박스를 길게 탭하시면 SMS 민원기능을 이용하실 수 있습니다. 1~9호선,신분당선,수인분당선,경의중앙선은 각각의 관할기관이 다릅니다. 지하철 이용자는 호선별 관할처 정보를 파악한 이후에 민원을 제기해야 하지만 subway_project_230208는 목적지를 기준으로 자동으로 해당 관할처에 연결될 수 있도록 제작하였습니다. 

