//
//  OrderSummaryView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  선택 항목 및 버튼 표시 뷰
//

import SnapKit
import UIKit

let cellID = "OrderCell" // 컬렉션 뷰 셀의 재사용을 위한 식별자 설정

class OrderSummaryView: UIView {
    
    // MARK: - Properties
    private var entireView = UIView() // 주문 하단 전체 뷰
    
    // 레이블 정의
    private let itemQuantityLabel = UILabel()  // 총 수량 표시
    private let totalAmountLabel = UILabel()  // 합계 레이블
    private let amountValueLabel = UILabel()  // 금액 표시 레이블
    
    // 버튼 정의
    private var employeeCallButton = UIButton()  // 직원 호출 버튼
    private var cancelButton = UIButton()  // 취소 버튼
    private var paymentButton = UIButton()  // 결제 버튼
    
    // 컬렉션 뷰 정의
    let collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal // 가로 스크롤 설정
        flowlayout.minimumLineSpacing = 9 // 셀 간 간격
        flowlayout.itemSize = CGSize(width: 160, height: 160) // 셀 크기 설정
        return UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
    }()
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI() // UI 구성 메서드 호출
        setupButtons() // 버튼 구성 메서드 호출
        setupNotifications() // 알림 등록
        setupCollectionView() // 컬렉션 뷰 설정
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private func alert() {
    let alert = UIAlertController(title: "직원호출", message: "직원을 호출하시겠습니까?", preferredStyle: .alert)
    let yes = UIAlertAction(title: "호출", style: .default, handler: nil)
    let cancel = UIAlertAction(title: "취소", style: .destructive, handler: nil)
    
    alert.addAction(yes)
    alert.addAction(cancel)
    
    //present(alert, animated: true)
}



// MARK: - UI Setup
extension OrderSummaryView {
    private func setupUI() {
        backgroundColor = .white // 기본 배경을 흰색으로 설정
    
        // 하단 전체 뷰 설정
        entireView.backgroundColor = .systemGray6 // 배경색 시스템 회색
        entireView.layer.cornerRadius = 10 // 모서리를 둥글게 설정
        addSubview(entireView) // 뷰에 추가하여 표시
        
        // 하단 전체 뷰 레이아웃
        entireView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview() // 뷰 전체를 채움
        }
        
        // 컬렉션 뷰 설정
        collectionView.backgroundColor = .systemGray6 // 컬렉션 뷰 배경색 시스템 회색
        entireView.addSubview(collectionView) // 컬렉션 뷰를 하단 전체 뷰에 추가
        
        // 컬렉션 뷰 레이아웃 설정
        collectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100) // 하단 간격 100
            $0.top.equalToSuperview().inset(59) // 상단 간격 59
            $0.leading.equalToSuperview().inset(33) // 왼쪽 간격 33
            $0.trailing.equalToSuperview() // 오른쪽 간격 0
        }
        
        // 셀 등록
        collectionView.register(OrderSummaryViewCell.self, forCellWithReuseIdentifier: cellID)
        
        // 수량 레이블 설정
        itemQuantityLabel.text = "0개" // 초기 텍스트 설정
        itemQuantityLabel.textColor = .black // 텍스트 색상은 검정색 설정
        itemQuantityLabel.font = .boldSystemFont(ofSize: 25) // 폰트 사이즈 25, 폰트 타입은 시스템 폰트
        entireView.addSubview(itemQuantityLabel) // 수량 레이블 추가
        
        // 수량 레이블 레이아웃
        itemQuantityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(31) // 왼쪽 간격 31
            $0.top.equalToSuperview().inset(20) // 위쪽 간격 20
        }
        
        // 합계 레이블 설정
        totalAmountLabel.text = "합계" // 초기 텍스트 설정
        totalAmountLabel.textColor = .black // 텍스트 색상은 검정색 설정
        totalAmountLabel.font = .boldSystemFont(ofSize: 25) // 폰트 사이즈 25, 폰트 타입은 시스템 폰트
        entireView.addSubview(totalAmountLabel) // 합계 레이블 추가
        
        // 합계 레이블 레이아웃
        totalAmountLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(196) // 왼쪽에서 간격 196
            $0.top.equalToSuperview().inset(20) // 위쪽에서 간격 20
        }
        
        // 금액 표시 레이블 설정
        amountValueLabel.text = "0원" // 초기 금액 설정
        amountValueLabel.textColor = .chioskPrimary // 텍스트 색상은 chioskPrimary 설정
        amountValueLabel.font = .boldSystemFont(ofSize: 25) // 폰트 사이즈 25, 폰트 타입은 시스템 폰트
        entireView.addSubview(amountValueLabel) // 금액 레이블 추가
        
        // 금액 표시 레이아웃
        amountValueLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30) // 오른쪽에서 간격 30
            $0.centerY.equalTo(totalAmountLabel) // 합계 레이블과 세로 중앙 정렬
        }
    }
}

