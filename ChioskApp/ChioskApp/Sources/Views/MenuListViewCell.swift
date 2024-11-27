//
//  CustomCollectionViewCell.swift
//  ChioskApp
//
//  Created by t2023-m0072 on 11/26/24.
//

import UIKit

class MenuListViewCell: UICollectionViewCell {
    
    // UI 요소 정의
    // 이미지
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // 이름 라벨
    let name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 가격 라벨
    let price: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // 초기화 메서드
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(name)
        contentView.addSubview(price)
        
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6),
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    // 에러 발생 처리
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
