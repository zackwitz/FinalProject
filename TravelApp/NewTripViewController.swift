//
//  NewTripViewController.swift
//  TravelApp
//
//  Created by Zack Hurwitz on 4/28/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import UIKit
import SnapKit

protocol TripDelegate {
    func loadTrip(trip: Trip)
}

class NewTripViewController: UIViewController {

    var tripToSave: Trip!
    var slLabel: UILabel!
    var slTextField: UITextField!
    var sdLabel: UILabel!
    var sdTextField: UITextField!
    var elLabel: UILabel!
    var elTextField: UITextField!
    var edLabel: UILabel!
    var edTextField: UITextField!
    var hotelLabel: UILabel!
    var hotelTextField: UITextField!
    var saveButton: UIButton!
    var tripDelegate: TripDelegate?
    
    var proportionStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = backgroundGray
        title = "New Trip"
        
        
        slLabel = UILabel()
        slLabel.text = "Start Location"
        view.addSubview(slLabel)
        
        slTextField = UITextField()
        slTextField.placeholder = "Insert text"
        slTextField.layer.borderWidth = 1
        slTextField.layer.cornerRadius = 6
        view.addSubview(slTextField)
        
        sdLabel = UILabel()
        sdLabel.text = "Start Date"
        view.addSubview(sdLabel)
        
        sdTextField = UITextField()
        sdTextField.placeholder = "Insert text"
        sdTextField.layer.borderWidth = 1
        sdTextField.layer.cornerRadius = 6
        view.addSubview(sdTextField)
        
        elLabel = UILabel()
        elLabel.text = "End Location"
        view.addSubview(elLabel)
        
        elTextField = UITextField()
        elTextField.placeholder = "Insert text"
        elTextField.layer.borderWidth = 1
        elTextField.layer.cornerRadius = 6
        view.addSubview(elTextField)
        
        edLabel = UILabel()
        edLabel.text = "End Date"
        view.addSubview(edLabel)
        
        edTextField = UITextField()
        edTextField.placeholder = "Insert text"
        edTextField.layer.borderWidth = 1
        edTextField.layer.cornerRadius = 6
        view.addSubview(edTextField)
        
        hotelLabel = UILabel()
        hotelLabel.text = "Hotel"
        view.addSubview(hotelLabel)
        
        hotelTextField = UITextField()
        hotelTextField.placeholder = "Insert text"
        hotelTextField.layer.borderWidth = 1
        hotelTextField.layer.cornerRadius = 6
        view.addSubview(hotelTextField)
        
        saveButton = UIButton()
        saveButton.setTitle("Save", for: .normal)
        //saveButton.backgroundColor = .yellow
        saveButton.setTitleColor(.yellow, for: .normal)
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 60)
        saveButton.layer.cornerRadius = 6
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        view.addSubview(saveButton)
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        slLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
        }
        
        sdLabel.snp.makeConstraints { make in
            make.leading.equalTo(slLabel.snp.leading)
            make.top.equalTo(slLabel.snp.bottom).offset(16)
        }
        
        elLabel.snp.makeConstraints { make in
            make.leading.equalTo(slLabel.snp.leading)
            make.top.equalTo(sdLabel.snp.bottom).offset(16)
        }
        
        edLabel.snp.makeConstraints { make in
            make.leading.equalTo(slLabel.snp.leading)
            make.top.equalTo(elLabel.snp.bottom).offset(16)
        }
        
        hotelLabel.snp.makeConstraints { make in
            make.leading.equalTo(slLabel.snp.leading)
            make.top.equalTo(edLabel.snp.bottom).offset(16)
        }
        
        slTextField.snp.makeConstraints { make in
            make.leading.equalTo(slLabel.snp.trailing).offset(16)
            make.centerY.equalTo(slLabel.snp.centerY)
        }
        
        sdTextField.snp.makeConstraints { make in
            make.leading.equalTo(sdLabel.snp.trailing).offset(16)
            make.centerY.equalTo(sdLabel.snp.centerY)
        }
        
        elTextField.snp.makeConstraints { make in
            make.leading.equalTo(elLabel.snp.trailing).offset(16)
            make.centerY.equalTo(elLabel.snp.centerY)
        }
        
        edTextField.snp.makeConstraints { make in
            make.leading.equalTo(edLabel.snp.trailing).offset(16)
            make.centerY.equalTo(edLabel.snp.centerY)
        }
        
        hotelTextField.snp.makeConstraints { make in
            make.leading.equalTo(hotelLabel.snp.trailing).offset(16)
            make.centerY.equalTo(hotelLabel.snp.centerY)
        }
        
        saveButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-80)
        }
    
        
    }
    
    @objc func saveButtonPressed(sender: UIButton) {
       let trip = Trip(startLocation: slTextField.text!, endLocation: elTextField.text!, startDate: sdTextField.text!, endDate: edTextField.text!, hotel: hotelTextField.text!)
        printTrip(trip: trip)
        self.tripDelegate = TripsViewController()
        tripDelegate?.loadTrip(trip: trip)
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    func printTrip(trip: Trip) {
        print("sl: \(trip.startLocation)")
    }
    
}
