//
//  MenuListViewController.swift
//  ChioskApp
//
//  Created by t2023-m0072 on 11/26/24.
//

import UIKit

// 클릭 했을 떄 OrderHandler 혹은 MainViewContoller name과 price를 넘기기 위한 프로토콜
protocol MenuSelectionDelegate: AnyObject {
    func didSelectMenuItem(name: String, price: String)
}


class MenuListViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    weak var delegate: MenuSelectionDelegate? // 델리게이트 속성 추가
    
    let collectionView: UICollectionView
    let menuListView = MenuListView()
    let menuList = MenuList()
    
    init() {
        let layout = menuListView.setupCollectionViewLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(nibName: nil, bundle: nil) // 부모클래스(viewController)의 초기화 메서드 호출
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        menuListView.menuData = menuList.menuCategory1

        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = menuListView
        collectionView.delegate = menuListView
        collectionView.register(MenuListViewCell.self, forCellWithReuseIdentifier: "MenuListViewCell")
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
        let item = menuListView.menuData[indexPath.row]
        print("셀 클릭됨: \(item.title)")

        delegate?.didSelectMenuItem(name: item.title, price: item.price) // 이벤트 처리
        /*
         
         OrderHandler 혹은 MainViewContoller에서 MenuSelectionDelegate 프로토콜 채택한 뒤
         func didSelectMenuItem(name: String, price: String) 메서드 구현해서 클릭한 셀의 name과 price 받기
         
        */
    }
    
}
