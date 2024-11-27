//
//  MenuListView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  카테고리별 메뉴 항목 표시 뷰
//

import UIKit

class MenuListView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var menuData: [(image: String, title: String, price: String)] = [] {
        didSet {
            collectionView.reloadData() // 데이터가 변경되면 컬렉션 뷰 새로고침
        }
    }
    
    weak var delegate: MenuListViewDelegate? // Delegate 추가
    
    // 컬렉션 뷰 정의
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // 세로 스크롤
        layout.minimumLineSpacing = 4 // 세로 간격
        layout.minimumInteritemSpacing = 4 // 가로 간격
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    // 초기화 메서드 - 컬렉션 뷰를 뷰에 추가
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }
    
    // 셀 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.count
    }
    
    // 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuListViewCell", for: indexPath) as? MenuListViewCell else {
            return UICollectionViewCell()
        }
        
        // 이미지 및 텍스트 설정
        let item = menuData[indexPath.row]
        cell.imageView.image = UIImage(named: item.image) // 이미지 파일 설정
        cell.name.text = item.title // 이름 label 설정
        cell.price.text = item.price // 가격 label 설정
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMenu = menuData[indexPath.row]
        delegate?.menuListView(self, didSelectMenu: selectedMenu) // Delegate 호출
    }
    
    // 셀 레이아웃 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 3 // 가로로 배치할 셀 개수
        
        // 셀 간격의 합
        let totalHorizonSpacing = (itemPerRow - 1) * 21
        
        // 셀 크기 설정
        //간격(totalSpacing)이 커질수록 셀의 크기가 작아짐
        let width = (collectionView.frame.width - totalHorizonSpacing) / itemPerRow
        let height = width * 1.5
        
        return CGSize(width: width, height: height)
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuListViewCell.self, forCellWithReuseIdentifier: "MenuListViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
}


#Preview {
    MainViewController()
}

