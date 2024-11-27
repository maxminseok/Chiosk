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

class OrderSummaryView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // 섹션당 아이템 수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2 // 2개의 이미지 반환
    }
    
    // 셀 구성 메서드
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 컬렉션 뷰에서 재사용 가능한 셀을 가져온다.
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! OrderSummaryViewCell
        return cell // 구성된 셀 반환
    }

    private var entireView = UIView() // 주문 하단 전체 뷰
    
    // 주문 내역 데이터 배열 생성
    private var orderList = [
        (
            image: UIImage(named: "chicken1"), // 첫번째 치킨 이미지
            name: "후라이드1", // 첫번째 치킨 이름
            price: "25,000원", // 첫번째 치킨 가격
            quantity: 1 // 첫번째 치킨 초기 수량
        ),
        (
            image: UIImage(named: "chicken2"), // 두번째 치킨 이미지
            name: "후라이드2", // 두번째 치킨 이름
            price: "25,000원", // 두번째 치킨 가격
            quantity: 1 // 두번째 치킨 초기 수량
        ),
    ]
    
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
        let flowlayout = UICollectionViewFlowLayout() // 레이아웃 정의
        let cv = UICollectionView(
            frame: .zero, collectionViewLayout: flowlayout)
        flowlayout.scrollDirection = .vertical // 세로 스크롤
        flowlayout.itemSize = CGSize(width: 160, height: 160) // 셀 크기 설정
        flowlayout.minimumLineSpacing = 9 // 셀 간의 간격 설정
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() // UI 설정
        setupButtons() // 버튼 설정
        
        // 델리게이트 및 데이터소스 설정
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupUI() {
        
        view.backgroundColor = .white // 기본 배경을 흰색으로 설정
    
        // 하단 전체 뷰 설정
        entireView.backgroundColor = .systemGray6 // 배경색 시스템 회색
        entireView.layer.cornerRadius = 10 // 모서리를 둥글게 설정
        view.addSubview(entireView) // 뷰에 추가하여 표시
        
        // 하단 전체 뷰 레이아웃
        entireView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview() // 좌우 및 하단 고정
            $0.height.equalTo(326) // 높이는 326으로 설정
        }
        
        // 컬렉션 뷰 설정
        collectionView.backgroundColor = .systemGray6 // 컬렉션 뷰 배경색 시스템 회색
        entireView.addSubview(collectionView) // 컬렉션 뷰를 하단 전체 뷰에 추가
        
        // 컬렉션 뷰 레이아웃 설정
        collectionView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100) // 하단 간격 100
            $0.top.equalToSuperview().inset(59) // 상단 간격 59
            $0.leading.trailing.equalToSuperview().inset(33) // 좌우 간격 33
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
        amountValueLabel.text = "50,000원" // 초기 금액 설정
        amountValueLabel.textColor = .chioskPrimary // 텍스트 색상은 chioskPrimary 설정
        amountValueLabel.font = .boldSystemFont(ofSize: 25) // 폰트 사이즈 25, 폰트 타입은 시스템 폰트
        entireView.addSubview(amountValueLabel) // 금액 레이블 추가
        
        // 금액 표시 레이블 레이아웃
        amountValueLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-30) // 오른쪽에서 간격 30
            $0.centerY.equalTo(totalAmountLabel) // 합계 레이블과 세로 중앙 정렬
        }
    }
    
    private func setupButtons() {
        // 직원 호출 버튼 설정
        employeeCallButton.setTitle("직원호출", for: .normal) // 텍스트 설정
        employeeCallButton.backgroundColor = .systemGray4 // 배경색 설정
        employeeCallButton.layer.cornerRadius = 10 // 모서리 10만큼 둥글게 설정
        employeeCallButton.setTitleColor(.black, for: .normal) // 텍스트 색상은 검정색 설정
        employeeCallButton.titleLabel?.font = .boldSystemFont(ofSize: 16) // 폰트 사이즈 16, 폰트 타입은 시스템 폰트
        entireView.addSubview(employeeCallButton) // 직원호출 버튼 추가
        
        // 직원 호출 버튼 레이아웃
        employeeCallButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(33) // 왼쪽 간격 33
            $0.bottom.equalToSuperview().inset(48) // 아래쪽에서 간격 48
            $0.width.equalTo(100) // 버튼 너비 100
            $0.height.equalTo(50) // 버튼 높이 50
        }
        
        // 취소 버튼 설정
        cancelButton.setTitle("취소하기", for: .normal) // 텍스트 설정
        cancelButton.backgroundColor = .systemGray4 // 배경색 회색 설정
        cancelButton.layer.cornerRadius = 10 // 모서리 10만큼 둥글게 설정
        cancelButton.setTitleColor(.black, for: .normal) // 텍스트 색상 검정색 설정
        cancelButton.titleLabel?.font = .boldSystemFont(ofSize: 16) // 폰트 사이즈 16, 폰트 타입은 시스템 폰트
        entireView.addSubview(cancelButton) // 취소하기 버튼 추가
        
        // 취소 버튼 레이아웃
        cancelButton.snp.makeConstraints {
            $0.centerX.equalToSuperview() // 수평 중앙 정렬
            $0.bottom.equalToSuperview().inset(48) // 아래쪽에서 간격 48
            $0.width.equalTo(100) // 버튼 너비 100
            $0.height.equalTo(50) // 버튼 높이 50
        }
        
        // 결제 버튼 설정
        paymentButton.setTitle("결제하기", for: .normal) // 텍스트 설정
        paymentButton.backgroundColor = .systemRed // 배경색 빨간색으로 설정.
        paymentButton.layer.cornerRadius = 10 // 모서리는 10만큼 둥글게 설정
        paymentButton.setTitleColor(.white, for: .normal) // 텍스트 색상은 하얀색 설정
        paymentButton.titleLabel?.font = .boldSystemFont(ofSize: 16) // 폰트 사이즈는 16, 폰트 타입은 시스템 폰트
        entireView.addSubview(paymentButton) // 결제하기 버튼 추가
        
        // 결제 버튼 레이아웃
        paymentButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(33) // 오른쪽에서 간격 33
            $0.bottom.equalToSuperview().inset(48) // 아래쪽에서 간격 48
            $0.width.equalTo(100) // 버튼의 너비 100
            $0.height.equalTo(50) // 버튼의 높이 50
        }
    }
}

#Preview("MenuSelectionHandler") {
    //뷰 컨트롤러 생성
    OrderSummaryView()
}
