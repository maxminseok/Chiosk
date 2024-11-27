//
//  MenuListViewDelegate.swift
//  ChioskApp
//
//  Created by t0000-m0112 on 2024-11-27.
//

protocol MenuListViewDelegate: AnyObject {
    func menuListView(_ menuListView: MenuListView, didSelectMenu menu: (image: String, title: String, price: String))
}
