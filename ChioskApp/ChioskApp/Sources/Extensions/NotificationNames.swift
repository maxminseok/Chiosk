//
//  NotificationNames.swift
//  ChioskApp
//
//  Created on 2024-11-27.
//
//  Description:
//  - 이 파일은 NotificationCenter에서 사용되는 Notification 이름들을 중앙에서 관리합니다.
//  - 문자열 기반의 Notification 이름 사용으로 인한 오타와 관리 문제를 방지하기 위해 작성되었습니다.
//

import Foundation

extension Notification.Name {
    
    /// 주문 데이터가 업데이트될 때 사용
    /// - 사용 예: 주문이 추가되거나 삭제된 후 뷰를 업데이트하기 위해 사용
    static let orderUpdated = Notification.Name("orderUpdated")
    
    /// 결제 완료 시 사용
    /// - 사용 예: 결제가 성공적으로 완료된 후 사용자에게 알림을 표시하거나 상태를 변경
    static let paymentCompleted = Notification.Name("paymentCompleted")
    
    /// 주문 제한 초과 시 사용
    /// - 사용 예: 주문 금액 한도 초과 시 경고 알림을 트리거
    static let showAlert = Notification.Name("showAlert")
}