// MARK: - Button Actions
extension OrderSummaryView {
    private func setupButtons() {
        // 직원 호출 버튼 설정
        employeeCallButton.setTitle("직원호출", for: .normal)
        employeeCallButton.backgroundColor = .systemGray4
        employeeCallButton.layer.cornerRadius = 10
        employeeCallButton.setTitleColor(.black, for: .normal)
        employeeCallButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        entireView.addSubview(employeeCallButton)
        
        // 직원 호출 버튼 그림자 설정
        employeeCallButton.layer.shadowColor = UIColor.black.cgColor
        employeeCallButton.layer.shadowOpacity = 0.4
        employeeCallButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        employeeCallButton.layer.shadowRadius = 4
        
        employeeCallButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(33)
            $0.bottom.equalToSuperview().inset(48)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        // 취소 버튼 설정
        cancelButton.setTitle("취소하기", for: .normal)
        cancelButton.backgroundColor = .systemGray4
        cancelButton.layer.cornerRadius = 10
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        entireView.addSubview(cancelButton)
        
        // 취소 버튼 그림자 설정
        cancelButton.layer.shadowColor = UIColor.black.cgColor
        cancelButton.layer.shadowOpacity = 0.4
        cancelButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        cancelButton.layer.shadowRadius = 4
        
        cancelButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(48)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        // 결제 버튼 설정
        paymentButton.setTitle("결제하기", for: .normal)
        paymentButton.backgroundColor = .systemRed
        paymentButton.layer.cornerRadius = 10
        paymentButton.setTitleColor(.white, for: .normal)
        paymentButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        paymentButton.addTarget(self, action: #selector(handlePayment), for: .touchUpInside)
        entireView.addSubview(paymentButton)
        
        // 결제 버튼 그림자 추가
        paymentButton.layer.shadowColor = UIColor.black.cgColor
        paymentButton.layer.shadowOpacity = 0.4
        paymentButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        paymentButton.layer.shadowRadius = 4
        
        paymentButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(33)
            $0.bottom.equalToSuperview().inset(48)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }

    @objc private func handlePayment() {
        if OrderManager.shared.orders.isEmpty {
            print("주문 내역이 없습니다.") // 예외 처리
            return
        }
        
        let totalAmount = OrderManager.shared.totalAmount
        print("결제 완료: \(totalAmount)원")
        
        // 결제 완료 후 초기화
        OrderManager.shared.resetOrders()
        NotificationCenter.default.post(name: .orderUpdated, object: nil) // 상태 업데이트 알림
    }
}

// MARK: - CollectionView DataSource & Delegate
extension OrderSummaryView: UICollectionViewDataSource, UICollectionViewDelegate {
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return OrderManager.shared.orders.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? OrderSummaryViewCell else {
            return UICollectionViewCell()
        }
        let order = OrderManager.shared.orders[indexPath.row]
        cell.menu = order.menu
        cell.setQuantityLabel(order.quantity)
        return cell
    }
}

// MARK: - Notification Setup
extension OrderSummaryView {
    private func setupNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(updateOrderData),
            name: .orderUpdated,
            object: nil
        )
    }
    
    @objc private func updateOrderData() {
        collectionView.reloadData()
        itemQuantityLabel.text = "\(OrderManager.shared.totalQuantity)개" // 총 주문 수량으로 변경
        amountValueLabel.text = "\(OrderManager.shared.totalAmount)원"
    }
}
