//
//  MenuCategorySegmentedControl.swift
//  ChioskApp
//
//  Created on 11/27/24.
//
//  Description:
//  - 이 커스텀 SegmentedControl 클래스는 앱의 메뉴 카테고리 UI를 위한 컴포넌트입니다.
//  - 선택된 세그먼트의 스타일(배경색, 모서리 반경 등)을 사용자 지정하여 일관된 UI를 제공합니다.
//

import UIKit

/// `MenuCategoryView`
/// - SegmentedControl의 선택 항목 스타일을 커스터마이징하기 위해 상속받아 구현
class MenuCategoryView: UIView {
    weak var delegate: MenuCategoryViewDelegate?
    
    private var segmentedIndex: MenuCategory = .chicken {
        didSet {
            delegate?.changeMenu(to: segmentedIndex)
            // 다형성으로 인해 listView?.changeMenu(to: segmentedIndex) 호출하는 것과 같은 의미
        }
    }
    func setIndex(_ categoryIndex: MenuCategory) {
        segmentedIndex = categoryIndex
    }
    
    // MARK: - Layout Customization
    
    /// SegmentedControl: 카테고리 전환을 위한 컨트롤
    let segmentControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["치킨", "사이드", "음료", "기타"])
        control.selectedSegmentIndex = 0
        control.backgroundColor = .clear
        return control
    }()
    
    /// 상단 로고 라벨
    let logo = UILabel().then {
        $0.backgroundColor = UIColor(named: "ChioskPrimaryColor")
        $0.text = "CHIOSK"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "ProtestRiot-Regular", size: 36)
    }
}
