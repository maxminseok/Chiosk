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

class MainViewController: UIViewController, MenuListViewDelegate {
    
    let menuCategoryViews = MenuCategoryView() // 메뉴 카테고리 뷰
    let orderSummaryView = OrderSummaryView()  // 주문 요약 뷰
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        segmentChanged(menuCategoryViews.segmentControl) // 초기 SegmentedControl 선택
        setupNotifications()
        
        menuCategoryViews.chickenMenu.delegate = self
        menuCategoryViews.sidedishMenu.delegate = self
        menuCategoryViews.drinkMenu.delegate = self
        menuCategoryViews.etcMenu.delegate = self
        
        orderSummaryView.cancelButton.addTarget(self, action: #selector(handleCancelOrder), for: .touchUpInside)
    }
    
    //MARK: 직원호출 Alert
    @objc func callAlert() {
        let alert = UIAlertController(title: "직원 호출", message: "직원을 호출하시겠습니까?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "호출", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(yes)
        
        present(alert, animated: true)
    }
}

// MARK: 로고, SegmentedControl, Place Holder, OrderSummaryView 추가
extension MainViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        //직원 호출 Alert을 위한 버튼액션
        orderSummaryView.employeeCallButton.addTarget(self, action: #selector(callAlert), for: .touchUpInside)
        
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
            $0.height.equalTo(342) // 주문 요약 뷰 높이 설정
        }
        
        // 테스트
        //Alert을 위한 버튼액션
        //orderSummaryView.setupButtons.addTarget(self, action: #selector(callAlert), for: .touchUpInside)
    }
}

// MARK: 클릭 시 뷰 변경되는 로직
extension MainViewController {
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

// MARK: 메뉴 추가 로직
extension MainViewController {
    func menuListView(_ menuListView: MenuListView, didSelectMenu menu: (image: String, title: String, price: Int)) {
        // 메뉴를 OrderManager에 추가
        let success = OrderManager.shared.addMenu(menu)
        if !success {
            // 경고 창 표시
            let alert = UIAlertController(title: "경고", message: "주문 금액 한도는 1,000,000원 입니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }

        // 상태 업데이트
        NotificationCenter.default.post(name: .orderUpdated, object: nil)

        // 디버깅 출력
        print("선택된 메뉴: \(menu.title), 가격: \(menu.price)")
    }

}

extension MainViewController {
    @objc private func handleCancelOrder() {
        // 주문 내역이 비어있는지 확인
        guard !OrderManager.shared.orders.isEmpty else {
            print("취소할 주문 내역이 없습니다.")
            return
        }
        
        // UIAlertController로 사용자 확인
        let alert = UIAlertController(
            title: "주문 취소",
            message: "주문 내역을 모두 취소할까요?",
            preferredStyle: .alert
        )

        // "확인" 버튼 액션
        let confirmAction = UIAlertAction(title: "주문 취소", style: .destructive) { _ in
            // 주문 취소 로직 수행
            if OrderManager.shared.orders.isEmpty {
                print("취소할 주문 내역이 없습니다.")
            } else {
                print("주문이 취소되었습니다.")
                OrderManager.shared.resetOrders()
                NotificationCenter.default.post(name: .orderUpdated, object: nil)
            }
        }

        // "돌아가기" 버튼 액션
        let cancelAction = UIAlertAction(title: "돌아가기", style: .cancel, handler: nil)

        // 액션 추가
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)

        // Alert 뷰를 표시
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Notification Setup
extension MainViewController {
    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateOrderData),
            name: .orderUpdated,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showAlert(notification:)),
            name: .showAlert,
            object: nil)
    }
    
    @objc private func updateOrderData() {
        orderSummaryView.collectionView.reloadData()
        orderSummaryView.itemQuantityLabel.text = "\(OrderManager.shared.totalQuantity)개" // 총 주문 수량으로 변경
        orderSummaryView.amountValueLabel.text = "\(OrderManager.shared.totalAmount)원"
    }
    
    @objc private func showAlert(notification: Notification) {
        if let message = notification.object as? String {
            let alert = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
}
