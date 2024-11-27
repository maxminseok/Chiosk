//
//  NotificationNames.swift
//  ChioskApp
//
//  Created by t0000-m0112 on 2024-11-27.
//

import Foundation

extension Notification.Name {
    /// 주문 데이터가 업데이트될 때 사용
    static let orderUpdated = Notification.Name("orderUpdated")
    
    /// 결제 완료 시 사용
    static let paymentCompleted = Notification.Name("paymentCompleted")
}
