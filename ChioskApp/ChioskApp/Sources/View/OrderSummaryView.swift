//
//  OrderSummaryView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  선택 항목 및 버튼 표시 뷰
//

import SnapKit
import UIKit

let cellID = "OrderCell"

class OrderSummaryView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! OrderSummaryViewCell
        
        cell.backgroundColor = .white // 셀의 배경색을 빨간색으로 지정.
        
        return cell
    }
    

    // 주문 하단 전체 뷰
    private var entireView = UIView()

    // 주문 내역 관한 이미지 및 레이블
    private var orderList = [
        (
            image: UIImage(named: "chicken1"), name: "후라이드1", price: "25,000원",
            quantity: 1
        ),
        (
            image: UIImage(named: "chicken2"), name: "후라이드2", price: "25,000원",
            quantity: 1
        ),
    ]

    // 총 수량 및 총 금액 레이블
    private let itemQuantityLabel = UILabel()  // 수량 레이블
    private let totalAmountLabel = UILabel()  // 총액 레이블
    private let amountValueLabel = UILabel()  // 금액 표시 레이블

    // 직원 호출 버튼, 취소 버튼, 결제 버튼
    private var employeeCallButton = UIButton()  // 직원 호출 버튼
    private var cancelButton = UIButton()  // 취소 버튼
    private var paymentButton = UIButton()  // 결제 버튼

    // 주문 내역 CollectionView
    let collectionView: UICollectionView = {
        let flowlayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(
            frame: .zero, collectionViewLayout: flowlayout)
        flowlayout.scrollDirection = .vertical // 가로 스크롤
        flowlayout.itemSize = CGSize(width: 160, height: 160) // 셀 크기
        flowlayout.minimumLineSpacing = 9 // 셀 간의 간격 9
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtons()
        
        // delegate와 dataSource 설정.
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    private func setupUI() {
        // 전체 배경색
        view.backgroundColor = .white

        // 하단 회색 바탕의 전체 뷰
        entireView.backgroundColor = .systemGray6  // 주문 하단 전체 뷰 배경색은 시스템 회색6
        entireView.layer.cornerRadius = 10  // 모서리 둥글게 처리
        view.addSubview(entireView)  // 뷰에 주문 하단 전체 뷰를 추가하여 화면에 표시되도록 설정.

        // entireView 레이아웃 설정
        entireView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()  // 좌우 화면 꽉 채움
            $0.height.equalTo(326)  // 높이는 326으로 설정.
        }
        
        // collectionView 속성 설정
        collectionView.backgroundColor = .systemGray6
//        collectionView.layer.cornerRadius = 12
 
          // entireView에 collectionView 추가하여 화면에 표시.
        entireView.addSubview(collectionView)
        
        // collectionView 레이아웃 설정.
        collectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.top.equalToSuperview().inset(59)
            $0.leading.trailing.equalToSuperview().inset(33)
        }
        
        collectionView.register(OrderSummaryViewCell.self, forCellWithReuseIdentifier: cellID)
        
        // itemQuantityLabel 속성 설정.
        itemQuantityLabel.text = "0개"  // 임시 초기값
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
        amountValueLabel.text = "50,000원"  // 임시 초기값
        amountValueLabel.textColor = .red
        amountValueLabel.font = .boldSystemFont(ofSize: 25)
        entireView.addSubview(amountValueLabel)

        // amountValueLabel 레이아웃 설정
        amountValueLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30)  // 합계 레이블 옆에 배치
            $0.centerY.equalTo(totalAmountLabel)  // 수직 정렬

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
    }

}

#Preview("MenuSelectionHandler") {
    //뷰 컨트롤러 생성
    OrderSummaryView()
}
