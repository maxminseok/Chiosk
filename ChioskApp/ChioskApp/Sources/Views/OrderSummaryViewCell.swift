//
//  OrderSummaryViewCell.swift
//  ChioskApp
//
//  Created by 강민성 on 11/27/24.
//

import UIKit

class OrderSummaryViewCell: UICollectionViewCell {
    var menu: (image: String, title: String, price: String)? { // 메뉴 데이터
        didSet {    // 업데이트 되도록 변경
            guard let menu = menu else { return }
            chickenImageView.image = UIImage(named: menu.image)
            goodsLabel.text = menu.title
            priceLabel.text = menu.price
        }
    }
    
    private let containerView = UIView() // 셀 전체 영역을 감싸는 컨테이너 뷰
    private let chickenImageView = UIImageView() // 치킨 이미지 표시할 뷰
    private let goodsLabel = UILabel() // 상품명 표시하는 레이블
    private let priceLabel = UILabel() // 가격 표시하는 레이블
    private let quantityLabel = UILabel() // 수량 표시하는 레이블
    private let minusButton = UIButton() // 수량 감소 버튼
    private let plusButton = UIButton() // 수량 증가 버튼
    
    func setQuantityLabel(_ quantity: Int) {
        quantityLabel.text = "\(quantity)"
    }
    
    func getQuantityLabel() -> String {
        return quantityLabel.text ?? "0"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI() // 셀 UI 설정 메서드 호출
        setupActions() // 버튼 액션 설정
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // 서브 클래싱할 때 반드시 구현해야 하는 초기화 메서드 중 한다.
    }
}

extension OrderSummaryViewCell {
    private func setupCellUI() {
        
        // 컨테이너 뷰 설정
        containerView.backgroundColor = .white // 배경색 하얀색으로 설정
        containerView.layer.cornerRadius = 8 // 컨테이너의 모시러 둥글게 설정
        containerView.layer.borderWidth = 1 // 테두리 두께 설정
        containerView.layer.borderColor = UIColor.systemGray4.cgColor // 테두리 색상 설정
        contentView.addSubview(containerView) // 컨테이너 뷰를 셀에 추가
        
        // 컨테이너 뷰 레이아웃 설정
        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview() // 셀의 전체 영역을 채우도록 설정
        }
        
        // 컨테이너 뷰 그림자 설정
        layer.shadowColor = UIColor.black.cgColor // 그림자 색상
        layer.shadowOpacity = 0.2 // 그림자 투명도
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowRadius = 4 // 그림자 흐림 정도
        layer.masksToBounds = false // 그림자가 잘리지 않도록 설정
        
        // 치킨 이미지 뷰 설정
        chickenImageView.image = UIImage(named: "Chickens_Fried") // 기본 이미지 설정
        chickenImageView.backgroundColor = .white // 배경색 흰색
        chickenImageView.contentMode = .scaleAspectFit // 비율 유지
        contentView.addSubview(chickenImageView) // 컨테이너 뷰에 이미지 뷰 추가
        
