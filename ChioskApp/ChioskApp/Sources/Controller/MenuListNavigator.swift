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

class MenuListNavigatorVC: UIViewController {
    
    private let segmentControl = UISegmentedControl(items: ["치킨", "사이드", "음료", "기타"]).then {
        $0.selectedSegmentIndex = 0
        $0.backgroundColor = .lightGray
        $0.selectedSegmentTintColor = .white
    }
    
    
    //MARK: 상단 로고
    private let logo = UILabel().then {
        $0.backgroundColor = .red
        $0.text = "CHIOSK"
        $0.textColor = .white
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 30)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
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
    
    
    //398
    
    
    func configureUI() {
        view.backgroundColor = .white
        
        // MARK: 상단 로고
        view.addSubview(logo)
        logo.snp.makeConstraints {
            $0.top.height.equalTo(60)
            $0.width.equalToSuperview()
        }
        
        view.addSubview(segmentControl)
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(logo.snp.bottom)
            $0.width.equalToSuperview()
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
        

//        view.addSubview(segmentControl)
//        segmentControl.snp.mak던 eConstraints {
//            $0.top.equalTo(logo.snp.bottom)
//            $0.width.equalToSuperview()
//            $0.height.equalTo(58)
//        }
    
    }
    
    
}

#Preview("MenuListNavigatorVC") {
    MenuListNavigatorVC()
}

