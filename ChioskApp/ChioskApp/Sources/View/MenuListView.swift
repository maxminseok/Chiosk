//
//  MenuListView.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  카테고리별 메뉴 항목 표시 뷰
//

import UIKit

class MenuListView: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var menuData: [(image: String, title: String, price: String)] = []
    
    // 컬렉션 뷰 정의
    func setupCollectionViewLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // 세로 스크롤
        layout.minimumLineSpacing = 24 // 세로 간격
        layout.minimumInteritemSpacing = 20 // 가로 간격
        
        return layout
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
    
}


#Preview {
    MenuListViewController()
}

