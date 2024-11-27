//
//  OrderSummaryViewCell.swift
//  ChioskApp
//
//  Created by 강민성 on 11/27/24.
//

import UIKit

class OrderSummaryViewCell: UICollectionViewCell {
    
    private let containerView = UIView() // 셀 전체 영역을 감싸는 컨테이너 뷰
    private let chickenImageView = UIImageView() // 치킨 이미지 표시할 뷰
    private let goodsLabel = UILabel() // 상품명 표시하는 레이블
    private let priceLabel = UILabel() // 가격 표시하는 레이블
    private let quantityLabel = UILabel() // 수량 표시하는 레이블
    private let minusButton = UIButton() // 수량 감소 버튼
    private let plusButton = UIButton() // 수량 증가 버튼
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI() // 셀 UI 설정 메서드 호출
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") // 서브 클래싱할 때 반드시 구현해야 하는 초기화 메서드 중 한다.
    }
    
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
        
        // 치킨 이미지 뷰 설정
        chickenImageView.image = UIImage(named: "Chickens_Fried") // 기본 이미지 설정
        chickenImageView.backgroundColor = .white // 배경색 흰색
        chickenImageView.contentMode = .scaleAspectFit // 비율 유지
        contentView.addSubview(chickenImageView) // 컨테이너 뷰에 이미지 뷰 추가
        
        // 이미지 뷰 레이아웃 설정
        chickenImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(12) // 위쪽에서 12 간격
            $0.centerX.equalToSuperview() // 가로 중심 정렬
            $0.width.equalTo(65) // 가로 크기
            $0.height.equalTo(77) // 세로 크기

        }
        
        // 상품명 레이블 설정
        goodsLabel.text = "후라이드1" // 임시 텍스트
        goodsLabel.font = .boldSystemFont(ofSize: 10) // 폰트 사이즈 10, 폰트 타입 시스템 폰트
        goodsLabel.textColor = .black // 텍스트 색상 검정색
        goodsLabel.textAlignment = .center // 중앙 정렬
        contentView.addSubview(goodsLabel) // 컨테이너 뷰에 상품명 레이블 추가
        
        // 상품명 레이블 레이아웃 설정
        goodsLabel.snp.makeConstraints {
            $0.top.equalTo(chickenImageView.snp.bottom).offset(12) // 이미지 하단 12 간격
            $0.leading.trailing.equalToSuperview().inset(5) // 좌우 여백 5 간격
        }

        // 가격 레이블 설정
        priceLabel.text = "25,000원" // 임시 테스트
        priceLabel.font = .systemFont(ofSize: 12, weight: .light) // 가벼운 폰트 설정
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


#Preview("MenuSelectionHandler") {
    //뷰 컨트롤러 생성
    OrderSummaryView()
}
