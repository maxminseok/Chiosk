//
//  OrderSummaryViewCell.swift
//  ChioskApp
//
//  Created on 11/27/24.
//
//  Description:
//  - 주문 요약 화면에서 개별 메뉴를 표시하는 UICollectionViewCell입니다.
//  - 이미지, 이름, 가격, 수량 및 수량 조절 버튼을 포함하며, 데이터 바인딩과 사용자 상호작용을 처리합니다.
//

import UIKit

/// `OrderSummaryViewCell`
/// - 주문 요약 화면의 메뉴 항목을 표시하는 셀
/// - 수량 조절 버튼을 통해 수량 증가 및 감소 이벤트 처리
class OrderSummaryViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    /// 메뉴 데이터
    /// - 설정될 때마다 UI 요소가 업데이트됩니다.
    internal var menu: (image: String, title: String, price: Int)? {
        didSet {
            guard let menu = menu else { return }
            chickenImageView.image = UIImage(named: menu.image)
            goodsLabel.text = menu.title
            priceLabel.text = "\(menu.price)원"
        }
    }
    
    // UI 요소들
    private let containerView = UIView() // 셀의 전체 영역을 감싸는 컨테이너
    private let chickenImageView = UIImageView() // 메뉴 이미지를 표시하는 이미지 뷰
    private let goodsLabel = UILabel() // 메뉴 이름을 표시하는 레이블
    private let priceLabel = UILabel() // 메뉴 가격을 표시하는 레이블
    private let quantityLabel = UILabel() // 메뉴 수량을 표시하는 레이블
    private let minusButton = UIButton() // 수량 감소 버튼
    private let plusButton = UIButton() // 수량 증가 버튼
    
    // MARK: - Methods
    
    /// 수량 레이블 업데이트
    /// - Parameters:
    ///   - quantity: 업데이트할 수량
    func setQuantityLabel(_ quantity: Int) {
        quantityLabel.text = "\(quantity)"
    }
    
    /// 현재 수량 값 반환
    /// - Returns: 현재 수량 값
    func getQuantityLabel() -> String {
        return quantityLabel.text ?? "0"
    }
    
    // MARK: - Initializers
    
    /// 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI() // 셀 UI 구성
        setupActions() // 버튼 액션 구성
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Setup
extension OrderSummaryViewCell {
    /// 셀 UI 구성
    private func setupCellUI() {
        // 컨테이너 뷰 설정
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.addSubview(containerView)
        
        // 컨테이너 뷰 제약 조건
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // 그림자 설정
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4
        layer.masksToBounds = false
        
        // 치킨 이미지 뷰 설정
        chickenImageView.contentMode = .scaleAspectFit
        chickenImageView.backgroundColor = .white
        contentView.addSubview(chickenImageView)
        
        // 이미지 뷰 제약 조건
        chickenImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(80)
        }
        
        // 상품명 레이블 설정
        goodsLabel.font = .boldSystemFont(ofSize: 14)
        goodsLabel.textColor = .black
        goodsLabel.textAlignment = .center
        contentView.addSubview(goodsLabel)
        
        // 상품명 레이블 제약 조건
        goodsLabel.snp.makeConstraints {
            $0.top.equalTo(chickenImageView.snp.bottom).offset(4)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        // 가격 레이블 설정
        priceLabel.font = .boldSystemFont(ofSize: 14)
        priceLabel.textColor = .chioskSecondaryColor
        priceLabel.textAlignment = .center
        contentView.addSubview(priceLabel)
        
        // 가격 레이블 제약 조건
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(goodsLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        // 수량 조절 스택뷰 구성
        let controlStack = createControlStackView()
        contentView.addSubview(controlStack)
        
        // 스택뷰 제약 조건
        controlStack.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
    }
    
    /// 수량 조절 스택뷰 생성
    private func createControlStackView() -> UIStackView {
        minusButton.setTitle("-", for: .normal)
        minusButton.setStyle(borderColor: .systemGray6, backgroundColor: .white)
        
        plusButton.setTitle("+", for: .normal)
        plusButton.setStyle(borderColor: .chioskSecondary, backgroundColor: .chioskSecondary)
        
        quantityLabel.font = .systemFont(ofSize: 14)
        quantityLabel.textAlignment = .center
        
        let stack = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        stack.axis = .horizontal
        stack.spacing = 7
        stack.alignment = .center
        return stack
    }
}

// MARK: - Button Actions
extension OrderSummaryViewCell {
    /// 버튼 액션 구성
    private func setupActions() {
        minusButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
    }
    
    /// 수량 감소 처리
    @objc private func decreaseQuantity() {
        guard let menuTitle = menu?.title else { return }
        OrderManager.shared.decreaseMenu(menuTitle)
        NotificationCenter.default.post(name: .orderUpdated, object: nil)
    }
    
    /// 수량 증가 처리
    @objc private func increaseQuantity() {
        guard let menu = menu else { return }
        let success = OrderManager.shared.addMenu(menu)
        if !success {
            NotificationCenter.default.post(name: .showAlert, object: "주문 금액 한도는 1,000,000원 입니다.")
        }
        NotificationCenter.default.post(name: .orderUpdated, object: nil)
    }
}

// MARK: - UIButton Extension for Styling
private extension UIButton {
    /// 버튼 스타일 설정
    func setStyle(borderColor: UIColor, backgroundColor: UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = 4
        self.titleLabel?.font = .systemFont(ofSize: 10)
        self.backgroundColor = backgroundColor
        self.setTitleColor(.black, for: .normal)
    }
}
