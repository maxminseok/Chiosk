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

    let menuListNavigator = MenuListNavigatorVC()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
    }

    // UI 설정
    private func setupUI() {
        // menuListNavigator를 하위 뷰로 추가
        addChild(menuListNavigator)
        view.addSubview(menuListNavigator.view)
        menuListNavigator.didMove(toParent: self)
    }

    // 제약 조건 설정
    private func setupConstraints() {
        menuListNavigator.view.snp.makeConstraints { make in
            make.edges.equalToSuperview() // 전체 화면에 꽉 차게
        }
    }
}

#Preview("MainViewController") {
    MainViewController()
}
