//
//  MenuCategorySegmentedControl.swift
//  ChioskApp
//
//  Created on 11/27/24.
//
//  Description:
//  - 이 커스텀 SegmentedControl 클래스는 앱의 메뉴 카테고리 UI를 위한 컴포넌트입니다.
//  - 선택된 세그먼트의 스타일(배경색, 모서리 반경 등)을 사용자 지정하여 일관된 UI를 제공합니다.
//

import UIKit

/// `MenuCategorySegmentedControl`
/// - SegmentedControl의 선택 항목 스타일을 커스터마이징하기 위해 상속받아 구현
class MenuCategorySegmentedControl: UISegmentedControl {
    
    // MARK: - Initializers
    
    /// 배열로 항목을 초기화
    override init(items: [Any]?) {
        super.init(items: items)
    }
    
    /// Interface Builder를 통해 초기화 시 사용
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout Customization
    
    /// 레이아웃을 설정하여 선택 항목과 배경 스타일을 사용자 정의
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // SegmentedControl의 기본 배경색 설정
        self.backgroundColor = .systemGray6
        
        // MARK: - Configure Background Radius
        /// 전체 SegmentedControl의 모서리 반경 설정
        self.layer.cornerRadius = 0
        self.layer.masksToBounds = true
        
        // MARK: - Find selectedImageView
        /// 선택된 세그먼트의 뷰를 찾아 스타일을 지정
        let selectedImageViewIndex = numberOfSegments
        if let selectedImageView = subviews[selectedImageViewIndex] as? UIImageView {
            
            // MARK: - Configure selectedImageView Color
            /// 선택된 세그먼트의 배경색 및 이미지 제거
            selectedImageView.backgroundColor = .white
            selectedImageView.image = nil
            
            // MARK: - Configure selectedImageView Inset
            /// 선택된 항목의 내부 여백 조정
            selectedImageView.bounds = selectedImageView.bounds.insetBy(dx: 0, dy: 0)
            
            // MARK: - Configure selectedImageView cornerRadius
            /// 선택된 항목의 모서리 반경 및 애니메이션 제거
            selectedImageView.layer.masksToBounds = true
            selectedImageView.layer.cornerRadius = 0
            selectedImageView.layer.removeAnimation(forKey: "SelectionBounds")
        }
    }
}
