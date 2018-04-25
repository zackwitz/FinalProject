//
//  CalendarViewController.swift
//  TravelApp
//
//  Created by Zack Hurwitz on 4/24/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import UIKit
import SnapKit

class CalendarViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var daysCV: UICollectionView!
    let calendarCellReuseIdentifier = "calendarCell"

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = lightPink
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 4, left: 0, bottom: 12, right: 0)
        daysCV = UICollectionView(frame: CGRect(x: 10, y: 75, width: view.frame.width - 20, height: view.frame.height - 150), collectionViewLayout: layout)
        daysCV.backgroundColor = .blue
        daysCV.dataSource = self
        daysCV.delegate = self
        daysCV.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: calendarCellReuseIdentifier)
        print("0")
        
        view.addSubview(daysCV)
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = daysCV.dequeueReusableCell(withReuseIdentifier: calendarCellReuseIdentifier, for: indexPath) as! CalendarCollectionViewCell
        
        cell.dayNumberLabel.text = String(indexPath.item + 1)
        
        cell.backgroundColor = .gray
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 31
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 30)
    }
    

//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = daysCV.dequeueReusableCell(withReuseIdentifier: calendarCellReuseIdentifier, for: indexPath) as! CalendarCollectionViewCell
//        cell.backgroundColor = .red
//        cell.dayNumberLabel.text = String(indexPath.item)
//        print("1")
//       // cell.dayNumberLabel.text = "\(indexPath.item)"
//
//
//        cell.setNeedsUpdateConstraints()
//        return cell
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 31
//    }
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 1
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        return CGSize(width: view.frame.width / 6, height: 30)
//
//    }
    
}
