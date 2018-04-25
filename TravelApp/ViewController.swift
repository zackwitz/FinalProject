//
//  ViewController.swift
//  TravelApp
//
//  Created by Zack Hurwitz on 4/23/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import UIKit
import SnapKit
let lightPink = UIColor(red: 249/255, green: 32/255, blue: 166/255, alpha: 1)
let lightOrange = UIColor(red: 255/255, green: 136/255, blue: 15/255, alpha: 1)



class ViewController: UIViewController {
    
    var welcomeLabel: UILabel!
    var calendarButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = lightOrange
        
        welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome to TravelApp!"
        welcomeLabel.textColor = lightPink
        welcomeLabel.numberOfLines = 0
        welcomeLabel.font = UIFont.systemFont(ofSize: 36)
        welcomeLabel.textAlignment = .center
        
        calendarButton = UIButton(type: .system)
        calendarButton.setTitle("Calendar", for: .normal)
        calendarButton.setTitleColor(lightPink, for: .normal)
        calendarButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        calendarButton.addTarget(self, action: #selector(calendarButtonPressed), for: .touchUpInside)
        
        
        view.addSubview(welcomeLabel)
        view.addSubview(calendarButton)
        
        setupConstraints()
    }

    func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.snp.centerY).offset(-24)
            make.leading.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-100)
        }
        
        calendarButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(welcomeLabel.snp.bottom).offset(24)
        }
        
    }
    
    @objc func calendarButtonPressed() {
        navigationController?.pushViewController(CalendarViewController(), animated: true)
    }


}

