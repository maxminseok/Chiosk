//
//  MenuListViewController.swift
//  ChioskApp
//
//  Created by t2023-m0072 on 11/26/24.
//

import UIKit

class MenuListViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    let collectionView: UICollectionView
    let menuList = MenuList()
    
    init() {
        let layout = menuList.setupCollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil) // 부모클래스(viewController)의 초기화 메서드 호출
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // 테스트 데이터
        menuList.menuData = [
            (image: "Fried", title: "후라이드1", price: "10,000"),
            (image: "Fried", title: "후라이드2", price: "20,000"),
            (image: "Fried", title: "후라이드3", price: "30,000"),
            (image: "Fried", title: "후라이드4", price: "40,000"),
            (image: "Fried", title: "후라이드5", price: "50,000"),
            (image: "Fried", title: "후라이드6", price: "60,000")]
        
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = menuList
        collectionView.delegate = menuList
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCellIdentifier")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -329)
        ])
        
    }
    
    // 셀 클릭 이벤트 처리
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = menuList.menuData[indexPath.row]
        print("셀 클릭됨: \(item.title)")

        // 클릭된 셀에 따라 동작
        let alert = UIAlertController(title: "셀 클릭", message: "\(item.title) 클릭됨", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
