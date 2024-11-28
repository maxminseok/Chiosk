//
//  MainViewController.swift
//  ChioskApp
//
//  Created on 2024-11-25.
//
//  Description:
//  - 이 파일은 MainViewController의 구현을 포함하며, 앱의 주요 UI를 관리합니다.
//  - MenuCategoryView와 OrderSummaryView를 조합하여 메뉴 선택, 주문 요약, 직원 호출, 주문 취소 등의 기능을 제공합니다.
//  - NotificationCenter를 활용하여 주문 데이터 변경 시 뷰를 업데이트합니다.
//

import UIKit
import SnapKit
import Then

// MARK: - MainViewController
class MainViewController: UIViewController {
    
    // MARK: - Properties
    let menuCategoryViews = MenuCategoryView() // 메뉴 카테고리 뷰
    let orderSummaryView = OrderSummaryView()  // 주문 요약 뷰
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        segmentChanged(menuCategoryViews.segmentControl) // 초기 SegmentedControl 선택
        setupNotifications()
        
        setupMenuDelegates()
        setupOrderSummaryActions()
    }
}

// MARK: - UI Configuration
extension MainViewController {
    func configureUI() {
        view.backgroundColor = .white
        
        // MARK: 직원 호출 Alert 버튼 액션 설정
        orderSummaryView.employeeCallButton.addTarget(self, action: #selector(callAlert), for: .touchUpInside)
        
        // MARK: 상단 로고 추가
        view.addSubview(menuCategoryViews.logo)
        menuCategoryViews.logo.snp.makeConstraints {
            $0.top.height.equalTo(60)
            $0.leading.trailing.equalToSuperview()
        }
        
        // MARK: SegmentedControl 추가
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
        
        // MARK: 주문 요약 뷰 추가
        view.addSubview(orderSummaryView)
        orderSummaryView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview() // 화면 하단에 고정
            $0.height.equalTo(342) // 주문 요약 뷰 높이 설정
        }
    }
}

// MARK: - Menu Delegates Setup
extension MainViewController {
    private func setupMenuDelegates() {
        menuCategoryViews.chickenMenu.delegate = self
        menuCategoryViews.sidedishMenu.delegate = self
        menuCategoryViews.drinkMenu.delegate = self
        menuCategoryViews.etcMenu.delegate = self
    }
}

// MARK: - Order Summary Actions Setup
extension MainViewController {
    private func setupOrderSummaryActions() {
        orderSummaryView.cancelButton.addTarget(self, action: #selector(handleCancelOrder), for: .touchUpInside)
    }
}

// MARK: - Alert Handlers
extension MainViewController {
    // MARK: 직원 호출 Alert
    @objc func callAlert() {
        let alert = UIAlertController(title: "직원 호출", message: "직원을 호출하시겠습니까?", preferredStyle: .alert)
        let yes = UIAlertAction(title: "호출", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(yes)
        
        present(alert, animated: true)
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

// MARK: - Segmented Control Logic
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

// MARK: - Menu Selection Logic
extension MainViewController: MenuListViewDelegate {
    func menuListView(_ menuListView: MenuListView, didSelectMenu menu: (image: String, title: String, price: Int)) {
        let success = OrderManager.shared.addMenu(menu)
        if !success {
            let alert = UIAlertController(title: "경고", message: "주문 금액 한도는 1,000,000원 입니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }

        NotificationCenter.default.post(name: .orderUpdated, object: nil)
        print("선택된 메뉴: \(menu.title), 가격: \(menu.price)")
    }
}

// MARK: - Order Cancellation Logic
extension MainViewController {
    @objc private func handleCancelOrder() {
        guard !OrderManager.shared.orders.isEmpty else {
            print("취소할 주문 내역이 없습니다.")
            return
        }
        
        let alert = UIAlertController(
            title: "주문 취소",
            message: "주문 내역을 모두 취소할까요?",
            preferredStyle: .alert
        )
        
        let confirmAction = UIAlertAction(title: "주문 취소", style: .destructive) { _ in
            OrderManager.shared.resetOrders()
            NotificationCenter.default.post(name: .orderUpdated, object: nil)
            print("주문이 취소되었습니다.")
        }
        
        let cancelAction = UIAlertAction(title: "돌아가기", style: .cancel, handler: nil)
        
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Notifications
extension MainViewController {
    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateOrderData),
            name: .orderUpdated,
            object: nil
        )
    }
    
    @objc private func updateOrderData() {
        orderSummaryView.collectionView.reloadData()
        orderSummaryView.itemQuantityLabel.text = "\(OrderManager.shared.totalQuantity)개"
        orderSummaryView.amountValueLabel.text = "\(OrderManager.shared.totalAmount)원"
    }
}
