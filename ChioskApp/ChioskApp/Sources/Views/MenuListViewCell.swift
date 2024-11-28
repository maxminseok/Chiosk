//
//  MenuListViewCell.swift
//  ChioskApp
//
//  Created on 11/26/24.
//
//  Description:
//  - 메뉴 리스트의 개별 셀을 나타내는 커스텀 UICollectionViewCell입니다.
//  - 이미지, 이름, 가격 라벨을 포함하며, 레이아웃은 Auto Layout으로 설정되어 있습니다.
//

import UIKit

/// `MenuListViewCell`
/// - 메뉴 항목을 보여주는 커스텀 UICollectionViewCell
/// - 이미지와 텍스트를 포함하며, Auto Layout을 통해 동적 크기를 지원
class MenuListViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    /// 메뉴 이미지를 표시하는 UIImageView
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // 이미지 비율 유지
        imageView.clipsToBounds = true // 이미지가 뷰의 경계를 넘지 않도록 설정
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    /// 메뉴 이름을 표시하는 UILabel
    let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center // 텍스트를 가운데 정렬
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium) // 기본 텍스트 스타일 설정
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// 메뉴 가격을 표시하는 UILabel
    let price: UILabel = {
        let label = UILabel()
        label.textAlignment = .center // 텍스트를 가운데 정렬
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium) // 가격 표시용 폰트 설정
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
    /// 초기화 메서드: 셀의 UI 요소를 구성하고 레이아웃을 설정
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UI 요소를 contentView에 추가
        contentView.addSubview(imageView)
        contentView.addSubview(name)
        contentView.addSubview(price)
        
        // MARK: Auto Layout Constraints
        /// 각 UI 요소의 Auto Layout 제약 조건을 설정
        NSLayoutConstraint.activate([
            // 이미지 뷰 레이아웃
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            
            // 이름 라벨 레이아웃
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // 가격 라벨 레이아웃
            price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    /// 초기화 실패 시 에러 처리
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
