//
//  OrderManager.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//
//  Description:
//  - OrderManager는 사용자가 선택한 메뉴를 관리하는 싱글턴 클래스입니다.
//  - 메뉴 추가, 삭제, 수량 변경, 총 금액 계산 등의 기능을 제공합니다.
//  - 주문 데이터는 앱 내에서 공유되며, 중앙에서 관리됩니다.
//

import Foundation

/// `OrderManager`
/// - 메뉴 주문 데이터를 관리하는 싱글턴 클래스
/// - 주문 데이터를 추가, 수정, 초기화하며, 주문 금액과 수량을 계산
class OrderManager {
    
    // MARK: - Singleton Instance
    /// `OrderManager`의 공유 인스턴스
    static let shared = OrderManager() // 싱글턴 패턴
    
    // MARK: - Initialization
    /// 외부에서 초기화 방지
    private init() {}

    // MARK: - Properties
    
    /// 현재 주문 데이터 배열
    /// - 각 항목은 메뉴 데이터(이미지, 제목, 가격)와 수량으로 구성된 튜플입니다.
    var orders: [(menu: Food, quantity: Int)] = []

    /// 총 주문 금액
    /// - 모든 메뉴의 가격과 수량을 곱한 값을 합산하여 계산
    var totalAmount: Int {
        return orders.reduce(0) { total, order in
            total + (order.menu.price * order.quantity)
        }
    }
    

    /// 총 주문 수량
    /// - 주문한 모든 메뉴의 수량을 합산
    var totalQuantity: Int {
        return orders.reduce(0) { total, order in
            total + order.quantity
        }
    }

    // MARK: - Methods
    
    /// 메뉴 추가
    /// - 이미 존재하는 메뉴라면 수량 증가
    /// - 주문 금액 한도를 초과하지 않는 경우에만 추가 가능
    /// - Parameters:
    ///   - menu: 추가하려는 메뉴 데이터 (이미지, 제목, 가격)
    /// - Returns: 주문 가능 여부 (한도 초과 시 false 반환)
    func addMenu(_ menu: Food) -> Bool {
        let totalAmountLimit = totalAmount + menu.price // 총 금액 계산
        
        // 주문 금액이 한도를 초과하지 않는 경우 처리
        if totalAmountLimit < 1_000_000 { // 한도: 1,000,000원
            if let index = orders.firstIndex(where: { $0.menu.title == menu.title }) {
                // 이미 존재하는 메뉴의 경우 수량 증가
                orders[index].quantity += 1
            } else {
                // 새로운 메뉴 추가
                orders.append((menu: menu, quantity: 1))
            }
            return true
        } else {
            // 한도 초과 시 false 반환
            return false
        }
    }

    /// 메뉴 수량 감소
    /// - 수량이 0이 되면 주문 목록에서 해당 메뉴 제거
    /// - Parameters:
    ///   - menuTitle: 수량을 줄이고자 하는 메뉴의 제목
    func decreaseMenu(_ menuTitle: String) {
        if let index = orders.firstIndex(where: { $0.menu.title == menuTitle }) {
            orders[index].quantity -= 1
            if orders[index].quantity <= 0 {
                // 수량이 0 이하가 되면 제거
                orders.remove(at: index)
            }
        }
    }

    /// 모든 주문 초기화
    /// - 주문 데이터를 비웁니다.
    func resetOrders() {
        orders.removeAll()
    }
}
