//
//  MenuList.swift
//  ChioskApp
//
//  Created on 2024-11-26.
//
//  Description:
//  - 이 파일은 앱에 표시되는 메뉴 데이터를 관리합니다.
//  - 각 메뉴는 카테고리별로 나뉘며, 이미지 파일 이름, 메뉴 이름, 가격 정보를 포함합니다.
//

import UIKit

/// `MenuList`
/// - 치킨, 사이드 메뉴, 음료, 기타 항목의 데이터를 관리하는 구조체입니다.
/// - `menuCategories` 프로퍼티를 통해 카테고리 이름을 키로 사용하는 딕셔너리로 데이터를 저장합니다.
struct Food {
    let image: String
    let title: String
    let price: Int
}

enum MenuCategory
{
    case chicken
    case side
    case drink
    case other
}

extension MenuCategory {
    var menus: [Food] {
        switch self {
        case .chicken:
            [
                Food(image: "Chickens_Fried", title: "후라이드", price: 21000),
                Food(image: "Chickens_HotFried", title: "핫후라이드", price: 22000),
                Food(image: "Chickens_Yangnyeom", title: "양념치킨", price: 22000),
                Food(image: "Chickens_Prinkle", title: "뿌링클치킨", price: 23000),
                Food(image: "Chickens_Soy", title: "간장고추치킨", price: 22000),
                Food(image: "Chickens_Garlic", title: "간장마늘치킨", price: 23000),
                Food(image: "Chickens_Smoky", title: "스모크치킨", price: 22000),
                Food(image: "Chickens_HotSmoky", title: "핫스모크치킨", price: 22000),
                Food(image: "Chickens_Volcano", title: "볼케이노치킨", price: 23000),
            ]
        case .side:
            [
                Food(image: "SideDishes_FrenchFries", title: "프렌치프라이", price: 3500),
                Food(image: "SideDishes_CheeseBalls", title: "바삭치즈볼", price: 4500),
                Food(image: "SideDishes_CheeseSticks", title: "치즈스틱", price: 4000),
                Food(image: "SideDishes_PotatoWedges", title: "웨지감자", price: 5000),
            ]
        case .drink:
            [
                Food(image: "Beverages_CocaCola355", title: "코카콜라", price: 2000),
                Food(image: "Beverages_CocaColaZero355", title: "코카콜라제로", price: 2000),
                Food(image: "Beverages_Sprite355", title: "스프라이트", price: 2000),
                Food(image: "Beverages_SpriteZero355", title: "스프라이트제로", price: 2000),
            ]
        case .other:
            [
                Food(image: "Others_HoneyMustardSauce", title: "허니머스타드소스", price: 1000),
                Food(image: "Others_YangNyeomSauce", title: "양념소스", price: 1000),
                Food(image: "Others_SweetHabaneroSauce", title: "스윗하바네로소스", price: 1500),
                Food(image: "Others_VolcanoSauce", title: "볼케이노소스", price: 1500),
                Food(image: "Others_PrinkleYogurtSauce", title: "뿌링요거트소스", price: 1500),
                Food(image: "Others_Coleslaw", title: "코울슬로", price: 2000),
            ]
        }
    }
}
