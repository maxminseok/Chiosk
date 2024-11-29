# Project Chiosk
팀 Chill의 Kiosk UI 구현 프로젝트, Chiosk입니다.

## 📚 Tech Stacks

<div>
  <a href="https://developer.apple.com/xcode/" target="_blank">
    <img src="https://img.shields.io/badge/Xcode_16.1-147EFB?style=for-the-badge&logo=xcode&logoColor=white" alt="Xcode">
  </a>
  <a href="https://swift.org/" target="_blank">
    <img src="https://img.shields.io/badge/Swift_5-F05138?style=for-the-badge&logo=swift&logoColor=white" alt="Swift">
  </a>
  <br>
  <a href="https://developer.apple.com/documentation/uikit" target="_blank">
    <img src="https://img.shields.io/badge/UIKit-2396F3?style=for-the-badge&logo=uikit&logoColor=white" alt="UIKit">
  </a>
  <a href="https://github.com/SnapKit/SnapKit" target="_blank">
    <img src="https://img.shields.io/badge/SnapKit-00aeb9?style=for-the-badge&logoColor=white" alt="SnapKit">
  </a>
  <a href="https://github.com/devxoul/Then" target="_blank">
    <img src="https://img.shields.io/badge/Then-00aeb9?style=for-the-badge&logoColor=white" alt="Then">
  </a>
  <br>
  <a href="https://www.gitkraken.com/" target="_blank">
    <img src="https://img.shields.io/badge/gitkraken-179287?style=for-the-badge&logo=gitkraken&logoColor=white" alt="GitKraken">
  </a>
  <a href="https://github.com/" target="_blank">
    <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white" alt="GitHub">
  </a>
  <br>
</div>

## 👥 The Team

