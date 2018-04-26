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
        
        title = "Calendar"
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 4, left: 0, bottom: 12, right: 0)
        daysCV = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        daysCV.backgroundColor = .white
        daysCV.dataSource = self
        daysCV.delegate = self
        daysCV.register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: calendarCellReuseIdentifier)
        print("0")
        
        view.addSubview(daysCV)
        
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = daysCV.dequeueReusableCell(withReuseIdentifier: calendarCellReuseIdentifier, for: indexPath) as! CalendarCollectionViewCell
        
        cell.dayNumberLabel.text = String(indexPath.item + 1)
        
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dayVC = DayViewController()
        navigationController?.pushViewController(DayViewController(), animated: true)
    }
    
    
}
