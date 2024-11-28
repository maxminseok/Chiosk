//
//  MenuCategoryView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//
//  Description:
//  - 이 클래스는 메뉴 카테고리와 관련된 UI를 정의하는 뷰입니다.
//  - SegmentedControl을 사용하여 "치킨", "사이드", "음료", "기타" 카테고리로 메뉴를 나누어 표시하며, 상단에 로고를 포함합니다.
//

import UIKit
import SnapKit
import Then

/// `MenuCategoryView`
/// - 메뉴 카테고리와 관련된 UI 요소를 관리하는 클래스
/// - SegmentedControl과 카테고리별 뷰 및 메뉴 리스트를 포함
class MenuCategoryView {
    
    // MARK: - Properties
    
    /// SegmentedControl: 카테고리 전환을 위한 컨트롤
    internal let segmentControl = MenuCategorySegmentedControl(items: ["치킨", "사이드", "음료", "기타"]).then {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .clear
        $0.selectedSegmentTintColor = .clear
    }
    
    /// 상단 로고 라벨
    internal let logo = UILabel().then {
        $0.backgroundColor = UIColor(named: "ChioskPrimaryColor")
        $0.text = "CHIOSK"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "ProtestRiot-Regular", size: 36)
    }

    /// 메뉴 데이터를 관리하는 객체
    internal let menuList = MenuList()
    
    /// 카테고리별 메뉴 리스트 뷰
    internal let chickenMenu = MenuListView()
    internal let sidedishMenu = MenuListView()
    internal let drinkMenu = MenuListView()
    internal let etcMenu = MenuListView()
    
    // MARK: 카테고리별 View 컨테이너
    internal let chickenView = UIView().then {
        $0.backgroundColor = .white
    }
    internal let sidedishView = UIView().then {
        $0.backgroundColor = .white
    }
    internal let drinkView = UIView().then {
        $0.backgroundColor = .white
    }
    internal let etcView = UIView().then {
        $0.backgroundColor = .white
    }
    
    // MARK: - Initialization
    
    /// 초기화 메서드
    /// - 카테고리별 메뉴 데이터를 설정
    init() {
        setUpMenus()
    }
    
    // MARK: - Private Methods
    
    /// 메뉴 데이터를 카테고리별로 설정
    private func setUpMenus() {
        // 카테고리별 데이터 설정
        chickenMenu.setMenuData(menuList.menuCategories["치킨", default: []])
        sidedishMenu.setMenuData(menuList.menuCategories["사이드", default: []])
        drinkMenu.setMenuData( menuList.menuCategories["음료", default: []])
        etcMenu.setMenuData(menuList.menuCategories["기타", default: []])
        
        // 메뉴 리스트 뷰를 각 카테고리 뷰에 추가
        chickenView.addSubview(chickenMenu)
        sidedishView.addSubview(sidedishMenu)
        drinkView.addSubview(drinkMenu)
        etcView.addSubview(etcMenu)
        
        // 레이아웃 설정
        let views = [chickenMenu, sidedishMenu, drinkMenu, etcMenu]
        views.forEach { menu in
            menu.snp.makeConstraints {
                $0.top.bottom.leading.trailing.equalToSuperview()
            }
        }
    }
}
