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
| 이재건   | [@Quaker-Lee](https://github.com/Quaker-Lee) |  상단 메뉴 (MenuCategoryView) |
| 황도일   | [@DoyleHWorks](https://github.com/DoyleHWorks) |  메인 페이지 (MainViewController)  |

## ⏰ Project Scope

- **시작일**: 2024/11/25
- **종료일**: 2024/11/29

## 📂 Folder Organization Map
> Map Legend: (Superclass) // Components // 설명 // [Utilized Pattern]
```
ChioskApp
├── App/
│   ├── AppDelegate ─ (UIResponder, UIApplicationDelegate)
│   ├── Info
│   ├── LaunchScreen
│   └── SceneDelegate ─ (UIResponder, UIWindowSceneDelegate) UIWindow: MainViewController
├── Resources/
│   ├── Fonts/ProtestRiot-Regular
│   ├── Assets ─ 주요 색상
│   └── Media ─ 이미지
└── Sources/
    ├── Controllers/
    │   └── MainViewController ─ (UIViewController) MenuCategoryView, OrderSummaryView             [Delegate] [NotificationCenter]
    │                                               주요 UI 관리 / 주요 버튼 액션 정의
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
        ├── MenuCategoryView ─ MenuCategorySegmentedControl, MenuList, MenuListView, UILabel, UIView
        ├── MenuListView ─ (UIView) UICollectionView                                       [Delegate] ..↑
        ├── MenuListViewCell ─ (UICollectionViewCell) UIImageView, UILabel
        ├── OrderSummaryView ─ (UIView) UIView, UILabel, UIButton, UICollectionView
        └── OrderSummaryViewCell ─ (UICollectionViewCell) UIView, UIImageView, UILabel, UIButton [NotificationCenter] ..↑
```

## 🖼️ App Preview
|![Chiosk](https://github.com/user-attachments/assets/b1ce848c-f773-4c51-b8a2-0c5da5370c79)|![1,000,000](https://github.com/user-attachments/assets/34330f2e-5220-48bb-86a4-dd3dd4bbb6b0)|
|---|---|

## 📦 How to Install
- Clone this repository
```
https://github.com/SpartaCoding-iOS05-Chill/Chiosk.git
```
