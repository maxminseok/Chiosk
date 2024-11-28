//
//  OrderManager.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  선택한 메뉴 처리 (합산, 취소, 결제)
//

import Foundation

class OrderManager {
    static let shared = OrderManager() // 싱글턴 패턴

    private init() {}

    // 주문 데이터 배열 (각 항목은 메뉴 데이터와 수량으로 구성)
    var orders: [(menu: (image: String, title: String, price: String), quantity: Int)] = []

    // 총 금액 계산
    var totalAmount: Int {
        return orders.reduce(0) { total, order in
            let price = Int(order.menu.price.replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "원", with: "")) ?? 0
            return total + (price * order.quantity)
        }
    }
    
    // 총 주문 수량 계산
    var totalQuantity: Int {
        return orders.reduce(0) { total, order in
            total + order.quantity
        }
    }

    // 메뉴 추가 (이미 존재하면 수량 증가)
    func addMenu(_ menu: (image: String, title: String, price: String)) -> Bool {
        
        let totalAmountLimit = totalAmount + (Int(menu.price.replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "원", with: "")) ?? 0)
        
        if totalAmountLimit < 1000000 {
            if let index = orders.firstIndex(where: { $0.menu.title == menu.title }) {
                orders[index].quantity += 1
            } else {
                orders.append((menu: menu, quantity: 1))
            }
            return true
        }
        else {
            return false
        }
    }

    // 메뉴 수량 감소
    func decreaseMenu(_ menuTitle: String) {
        if let index = orders.firstIndex(where: { $0.menu.title == menuTitle }) {
            orders[index].quantity -= 1
            if orders[index].quantity <= 0 {
                orders.remove(at: index)
            }
        }
    }

    // 모든 주문 초기화
    func resetOrders() {
        orders.removeAll()
    }
}
