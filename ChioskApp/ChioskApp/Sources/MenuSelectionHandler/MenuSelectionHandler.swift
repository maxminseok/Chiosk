//
//  MenuSelectionHandler.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  Developer: kangminseoung
//
import SnapKit
import UIKit

class MenuSelectionHandler: UIViewController {
    
    // 수량 및 총 금액 레이블
    private let itemQuantityLabel = UILabel() // 수량 라벨
    private let totalAmountLabel = UILabel() // 총액 라벨
    private var totalAmount: Int = 0 // 초기 총 금액
    private var itemQuantity: Int = 0 // 초기 총 수량
    
    // 버튼
    private var employeeCallButton = UIButton() // 직원 호출 버튼
    private var cancelButton = UIButton() // 취소 버튼
    private var paymentButton = UIButton() // 결제 버튼
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // 전체 배경색
        view.backgroundColor = .white
        
    }
}


