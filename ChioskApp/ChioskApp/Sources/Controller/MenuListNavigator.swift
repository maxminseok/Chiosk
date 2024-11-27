//
//  MenuListNavigator.swift
//  ChioskApp
//
//  Created on 11/26/24.
//  MenuCategoryView 및 MenuListView 관리
//

import UIKit
import SnapKit
import Then

class MenuListNavigator: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        segmentChanged(segmentControl)
    }

    
    private let segmentControl = UISegmentedControl(items: ["치킨", "사이드", "음료", "기타"]).then {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .systemGray6
        $0.selectedSegmentTintColor = .white
        $0.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
    }
    // 클릭했을 때, 뷰를 변환되게 하는 메소드. 클릭 액션 메소드. 이것에 대한 로직을 이제 함수로 구현해야함
    // 초기 뷰를 선언해야함.
    
    
    //MARK: 상단 로고
    private let logo = UILabel().then {
        $0.backgroundColor = .red
        $0.text = "CHIOSK"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont(name: "ProtestRiot-Regular", size: 36)
    }

    
    //MARK: Palce holder
    private let chickenView = UIView().then {
        $0.backgroundColor = .lightGray
    }
    private let sidedishView = UIView().then {
        $0.backgroundColor = .gray
    }
    private let drinkView = UIView().then {
        $0.backgroundColor = .darkGray
    }
    private let etcView = UIView().then {
        $0.backgroundColor = .black
    }
    
    //MARK: 현재 뷰를 추적하는 변수
    var currentView: UIView?
    
    
    func configureUI() {
        view.backgroundColor = .white
        
        // MARK: 상단 로고
        view.addSubview(logo)
        logo.snp.makeConstraints {
            $0.top.height.equalTo(60)
            $0.leading.trailing.equalToSuperview()
        }
        
        //MARK: SegmentedControl
        view.addSubview(segmentControl)
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        // MARK: Place Holder 뷰들 레이아웃
        [chickenView, sidedishView, drinkView, etcView].forEach {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.width.equalToSuperview()
                $0.height.equalTo(352)
                $0.top.equalTo(segmentControl.snp.bottom)
            }
            
        }
    
    }
    
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        currentView?.removeFromSuperview()
        
        switch sender.selectedSegmentIndex {
        case 0:
            currentView = chickenView
        case 1:
            currentView = sidedishView
        case 2:
            currentView = drinkView
        case 3:
            currentView = etcView
        default:
            return
        }
        
        if let currentView = currentView {
            view.addSubview(currentView)
            currentView.snp.makeConstraints {
                $0.top.equalTo(segmentControl.snp.bottom)
                $0.height.equalTo(352)
                $0.leading.trailing.equalToSuperview()
                
            }
        }
    }
    
}


#Preview("MenuListNavigatorVC") {
    MenuListNavigator()
}

