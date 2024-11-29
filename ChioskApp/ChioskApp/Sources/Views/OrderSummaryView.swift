//
//  OrderSummaryView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//
//  Description:
//  - 이 클래스는 주문 요약 정보를 보여주고, 결제 및 직원 호출 등의 버튼을 포함하는 뷰입니다.
//  - 총 수량, 총 금액, 주문 목록을 관리하며, 사용자 입력 이벤트를 처리합니다.
//

import SnapKit
import UIKit

/// 재사용 식별자 상수
private let cellID = "OrderCell"

/// `OrderSummaryView`
/// - 주문 요약 정보를 표시하고 사용자와 상호작용하는 UI 컴포넌트
class OrderSummaryView: UIView {
    
    // MARK: - Properties
    
    /// 주문 요약 뷰의 전체 컨테이너 뷰
    private var entireView = UIView()
    
    /// 주문 수량을 표시하는 레이블
    private let itemQuantityLabel = UILabel()
    
    /// 총 금액 라벨
    private let totalAmountLabel = UILabel()
    
    /// 금액 값을 표시하는 레이블
    private let amountValueLabel = UILabel()
    
    /// 직원 호출 버튼
    private var employeeCallButton = UIButton()
    
    /// 취소 버튼
    private var cancelButton = UIButton()
    
    /// 결제 버튼
    private var paymentButton = UIButton()
    
    /// 주문 목록을 표시하는 컬렉션 뷰
    private let collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.scrollDirection = .horizontal
        flowlayout.minimumLineSpacing = 9
        flowlayout.itemSize = CGSize(width: 160, height: 160)
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    // MARK: - Initializers
    
    /// 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupButtons()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup
extension OrderSummaryView {
    
    /// UI 구성 메서드
    private func setupUI() {
        backgroundColor = .white
        
        // 전체 컨테이너 뷰 설정
        entireView.backgroundColor = .systemGray6
        entireView.layer.cornerRadius = 10
        addSubview(entireView)
        
        entireView.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalToSuperview()
        }
        
        // 컬렉션 뷰 설정
        collectionView.backgroundColor = .systemGray6
        entireView.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.top.equalToSuperview().inset(59)
            $0.leading.equalToSuperview().inset(33)
            $0.trailing.equalToSuperview()
        }
        
        collectionView.register(OrderSummaryViewCell.self, forCellWithReuseIdentifier: cellID)
        
        // 수량 레이블 설정
        itemQuantityLabel.text = "0개"
        itemQuantityLabel.textColor = .black
        itemQuantityLabel.font = .boldSystemFont(ofSize: 25)
        entireView.addSubview(itemQuantityLabel)
        
        itemQuantityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(31)
            $0.top.equalToSuperview().inset(20)
        }
        
        // 합계 레이블 설정
        totalAmountLabel.text = "합계"
        totalAmountLabel.textColor = .black
        totalAmountLabel.font = .boldSystemFont(ofSize: 25)
        entireView.addSubview(totalAmountLabel)
        
        totalAmountLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(196)
            $0.top.equalToSuperview().inset(20)
        }
        
        // 금액 표시 레이블 설정
        amountValueLabel.text = "0원"
        amountValueLabel.textColor = .chioskPrimary
        amountValueLabel.font = .boldSystemFont(ofSize: 25)
        entireView.addSubview(amountValueLabel)
        
        amountValueLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30)
            $0.centerY.equalTo(totalAmountLabel)
        }
    }
}

// MARK: - Button Setup
extension OrderSummaryView {
    
    /// 버튼 구성 메서드
    private func setupButtons() {
        // 직원 호출 버튼 설정
        employeeCallButton.setTitle("직원 호출", for: .normal)
        employeeCallButton.backgroundColor = .systemGray4
        employeeCallButton.layer.cornerRadius = 10
        employeeCallButton.setTitleColor(.black, for: .normal)
        employeeCallButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        entireView.addSubview(employeeCallButton)
        
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
        entireView.addSubview(paymentButton)
        
        paymentButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(33)
            $0.bottom.equalToSuperview().inset(48)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
}

// MARK: - CollectionView DataSource & Delegate
extension OrderSummaryView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    /// 컬렉션 뷰 초기화
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    /// 섹션당 항목 수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return OrderManager.shared.orders.count
    }
    
    /// 셀 생성 및 데이터 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? OrderSummaryViewCell else {
            return UICollectionViewCell()
        }
        
        let order = OrderManager.shared.orders[indexPath.row]
        cell.menu = order.menu
        cell.setQuantityLabel(order.quantity)
        cell.updateMinusButton(quantity: order.quantity) // 함수 호출
        return cell
    }
}

// MARK: Public Methods
extension OrderSummaryView {
    /// 외부에서 cancelButton에 액션을 설정하는 메서드
    func setCancelButtonAction(target: Any, action: Selector) {
        cancelButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    /// 외부에서 employeeCallButton에 액션을 설정하는 메서드
    func setEmployeeCallButtonAction(target: Any, action: Selector) {
        employeeCallButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    /// 외부에서 paymentButton에 액션을 설정하는 메서드
    func setPaymentButtonAction(target: Any, action: Selector) {
        paymentButton.addTarget(target, action: action, for: .touchUpInside)
    }
    
    /// 주문 데이터를 리로드
    func reloadOrderCollectionView() {
        collectionView.reloadData()
    }
    
    /// 주문 수량 레이블을 업데이트
    /// - Parameter quantity: 총 주문 수량
    func updateItemQuantityLabel(with quantity: Int) {
        itemQuantityLabel.text = "\(quantity)개"
    }
    
    /// 총 금액 레이블을 업데이트
    /// - Parameter amount: 총 금액
    func updateAmountValueLabel(with amount: Int) {
        amountValueLabel.text = "\(amount)원"
    }
}
