//
//  MenuListNavigatorViewController.swift
//  ChioskApp
//
//  Created by 이재건 on 11/26/24.
//

import UIKit
import SnapKit
import Then

class MenuListNavigatorVC: UIViewController {
    
    private var uiSegmentedControl: UISegmentedControl {
        let items = ["치킨", "사이드", "음료", "기타"]
        let segmentedControl = UISegmentedControl().then {
            $0.selectedSegmentIndex = 0
        }
        return segmentedControl
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
    
    
    
    func configureUI() {
        view.backgroundColor = .white
        
        // MARK: 상단 로고
        view.addSubview(logo)
        logo.snp.makeConstraints {
            $0.top.height.equalTo(60)
            $0.width.equalToSuperview()
        }
        
        
    }
}

#Preview("MenuListNavigatorVC") {
    MenuListNavigatorVC()
}

