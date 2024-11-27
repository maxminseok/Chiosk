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
    
    let menuCategoryViews = MenuCategoryView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        segmentChanged(menuCategoryViews.segmentControl)
    }

    func configureUI() {
        view.backgroundColor = .white
        
        // MARK: 상단 로고
        view.addSubview(menuCategoryViews.logo)
        menuCategoryViews.logo.snp.makeConstraints {
            $0.top.height.equalTo(60)
            $0.leading.trailing.equalToSuperview()
        }
        
        //MARK: SegmentedControl
        view.addSubview(menuCategoryViews.segmentControl)
        menuCategoryViews.segmentControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        menuCategoryViews.segmentControl.snp.makeConstraints {
            $0.top.equalTo(menuCategoryViews.logo.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        // MARK: Place Holder 뷰들 레이아웃
        [menuCategoryViews.chickenView, menuCategoryViews.sidedishView, menuCategoryViews.drinkView, menuCategoryViews.etcView].forEach {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.width.equalToSuperview()
                $0.height.equalTo(352)
                $0.top.equalTo(menuCategoryViews.segmentControl.snp.bottom)
            }
        }
    
    }
    
    //MARK: 클릭 시 뷰 변경
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        [menuCategoryViews.chickenView, menuCategoryViews.sidedishView, menuCategoryViews.drinkView, menuCategoryViews.etcView].forEach {
            $0.isHidden = true
        }
        
        switch sender.selectedSegmentIndex {
        case 0:
            menuCategoryViews.chickenView.isHidden = false
        case 1:
            menuCategoryViews.sidedishView.isHidden = false
        case 2:
            menuCategoryViews.drinkView.isHidden = false
        case 3:
            menuCategoryViews.etcView.isHidden = false
        default:
            break
        }
    }
    
    
}


#Preview {
    MenuListNavigator()
}

