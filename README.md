# subway_project_230208

<img src = "https://user-images.githubusercontent.com/87881735/224252814-01b59a9f-8b2f-4293-b301-67d0bd858e97.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224252840-36904301-a9a8-4cc0-accf-cdb4b3104065.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224255813-35142982-270d-4cd5-a9ec-3644272ca65f.PNG" width="20%" height="20%"><img src ="https://user-images.githubusercontent.com/87881735/224255839-57e4c90b-9d3e-4b4b-968b-44babc55e583.PNG" width="20%" height="20%"><img src = "https://user-images.githubusercontent.com/87881735/224255853-f90ce829-943e-4c40-92c1-a689dc56f91c.PNG" width="20%" height="20%">

subway_project_230208는 지하철 하차 알림 어플리케이션입니다. 지하철 정보 관련 어플리케이션이지만 흔한 지하철 노선도가 없습니다. 지하철 노선도 대신 비행기 티켓과 유사하게 제작되어 원하는 목적지 관련 정보를 가시성있게 보여줍니다. 이 어플리케이션은 지하철 하차 알림,지하철 시간표,실시간 상하행선 정보,SMS민원 기능이 포함되어 있습니다.  

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224343144-f408740c-297c-4b9a-861b-3f163210c926.gif" width="20%" height="20%" > <img src ="https://user-images.githubusercontent.com/87881735/224355453-fd3d67e9-e025-4570-8cd4-2aa274456d88.PNG" width="20%" height="20%" > 
</p>

처음 앱을 시작하실때 나오는 오프닝 화면입니다. UI상에선 특별한 설정화면이 없는 것처럼 보이지만 위에 그림과 같이 4개의 구간을 탭하여 제공되는 기능을 활용하실 수 있습니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224356289-8f5cdae5-2c7d-426a-862e-7b99b19e90fc.PNG" width="20%" height="20%" > <img src ="https://user-images.githubusercontent.com/87881735/224357874-51405d80-cadb-4795-9105-0ce2cb5768fa.PNG" width="20%" height="20%" > <img src ="https://user-images.githubusercontent.com/87881735/224357890-70c1c66a-9cae-4dfa-b512-e0bae5c99f19.PNG" width="20%" height="20%" > <img src ="https://user-images.githubusercontent.com/87881735/224361464-f9cdf95d-3257-408c-bd5e-ebc982ab4856.PNG" width="20%" height="20%">
</p>


이미지에서 보이는 텍스트 입력란 중 Enter Destination을 탭 하시고 원하시는 역의 이름을 타이핑 하시면 자동완성 기능으로 역 이름 리스트가 보여집니다. 원하시는 목적지를 선택 후 다음 그림과 같이 호선을 선택해주셔야 합니다. 1~9호선 이외에 신분당선,수인분당선,우이신설,신림 선의 경우 Line10,11,12,13,14 을 선택해주셔야 합니다. 이후 Enter your name 란에 성함을 기재하셔야 합니다. 지하철목적지와 다르게 성함은 앱 상에 영구저장되어 UI상에 남게 됩니다.  

이름,목적지 입력후에는 오른쪽 그림과 같이 UI상에 나타낼 수 있습니다. 지정하신 호선에 따라서 UI상에 보이는 왼쪽 바의 색이 바뀔 수 있습니다. Adapt 버튼을 누르셨다면 GEOLOCATOR package를 통해 위치 추적기능이 활성화되어 목적지에 도착할때 쯤 하차 알람을 받으실 수 있습니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224363941-6b1c4550-7ab5-45f1-b818-d6268f125af0.PNG" width="20%" height="20%" > <img src ="https://user-images.githubusercontent.com/87881735/224364869-ec2c9253-8b59-4eb1-a030-bc706437d471.PNG" width="20%" height="20%" >
</p>

subway_project는 지하철 출퇴근, 등하교시에 편의성 제공에 목적이 있습니다. 이를 위해 subway_project는 어플리케이션 내에 save 기능을 통해 출발역과 도착역을 설정하면 실시간 열차정보 및 열차 시간표를 제공 받으실 수 있습니다. 

<p align="center">
<img src ="https://user-images.githubusercontent.com/87881735/224468770-2ba87678-90c9-4b0d-9fae-f9897a6358ba.jpg" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/87881735/224468408-21d6c7c7-72fb-43af-9869-283341c3c4f7.png" width="20%" height="20%"> <img src="https://user-images.githubusercontent.com/87881735/224468413-c6cb7d67-23cd-4cab-b91d-f332b407219c.png" width="20%" height="20%">
</p>

Save 버튼을 통해 2번의 목적지 저장이 가능합니다. 목적지를 입력하신 이후에 Save버튼을 짧게 탭하시면 목적지A을 저장합니다. Save버튼을 길게 탭하시면 목적지A을 저장합니다. 어플리케이션은 목적지의 저장여부를 메시지로 알려줍니다. 평소 출퇴근길을 저장해두시면 어플리케이션은 보다 다양한 기능을 제공합니다.  

