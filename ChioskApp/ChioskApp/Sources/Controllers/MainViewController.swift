//
//  MainViewController.swift
//  ChioskApp
//
//  Created on 2024-11-25.
//  MenuListNavigator 및 OrderSummaryView 관리
//

import UIKit
import SnapKit
import Then

class MainViewController: UIViewController {

    let menuCategoryViews = MenuCategoryView() // 메뉴 카테고리 뷰
    let orderSummaryView = OrderSummaryView()  // 주문 요약 뷰
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        segmentChanged(menuCategoryViews.segmentControl) // 초기 SegmentedControl 선택
    }

    // MARK: 로고, SegmentedControl, Place Holder, OrderSummaryView 추가
    func configureUI() {
        view.backgroundColor = .white
        
        // MARK: 상단 로고
        view.addSubview(menuCategoryViews.logo)
        menuCategoryViews.logo.snp.makeConstraints {
            $0.top.height.equalTo(60)
            $0.leading.trailing.equalToSuperview()
        }
        
        // MARK: SegmentedControl
        view.addSubview(menuCategoryViews.segmentControl)
        menuCategoryViews.segmentControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        menuCategoryViews.segmentControl.snp.makeConstraints {
            $0.top.equalTo(menuCategoryViews.logo.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        menuCategoryViews.segmentControl.layer.cornerRadius = 0
        
        // MARK: Place Holder 뷰들 레이아웃
        [menuCategoryViews.chickenView, menuCategoryViews.sidedishView, menuCategoryViews.drinkView, menuCategoryViews.etcView].forEach {
            view.addSubview($0)
            $0.snp.makeConstraints {
                $0.width.equalToSuperview()
                $0.height.equalTo(352)
                $0.top.equalTo(menuCategoryViews.segmentControl.snp.bottom)
            }
        }
        
        // MARK: 주문 요약 뷰 추가
        view.addSubview(orderSummaryView)
        orderSummaryView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview() // 화면 하단에 고정
            $0.height.equalTo(300) // 주문 요약 뷰 높이 설정
        }
    }

    // MARK: 클릭 시 뷰 변경되는 로직
    @objc func segmentChanged(_ sender: UISegmentedControl) {
        [menuCategoryViews.chickenView, menuCategoryViews.sidedishView, menuCategoryViews.drinkView, menuCategoryViews.etcView].forEach {
            $0.isHidden = true // 해당 뷰 제외 나머지는 안보이게 숨김
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

#Preview("MainViewController") {
    MainViewController()
}
