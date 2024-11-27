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
    let segmentControl = UISegmentedControl(items: ["치킨", "사이드", "음료", "기타"]).then {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .systemGray6
        $0.selectedSegmentTintColor = .white
    }
    // 클릭했을 때, 뷰를 변환되게 하는 메소드. 클릭 액션 메소드. 이것에 대한 로직을 이제 함수로 구현해야함
    // 초기 뷰를 선언해야함.
    
    
    //MARK: 상단 로고
    let logo = UILabel().then {
        $0.backgroundColor = .red
        $0.text = "CHIOSK"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "ProtestRiot-Regular", size: 36)
    }

    
    //MARK: Palce holder
    let chickenView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    let sidedishView = UIView().then {
        $0.backgroundColor = .gray
    }
    let drinkView = UIView().then {
        $0.backgroundColor = .darkGray
    }
    let etcView = UIView().then {
        $0.backgroundColor = .black
    }
    
}
