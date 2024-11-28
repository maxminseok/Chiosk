//
//  AppColors.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//
//  Description:
//  - 이 파일은 앱 전반에 걸쳐 사용되는 공통 색상을 정의합니다.
//  - Asset Catalog에 저장된 색상을 호출하여 일관된 색상 테마를 유지합니다.
//  - 각 색상은 `UIColor` 익스텐션을 통해 호출할 수 있습니다.
//

import UIKit

///
/// Assets에 정의된 색상 선언
///
/// 이 파일은 앱의 UI 요소에서 공통적으로 사용되는 색상을 정의합니다.
/// Asset Catalog에 저장된 색상을 직접 호출하여 사용합니다.
///
/// Example Usage:
/// ```swift
/// let button = UIButton()
/// button.backgroundColor = .chioskPrimaryColor
/// ```
///
/// - `chioskPrimaryColor`: 앱의 주요 UI 색상 (Primary Color)
/// - `chioskSecondaryColor`: 앱의 보조 UI 색상 (Secondary Color)
///
extension UIColor {
    /// 앱의 주요 UI 색상 (Primary Color)
    static let chioskPrimaryColor = UIColor(named: "ChioskPrimaryColor")!
    
    /// 앱의 보조 UI 색상 (Secondary Color)
    static let chioskSecondaryColor = UIColor(named: "ChioskSecondaryColor")!
}
