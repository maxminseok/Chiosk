//
//  MenuListViewDelegate.swift
//  ChioskApp
//
//  Created by on 2024-11-27.
//
//  Description:
//  - MenuListViewDelegate는 메뉴 리스트 뷰에서 사용자가 메뉴를 선택했을 때 동작을 정의하는 프로토콜입니다.
//  - 이 프로토콜은 View와 Controller 간의 역할을 분리하고, 메뉴 선택 이벤트를 처리할 수 있도록 설계되었습니다.
//

protocol MenuListViewDelegate: AnyObject {
    func menuListView(_ menuListView: MenuListView, didSelectMenu menu: Food)
}
