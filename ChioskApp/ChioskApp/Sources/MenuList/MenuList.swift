//
//  MenuList.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  Developer: maxminseok
//
import UIKit


class MenuList {
    
}

class MenuListViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // 세로 스크롤
        layout.minimumLineSpacing = 48 // 세로 간격
        layout.minimumInteritemSpacing = 21 // 가로 간격
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCellIdentifier")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 27),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -27),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // 셀 개수 반환
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    // 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCellIdentifier", for: indexPath) as? CustomCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        // 예제 데이터
        let images = ["Fried", "Fried", "Fried", "Fried", "Fried", "Fried"]
        let titles = ["후라이드1", "후라이드2", "후라이드3", "후라이드4", "후라이드5", "후라이드6"]
        let prices = ["10,000", "20,000", "30,000", "40,000", "50,000", "60,000"]
        
        // 이미지 및 텍스트 설정
        cell.imageView.image = UIImage(named: images[indexPath.row]) // 이미지 파일 이름에 맞게 설정
        cell.name.text = titles[indexPath.row] // 이름 문구 설정
        cell.price.text = prices[indexPath.row]
        
        return cell
    }
    
    // 셀 레이아웃 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemPerRow: CGFloat = 3 // 가로로 배치할 셀 개수
        let itemPerColumn: CGFloat = 2 // 세로로 배치할 셀 개수
        
        // 셀 간격의 합
        let totalHorizonSpacing = (itemPerRow - 1) * 21
        let totalVerticalSpacing = (itemPerColumn - 1) * 48
        
        // 셀 크기 설정
        //간격(totalSpacing)이 커질수록 셀의 크기가 작아짐
        let width = (collectionView.frame.width - totalHorizonSpacing) / itemPerRow
        let height = (collectionView.frame.height - totalVerticalSpacing) / itemPerColumn
        
        return CGSize(width: width, height: width)
    }
    
    // 셀 클릭 이벤트 처리
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let titles = ["후라이드1", "후라이드2", "후라이드3", "후라이드4", "후라이드5", "후라이드6"]
        print("셀 클릭됨: \(titles[indexPath.row])")
        
        // 클릭된 셀에 따라 동작
        let alert = UIAlertController(title: "셀 클릭", message: "\(titles[indexPath.row]) 클릭됨", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}

class CustomCollectionViewCell: UICollectionViewCell {
    
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
            
            name.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            name.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            price.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 4),
            price.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            price.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            price.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




