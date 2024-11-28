//
//  MenuListView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  카테고리별 메뉴 항목 표시 뷰
//

import UIKit

class MenuListView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var menuData: [(image: String, title: String, price: Int)] = [] {
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
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false // 스크롤바 숨기기
        return view
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
        cell.imageView.image = UIImage(named: item.image)
        cell.name.text = item.title
        cell.price.text = "\(item.price)원"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMenu = menuData[indexPath.row]
        delegate?.menuListView(self, didSelectMenu: selectedMenu) // Delegate 호출
    }
    
    // 셀 레이아웃 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3 // 가로에 배치할 셀 개수
        let spacing: CGFloat = 10 // 셀 간 간격
        let totalSpacing = (itemsPerRow - 1) * spacing // 전체 간격
        let width = (collectionView.frame.width - totalSpacing) / itemsPerRow // 간격이 커질수록 셀의 크기 작아짐
        return CGSize(width: width, height: width * 1.2) // 세로 크기를 비율로 설정
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuListViewCell.self, forCellWithReuseIdentifier: "MenuListViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
