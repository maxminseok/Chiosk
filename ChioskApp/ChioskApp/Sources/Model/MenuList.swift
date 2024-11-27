//
//  MenuList.swift
//  ChioskApp
//
//  Created by t0000-m0112 on 2024-11-26.
//  메뉴 카테고리 및 목록 데이터 관리
//

import UIKit

// 치킨, 사이드, 음료, 기타
struct MenuList {
    // 메뉴 데이터: 카테고리 이름을 키로 사용
    let menuCategories: [String: [(image: String, title: String, price: String)]] = [
        "치킨": [
            (image: "Fried", title: "후라이드1", price: "10,000"),
            (image: "Fried", title: "후라이드2", price: "20,000"),
            (image: "Fried", title: "후라이드3", price: "30,000"),
            (image: "Fried", title: "후라이드4", price: "40,000"),
            (image: "Fried", title: "후라이드5", price: "50,000"),
            (image: "Fried", title: "후라이드6", price: "60,000")
        ],
        "사이드": [
            (image: "Fried", title: "사이드1", price: "10,000"),
            (image: "Fried", title: "사이드2", price: "20,000"),
            (image: "Fried", title: "사이드3", price: "30,000"),
            (image: "Fried", title: "사이드4", price: "40,000"),
            (image: "Fried", title: "사이드5", price: "50,000"),
            (image: "Fried", title: "사이드6", price: "60,000")
        ],
        "음료": [
            (image: "Fried", title: "음료1", price: "10,000"),
            (image: "Fried", title: "음료2", price: "20,000"),
            (image: "Fried", title: "음료3", price: "30,000"),
            (image: "Fried", title: "음료4", price: "40,000"),
            (image: "Fried", title: "음료5", price: "50,000"),
            (image: "Fried", title: "음료6", price: "60,000")
        ],
        "기타": [
            (image: "Fried", title: "기타1", price: "10,000"),
            (image: "Fried", title: "기타2", price: "20,000"),
            (image: "Fried", title: "기타3", price: "30,000"),
            (image: "Fried", title: "기타4", price: "40,000"),
            (image: "Fried", title: "기타5", price: "50,000"),
            (image: "Fried", title: "기타6", price: "60,000")
        ]
    ]
}
