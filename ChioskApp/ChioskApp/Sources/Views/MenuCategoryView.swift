//
//  MenuCategoryView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  메뉴 카테고리 표시 뷰 (+ Chiosk 글자 표시)
//
import UIKit
import SnapKit
import Then

class MenuCategoryView {
    
    //MARK: SegmentedControl 구현
    let segmentControl = MenuCategorySegmentedControl(items: ["치킨", "사이드", "음료", "기타"]).then {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .clear
        $0.selectedSegmentTintColor = .clear
    }
    
    //MARK: 상단 로고
    let logo = UILabel().then {
        $0.backgroundColor = UIColor(named: "ChioskPrimaryColor")
        $0.text = "CHIOSK"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "ProtestRiot-Regular", size: 36)
    }

    private let menuList = MenuList()
    
    let chickenMenu = MenuListView()
    let sidedishMenu = MenuListView()
    let drinkMenu = MenuListView()
    let etcMenu = MenuListView()
    
    //MARK: Palce holder
    let chickenView = UIView().then {
        $0.backgroundColor = .white
    }
    let sidedishView = UIView().then {
        $0.backgroundColor = .white
    }
    let drinkView = UIView().then {
        $0.backgroundColor = .white
    }
    let etcView = UIView().then {
        $0.backgroundColor = .white
    }
    
    init() {
        setUpMenus()
    }
    
    private func setUpMenus() {
        chickenMenu.menuData = menuList.menuCategories["치킨", default: []]
        sidedishMenu.menuData = menuList.menuCategories["사이드", default: []]
        drinkMenu.menuData = menuList.menuCategories["음료", default: []]
        etcMenu.menuData = menuList.menuCategories["기타", default: []]
        
        chickenView.addSubview(chickenMenu)
        sidedishView.addSubview(sidedishMenu)
        drinkView.addSubview(drinkMenu)
        etcView.addSubview(etcMenu)
        
        // 레이아웃 설정
        let views = [chickenMenu, sidedishMenu, drinkMenu, etcMenu]
        views.forEach { menu in
            menu.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                menu.topAnchor.constraint(equalTo: menu.superview!.topAnchor),
                menu.leadingAnchor.constraint(equalTo: menu.superview!.leadingAnchor),
                menu.trailingAnchor.constraint(equalTo: menu.superview!.trailingAnchor),
                menu.bottomAnchor.constraint(equalTo: menu.superview!.bottomAnchor)
            ])
        }
    }
}
