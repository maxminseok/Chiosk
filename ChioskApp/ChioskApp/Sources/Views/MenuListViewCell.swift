//
//  CustomCollectionViewCell.swift
//  ChioskApp
//
//  Created by t2023-m0072 on 11/26/24.
//

import UIKit
import SnapKit

class MenuListViewCell: UICollectionViewCell {
    
    // UI 요소 정의
    // 이미지
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 이름 라벨
    let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    // 가격 라벨
    let price: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(name)
        contentView.addSubview(price)
        
        // Auto Layout 설정
        imageView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top)
            $0.leading.trailing.equalTo(contentView)
            $0.height.equalTo(contentView.snp.height).multipliedBy(0.6)
        }
        name.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(contentView)
        }
        price.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(contentView)
        }
    }
    
    // 에러 발생 처리
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