| Names     | GitHub   |  Development                      |
| -------- | -------- | --------------------------------- |
| 강민성   | [@kangminseoung](https://github.com/kangminseoung) | 주문 내역 (OrderSummaryView) |
| 박민석   | [@maxminseok](https://github.com/maxminseok) |  메뉴 목록 (MenuListView)  |
| 이재건   | [@Quaker-Lee](https://github.com/Quaker-Lee) |  상단 메뉴 (MenuCategoryController) |
| 황도일   | [@DoyleHWorks](https://github.com/DoyleHWorks) |  메인 페이지 (MainViewController)  |

## ⏰ Project Scope

- **시작일**: 2024/11/25
- **종료일**: 2024/11/29

## 📂 Folder Organization Map
> Map Legend: (Superclass) // Components // 설명 // [Utilized Pattern]
```
App/
├── AppDelegate ─ (UIResponder, UIApplicationDelegate)
├── Info
├── LaunchScreen
└── SceneDelegate ─ (UIResponder, UIWindowSceneDelegate) UIWindow: MainViewController
Resources/
├── Fonts/ProtestRiot-Regular
├── Assets ─ 주요 색상
└── Media ─ 이미지
Sources/
├── Controllers/
│   ├── MainViewController ─ (UIViewController) MenuCategoryController, OrderSummaryView        [Delegate] [NotificationCenter]
│   │                                           주요 UI 관리 / 주요 버튼 액션 정의
│   └── MenuCategoryController ─ MenuCategorySegmentedControl, MenuList, MenuListView
├── Delegates/
│   └── MenuListViewDelegate ─ 메뉴 선택 이벤트 처리                                                ]  [
├── Extensions/
│   ├── ExtensionUIColor ─ 공통 색상 정의: Assets
│   └── NotificationNames ─ Notification 이름 관리                                                                 ]  [
├── Models/
│   ├── MenuList ─ 메뉴 데이터 관리: Media
│   └── OrderManager ─ 주문 데이터 관리 [Singleton]:
│                      MainViewController, OrderSummaryView, OrderSummaryViewCell에서 접근
└── Views/
    ├── MenuCategorySegmentedControl ─ (UISegmentedControl)
    ├── MenuListView ─ (UIView) UICollectionView                                       [Delegate] ..↑
    ├── MenuListViewCell ─ (UICollectionViewCell) UIImageView, UILabel
    ├── OrderSummaryView ─ (UIView) UIView, UILabel, UIButton, UICollectionView
    └── OrderSummaryViewCell ─ (UICollectionViewCell) UIView, UIImageView, UILabel, UIButton [NotificationCenter] ..↑
```

## 🖼️ App Preview
![chiosk_final](https://github.com/user-attachments/assets/cea787cd-331a-4487-8b9a-bf84ce56198f)


## 🏷 Main Features
- **메인 페이지**  
  - 앱 실행 시 사용자에게 첫 화면으로 보여지는 화면
  - 구성 화면: 메인 배너, 메뉴 카테고리 바, 메뉴 목록, 주문 내역
  - 로직: 각 버튼 클릭 시 적절한 뷰로 전환하는 역할 수행

- **상단 메뉴 카테고리 바**  
  - UISegmentedControl을 활용하여 카테고리를 표시
  - 카테고리 선택 시 해당 카테고리의 메뉴를 아래에 표시
  - 선택된 카테고리에 따라 `MenuListView`에 `MenuList` 데이터를 전달

- **메뉴 화면**  
  - UICollectionView를 활용하여 메뉴 항목들을 표시 
  - 각 메뉴 항목은 이미지, 이름, 가격을 포함하며, 선택 시 주문 화면으로 데이터를 전달
  - Delegate 패턴을 사용하여 이벤트를 처리

- **주문 내역 화면**  
  - 사용자가 선택한 메뉴들을 확인하고, 수량을 조정할 수 있는 화면
  - 각 메뉴는 `OrderSummaryViewCell`로 표현되며, 수량 조절 버튼과 가격 표시를 포함
  - NotificationCenter를 통해 주문 정보 변경을 실시간으로 반영
  - 최대 주문 금액(1,000,000원)을 초과할 경우 알림 표시

- **각 버튼과 로직**  
  - 메뉴 선택: `MenuListViewDelegate`를 통해 주문 데이터에 메뉴 추가
  - 수량 조절: `OrderSummaryViewCell`의 버튼 클릭 시 `OrderManager`에서 수량 업데이트 및 NotificationCenter를 통한 데이터 동기화
  - 주문 요약: 주문 총 금액을 계산하여 화면 상단에 표시

## 🛠 Usage Patterns and Architecture
- **Delegate 패턴**  
  - `MenuListViewDelegate`: 메뉴 선택 이벤트를 처리하여 `MainViewController`에서 필요한 동작을 수행
  - `UICollectionViewDelegate`: 메뉴와 주문 내역의 셀 선택 및 동작 처리

- **Singleton 패턴**  
  - `OrderManager`: 주문 데이터를 관리하는 단일 인스턴스를 제공
  - 여러 뷰에서 접근 가능하며, 주문 추가/삭제 및 수량 업데이트 등의 로직을 수행

- **NotificationCenter 패턴**  
  - 주문 데이터 변경 사항을 각 화면에 전달
  - `OrderSummaryViewCell`에서 수량 조절 시 `orderUpdated` Notification을 통해 UI 업데이트
  - 주문 한도 금액 초과 시 `orderLimitExceeded` 알림을 `NotificationCenter`로 전달.

- **아키텍처**  
  - **MVC (Model-View-Controller)**  
    - **Model**: `MenuList`, `OrderManager`  
      - 데이터 관리 및 비즈니스 로직 처리.  
    - **View**: `MenuListView`, `OrderSummaryView`, `OrderSummaryViewCell`  
      - UI 요소와 화면 레이아웃 담당.  
    - **Controller**: `MainViewController`, `MenuCategoryController`  
      - 사용자 입력 처리 및 View와 Model 간의 데이터 흐름 조율.  
    - 각 레이어가 명확히 분리되어 유지보수성과 확장성을 고려.

## 📦 How to Install
- Clone this repository
```
https://github.com/SpartaCoding-iOS05-Chill/Chiosk.git
```
