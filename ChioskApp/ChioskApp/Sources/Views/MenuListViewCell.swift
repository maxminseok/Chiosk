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
import SnapKit

/// `MenuListViewCell`
/// - 메뉴 항목을 보여주는 커스텀 UICollectionViewCell
/// - 이미지와 텍스트를 포함하며, Auto Layout을 통해 동적 크기를 지원
class MenuListViewCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    
    /// 메뉴 이미지를 표시하는 UIImageView
    internal let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    /// 메뉴 이름을 표시하는 UILabel
    internal let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    /// 메뉴 가격을 표시하는 UILabel
    internal let price: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
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
      
        // 이미지 뷰 레이아웃
        imageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.leading.trailing.equalTo(contentView)
            $0.height.equalTo(contentView.snp.height).multipliedBy(0.6)
        }
      
        // 이름 라벨 레이아웃
        name.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(contentView)
        }
      
        // 가격 라벨 레이아웃
        price.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(contentView)
        }
    }
    
    /// 초기화 실패 시 에러 처리
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
