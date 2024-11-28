//
//  MenuListView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//
//  Description:
//  - 카테고리별 메뉴 항목을 표시하는 뷰입니다.
//  - UICollectionView를 사용하여 메뉴 데이터를 보여주고, 선택된 항목을 delegate로 전달합니다.
//

import UIKit
import SnapKit

/// `MenuListView`
/// - 메뉴 데이터를 표시하는 UICollectionView를 포함한 커스텀 뷰
/// - `menuData`를 통해 데이터를 설정하며, 데이터 변경 시 뷰를 자동 갱신
/// - 메뉴 선택 시 delegate를 통해 알림
class MenuListView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    /// 메뉴 데이터 배열
    /// - 각 항목은 이미지 이름, 제목, 가격으로 구성된 튜플
    /// - 데이터 변경 시 컬렉션 뷰를 자동으로 새로고침
    internal var menuData: [(image: String, title: String, price: Int)] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    /// 메뉴 선택 이벤트를 전달하기 위한 delegate
    weak var delegate: MenuListViewDelegate?
    
    /// UICollectionView: 메뉴 항목을 표시하는 컬렉션 뷰
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // 세로 스크롤
        layout.minimumLineSpacing = 4 // 항목 간 세로 간격
        layout.minimumInteritemSpacing = 4 // 항목 간 가로 간격
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false // 스크롤바 숨김
        return view
    }()
    
    // MARK: - Initializers
    
    /// 코드 기반 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionView()
    }
    
    /// 스토리보드 및 XIB를 통한 초기화
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollectionView()
    }
    
    // MARK: - UICollectionViewDataSource
    
    /// 섹션당 항목 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuData.count
    }
    
    /// 셀 생성 및 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuListViewCell", for: indexPath) as? MenuListViewCell else {
            return UICollectionViewCell()
        }
        
        // 셀에 이미지, 제목, 가격 설정
        let item = menuData[indexPath.row]
        cell.imageView.image = UIImage(named: item.image)
        cell.name.text = item.title
        cell.price.text = "\(item.price)원"
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate
    
    /// 항목 선택 시 호출
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMenu = menuData[indexPath.row]
        delegate?.menuListView(self, didSelectMenu: selectedMenu)
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    /// 셀 크기 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow: CGFloat = 3 // 가로로 배치할 셀 개수
        let spacing: CGFloat = 10 // 셀 간 간격
        let totalSpacing = (itemsPerRow - 1) * spacing // 전체 간격 계산
        let width = (collectionView.frame.width - totalSpacing) / itemsPerRow // 셀 너비 계산
        return CGSize(width: width, height: width * 1.2) // 세로 크기를 비율로 설정
    }
    
    // MARK: - Private Methods
    
    /// 컬렉션 뷰 초기 설정
    private func setupCollectionView() {
        // 컬렉션 뷰 설정
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MenuListViewCell.self, forCellWithReuseIdentifier: "MenuListViewCell")
        
        // 컬렉션 뷰를 뷰에 추가하고 제약 조건 설정
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
