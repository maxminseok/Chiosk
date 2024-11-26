//
//  OrderSummaryView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  선택 항목 및 버튼 표시 뷰
//

import SnapKit
import UIKit

class MenuSelectionHandler: UIViewController {
    
    // 주문 하단 전체 뷰
    private var entireView = UIView()
    
    // 주문 내역 CollectionView
    private var collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
    
    // 주문 내역 관한 이미지, 레이블, 버튼
    private let imageView = UIImageView()
    private let orderHistoryLabel = UILabel()
    private let rderPriceLabel = UILabel()
    private let minusButton = UIButton()
    private let plusButton = UIButton()
    
    // 총 수량 및 총 금액 레이블
    private let itemQuantityLabel = UILabel() // 수량 레이블
    private let totalAmountLabel = UILabel() // 총액 레이블
    private let amountValueLabel = UILabel() // 금액 표시 레이블
    
    
    // 직원 호출 버튼, 취소 버튼, 결제 버튼
    private var employeeCallButton = UIButton() // 직원 호출 버튼
    private var cancelButton = UIButton() // 취소 버튼
    private var paymentButton = UIButton() // 결제 버튼
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtons()
    }
    
    private func setupUI() {
        // 전체 배경색
        view.backgroundColor = .white
        
        // 하단 회색 바탕의 전체 뷰
        entireView.backgroundColor = .systemGray6 // 주문 하단 전체 뷰 배경색은 시스템 회색6
        entireView.layer.cornerRadius = 12 // 모서리 둥글게 처리
        view.addSubview(entireView) // 뷰에 주문 하단 전체 뷰를 추가하여 화면에 표시되도록 설정.
        
        // SnapKit을 사용해서 레이아웃 설정
        entireView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview() // 좌우 화면 꽉 채움
            $0.height.equalTo(326) // 높이는 326으로 설정.
        }
        
        // itemQuantityLabel 속성 설정.
        itemQuantityLabel.text = "0개" // 임시 초기값
        itemQuantityLabel.textColor = .black
        itemQuantityLabel.font = .boldSystemFont(ofSize: 25)
        
        // entireView에 수량 레이블 추가하여 화면에 표시되도록 설정.
        entireView.addSubview(itemQuantityLabel)
        
        // itemQuantityLabel 레이아웃 설정.
        itemQuantityLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(31)
            $0.top.equalToSuperview().inset(20)
        }
        
        // totalAmountLabel 속성 설정.
        totalAmountLabel.text = "합계"
        totalAmountLabel.textColor = .black
        totalAmountLabel.font = .boldSystemFont(ofSize: 25)
        
        // entireView에 totalAmountLabel을 추가하여 화면에 표시되도록 설정.
        entireView.addSubview(totalAmountLabel)
        
        // totalAmountLabel 레이아웃 설정.
        totalAmountLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(196)
            $0.top.equalToSuperview().inset(20)
        }
        
        // amountValueLabel 속성 설정
        amountValueLabel.text = "50,000원" // 임시 초기값
        amountValueLabel.textColor = .red
        amountValueLabel.font = .boldSystemFont(ofSize: 25)
        entireView.addSubview(amountValueLabel)
        
        // amountValueLabel 레이아웃 설정
        amountValueLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30) // 합계 레이블 옆에 배치
            $0.centerY.equalTo(totalAmountLabel) // 수직 정렬
            
        }
        
    }
    
    private func setupButtons() {
        // employeeCallButton 속성 설정.
        employeeCallButton.setTitle("직원호출", for: .normal)
        employeeCallButton.backgroundColor = .systemGray4
        employeeCallButton.layer.cornerRadius = 10
        employeeCallButton.setTitleColor(.black, for: .normal)
        employeeCallButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        // entireView에 employeeCallButton을 추가하여 화면에 표시되도록 설정.
        entireView.addSubview(employeeCallButton)
        
        // employeeCallButton 레이아웃 설정.
        employeeCallButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(33)
            $0.bottom.equalToSuperview().inset(48)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        // cancelButton 속성 설정.
        cancelButton.setTitle("취소하기", for: .normal)
        cancelButton.backgroundColor = .systemGray4
        cancelButton.layer.cornerRadius = 10
        cancelButton.setTitleColor(.black, for: .normal)
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        // entireView에 cancelButton을 추가하여 화면에 표시되도록 설정.
        entireView.addSubview(cancelButton)
        
        // cancelButton 레이아웃 설정.
        cancelButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(48)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        // paymentButton 속성 설정.
        paymentButton.setTitle("결제하기", for: .normal)
        paymentButton.backgroundColor = .systemRed
        paymentButton.layer.cornerRadius = 10
        paymentButton.setTitleColor(.white, for: .normal)
        paymentButton.titleLabel?.font = .boldSystemFont(ofSize: 16)
        
        // entireView에 paymentButton을 추가하여 화면에 표시되도록 설정.
        entireView.addSubview(paymentButton)
        
        // paymentButton 레이아웃 설정.
        paymentButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(33)
            $0.bottom.equalToSuperview().inset(48)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        collectionView.backgroundColor = .white
    }
}
    
    #Preview("MenuSelectionHandler") {
        //뷰 컨트롤러 생성
        MenuSelectionHandler()
    }

