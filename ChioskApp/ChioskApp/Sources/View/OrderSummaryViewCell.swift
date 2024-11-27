//
//  OrderSummaryViewCell.swift
//  ChioskApp
//
//  Created by 강민성 on 11/27/24.
//

import UIKit

class OrderSummaryViewCell: UICollectionViewCell {
    
    private let chickenImageView = UIImageView()
    private let goodsLabel = UILabel() // 상품명 레이블
    private let priceLabel = UILabel() // 가격 레이블
    private let quantityLabel = UILabel() // 수량 표시
    private let minusButton = UIButton() // - 버튼
    private let plusButton = UIButton() // + 버튼
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCellUI() {
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8 // 모서리 반경 설정.
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        
        
        chickenImageView.image = UIImage(named: "Fried")
        chickenImageView.backgroundColor = .white
        chickenImageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(chickenImageView)
        
        chickenImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(12) // 위쪽에서 떨어진 위치
            $0.bottom.equalToSuperview().inset(80) // 아래쪽에서 떨어진 위치
            $0.centerX.equalToSuperview() // 부모 뷰의 가로 중심 정렬.
            $0.width.equalTo(65) // 뷰 가로 크기
            $0.height.equalTo(77) // 뷰 세로 크기

        }
        
        // 상품명 레이블 설정
        goodsLabel.text = "후라이드1" // 임시 텍스트
        goodsLabel.font = .boldSystemFont(ofSize: 10)
        goodsLabel.textColor = .black
        goodsLabel.textAlignment = .center
        
        contentView.addSubview(goodsLabel)
        
        goodsLabel.snp.makeConstraints {
            $0.top.equalTo(chickenImageView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(5)
        }

        // 가격 레이블 설정
        priceLabel.text = "25,000원" // 임시 테스트
        priceLabel.font = .systemFont(ofSize: 12, weight: .light)
        priceLabel.textAlignment = .center
        priceLabel.textColor = .chioskSecondaryColor
        
        contentView.addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(goodsLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalToSuperview().inset(5)
        }
        
        // 수량 조절 버튼 설정
        minusButton.setTitle("-", for: .normal)
        minusButton.layer.borderWidth = 1
        minusButton.layer.borderColor = UIColor.systemGray6.cgColor
        minusButton.setTitleColor(.black, for: .normal)
        minusButton.backgroundColor = .white
        minusButton.layer.cornerRadius = 4
        minusButton.titleLabel?.font = .systemFont(ofSize: 10)
        minusButton.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.height.equalTo(16)
        }
        
        plusButton.setTitle("+", for: .normal)
        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = UIColor.chioskSecondary.cgColor
        plusButton.setTitleColor(.black, for: .normal)
        plusButton.backgroundColor = .chioskSecondary
        plusButton.layer.cornerRadius = 4
        plusButton.titleLabel?.font = .systemFont(ofSize: 10)
        plusButton.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.height.equalTo(16)
        }
        
        // 수량 표시 레이블 설정
        quantityLabel.text = "0" // 임시 수량
        quantityLabel.font = .systemFont(ofSize: 14)
        quantityLabel.textAlignment = .center

        // 수량 조절 버튼 및 레이블
        let controlStack = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        controlStack.axis = .horizontal
        controlStack.spacing = 7
        controlStack.alignment = .center
        contentView.addSubview(controlStack)
        controlStack.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
    }
}


#Preview("MenuSelectionHandler") {
    //뷰 컨트롤러 생성
    OrderSummaryView()
}
