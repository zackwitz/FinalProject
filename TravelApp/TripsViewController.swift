//
//  TripsViewController.swift
//  TravelApp
//
//  Created by Zack Hurwitz on 4/26/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import UIKit
import SnapKit

let backgroundGray = UIColor(red: 228/255, green: 228/255, blue: 228/255, alpha: 1)
var trips = [Trip(startLocation: "SF", endLocation: "NY", startDate: "5/1/18", endDate: "5/5/18", hotel: "Ritz"),
            Trip(startLocation: "LA", endLocation: "BOS", startDate: "6/3/18", endDate: "6/8/18", hotel: "Motel 6")]


class TripsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, TripDelegate {
    
    

    var collectionView: UICollectionView!
    var tripDelegate: TripDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = "My Trips"
        
        let navBar = navigationController?.navigationBar
        var addButton: UIBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addPressed))
        self.navigationItem.rightBarButtonItem = addButton
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 4, left: 0, bottom: 12, right: 0)
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TripsCollectionViewCell.self, forCellWithReuseIdentifier: "tripCell")
        print(trips.count)
        
        view.addSubview(collectionView)
    }

    func loadTrip(trip: Trip) {
        trips.append(trip)
        collectionView?.reloadData() //why is collectionview nil????
        printTripArray(trips: trips)
    }
    
    @objc func addPressed() {
        navigationController?.pushViewController(NewTripViewController(), animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tripCell", for: indexPath) as! TripsCollectionViewCell
        
        let trip = trips[indexPath.item]
        
        cell.slLabel.text = cell.slLabel.text! + trip.startLocation
        cell.elLabel.text = cell.elLabel.text! + trip.endLocation
        cell.sdLabel.text = cell.sdLabel.text! + trip.startDate
        cell.edLabel.text = cell.edLabel.text! + trip.endDate
        cell.hLabel.text = cell.hLabel.text! + trip.hotel
        
        
        cell.setNeedsUpdateConstraints()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 164)
    }
    

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadData()
        
    }
    
    func printTripArray(trips: [Trip]) {
        for t in trips {
            print("sl: \(t.startLocation), el: \(t.endLocation)")
        }
    }
    

}
