//
//  corner.swift
//  ChioskApp
//
//  Created by 이재건 on 11/27/24.
//

import UIKit

class TestSegment: UISegmentedControl {
  override init(items: [Any]?) {
    super.init(items: items)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.backgroundColor = .systemGray6
    
    //MARK: - Configure Background Radius
    self.layer.cornerRadius = 0
    self.layer.masksToBounds = true
    
    //MARK: - Find selectedImageView
    let selectedImageViewIndex = numberOfSegments
    if let selectedImageView = subviews[selectedImageViewIndex] as? UIImageView
    {
      //MARK: - Configure selectedImageView Color
      selectedImageView.backgroundColor = .white
      selectedImageView.image = nil
      
      //MARK: - Configure selectedImageView Inset with SegmentControl
      selectedImageView.bounds = selectedImageView.bounds.insetBy(dx: 0, dy: 0)
      
      //MARK: - Configure selectedImageView cornerRadius
      selectedImageView.layer.masksToBounds = true
      selectedImageView.layer.cornerRadius = 0
      selectedImageView.layer.removeAnimation(forKey: "SelectionBounds")
      
    }
  }
}