        // 이미지 뷰 레이아웃 설정
        chickenImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(4) // 위쪽에서 12 간격
            $0.centerX.equalToSuperview() // 가로 중심 정렬
            $0.width.equalTo(100) // 가로 크기
            $0.height.equalTo(80) // 세로 크기

        }
        
        // 상품명 레이블 설정
        goodsLabel.text = "후라이드1" // 임시 텍스트
        goodsLabel.font = .boldSystemFont(ofSize: 14) // 폰트 사이즈 14, 폰트 타입 시스템 폰트
        goodsLabel.textColor = .black // 텍스트 색상 검정색
        goodsLabel.textAlignment = .center // 중앙 정렬
        contentView.addSubview(goodsLabel) // 컨테이너 뷰에 상품명 레이블 추가
        
        // 상품명 레이블 레이아웃 설정
        goodsLabel.snp.makeConstraints {
            $0.top.equalTo(chickenImageView.snp.bottom).offset(4) // 이미지 하단 12 간격
            $0.leading.trailing.equalToSuperview().inset(5) // 좌우 여백 5 간격
        }

        // 가격 레이블 설정
        priceLabel.text = "25,000원" // 임시 테스트
        priceLabel.font = .boldSystemFont(ofSize: 14)
        priceLabel.textAlignment = .center // 중앙 정렬
        priceLabel.textColor = .chioskSecondaryColor // 텍스트 색상 설정
        contentView.addSubview(priceLabel) // 컨테이너 뷰에 가격 레이블 추가
        
        // 가격 레이블 레이아웃 설정
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(goodsLabel.snp.bottom).offset(2) // 상품명 레이블 하단 2 포인트 간격
            $0.leading.trailing.equalToSuperview().inset(5) // 좌우 여백 5 포인트
        }
        
        // 수량 감소 버튼 설정
        minusButton.setTitle("-", for: .normal) // 텍스트 - 설정
        minusButton.layer.borderWidth = 1 // 테두리 두께를 1 설정
        minusButton.layer.borderColor = UIColor.systemGray6.cgColor // 테두리 색상 설정
        minusButton.setTitleColor(.black, for: .normal) // 텍스트 색상 설정
        minusButton.backgroundColor = .white // 배경 흰색 설정
        minusButton.layer.cornerRadius = 4 // 모서리 4 둥글게 설정
        minusButton.titleLabel?.font = .systemFont(ofSize: 10) // 폰트 크기 설정
        
        // 수량 감소 버튼 레이아웃 설정
        minusButton.snp.makeConstraints {
            $0.width.equalTo(20) // 버튼의 너비 20
            $0.height.equalTo(16) // 버튼의 높이 16
        }
        
        // 수량 증가 버튼 설정
        plusButton.setTitle("+", for: .normal) // 텍스트 설정
        plusButton.layer.borderWidth = 1 // 테두리 두께 설정
        plusButton.layer.borderColor = UIColor.chioskSecondary.cgColor // 테두리 색상 설정
        plusButton.setTitleColor(.black, for: .normal) // 텍스트 색상 설정
        plusButton.backgroundColor = .chioskSecondary // 배경색 설정
        plusButton.layer.cornerRadius = 4 // 모서리 둥글게 설정
        plusButton.titleLabel?.font = .systemFont(ofSize: 10) // 폰트 크기 설정
        
        // 수량 증가 버튼 레이아웃 설정
        plusButton.snp.makeConstraints {
            $0.width.equalTo(20) // 버튼의 너비 20
            $0.height.equalTo(16) // 버튼의 높이 16
        }
        
        // 수량 표시 레이블 설정
        quantityLabel.text = "0" // 임시 수량
        quantityLabel.font = .systemFont(ofSize: 14) // 폰트 크기 설정
        quantityLabel.textAlignment = .center // 중앙 정렬

        // 수량 조절 버튼 및 레이블 UIStackView 설정
        let controlStack = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton]) // 버튼들과 레이블을 포함하는 스택뷰 생성
        controlStack.axis = .horizontal // 수평 정렬
        controlStack.spacing = 7 // 뷰 간 간격
        controlStack.alignment = .center // 정렬 설정
        contentView.addSubview(controlStack) // 컨테이너 뷰에 스택뷰 추가
        
        // 스택뷰 레이아웃 설정
        controlStack.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(5) // 가격 레이블 아래 5 포인트 간격
            $0.centerX.equalToSuperview() // 가로 중심 정렬
        }
    }
}

extension OrderSummaryViewCell {
    private func setupActions() {
        minusButton.addTarget(self, action: #selector(decreaseQuantity), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(increaseQuantity), for: .touchUpInside)
    }
    
    @objc private func decreaseQuantity() {
        guard let menuTitle = menu?.title else { return }
        OrderManager.shared.decreaseMenu(menuTitle)
        NotificationCenter.default.post(name: .orderUpdated, object: nil) // 상태 업데이트 알림
    }
    
    @objc private func increaseQuantity() {
        guard let menu = menu else { return }
        let success = OrderManager.shared.addMenu(menu)
        if !success {
            NotificationCenter.default.post(name: .showAlert, object: "주문 금액 한도는 1,000,000원 입니다.")
        }
        NotificationCenter.default.post(name: .orderUpdated, object: nil) // 상태 업데이트 알림
    }
}

// 그림자 구현으로 인해 확인하면서 작업을 하고 싶어서 메서드 호출.
#Preview("MainViewController") {
    MainViewController()
}
