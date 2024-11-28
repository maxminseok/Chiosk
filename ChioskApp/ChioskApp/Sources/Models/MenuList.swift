//
//  MenuList.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//  메뉴 카테고리 및 목록 데이터 관리
//

import UIKit

// 치킨, 사이드, 음료, 기타에 속하는 항목들
struct MenuList {
    // 메뉴 데이터: 카테고리 이름을 키로 사용
    let menuCategories: [String: [(image: String, title: String, price: Int)]] = [
        "치킨": [
            (image: "Chickens_Fried", title: "후라이드", price: 21000),
            (image: "Chickens_HotFried", title: "핫후라이드", price: 22000),
            (image: "Chickens_Yangnyeom", title: "양념치킨", price: 22000),
            (image: "Chickens_Prinkle", title: "뿌링클치킨", price: 23000),
            (image: "Chickens_Soy", title: "간장고추치킨", price: 22000),
            (image: "Chickens_Garlic", title: "간장마늘치킨", price: 23000),
            (image: "Chickens_Smoky", title: "스모크치킨", price: 22000),
            (image: "Chickens_HotSmoky", title: "핫스모크치킨", price: 22000),
            (image: "Chickens_Volcano", title: "볼케이노치킨", price: 23000),
        ],
        "사이드": [
            (image: "SideDishes_FrenchFries", title: "프렌치프라이", price: 3500),
            (image: "SideDishes_CheeseBalls", title: "바삭치즈볼", price: 4500),
            (image: "SideDishes_CheeseSticks", title: "치즈스틱", price: 4000),
            (image: "SideDishes_PotatoWedges", title: "웨지감자", price: 5000),
        ],
        "음료": [
            (image: "Beverages_CocaCola355", title: "코카콜라", price: 2000),
            (image: "Beverages_CocaColaZero355", title: "코카콜라제로", price: 2000),
            (image: "Beverages_Sprite355", title: "스프라이트", price: 2000),
            (image: "Beverages_SpriteZero355", title: "스프라이트제로", price: 2000),
        ],
        "기타": [
            (image: "Others_HoneyMustardSauce", title: "허니머스타드소스", price: 1000),
            (image: "Others_YangNyeomSauce", title: "양념소스", price: 1000),
            (image: "Others_SweetHabaneroSauce", title: "스윗하바네로소스", price: 1500),
            (image: "Others_VolcanoSauce", title: "볼케이노소스", price: 1500),
            (image: "Others_PrinkleYogurtSauce", title: "뿌링요거트소스", price: 1500),
            (image: "Others_Coleslaw", title: "코울슬로", price: 2000),
        ]
    ]
}
