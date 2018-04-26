//
//  DayViewController.swift
//  TravelApp
//
//  Created by Zack Hurwitz on 4/25/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import UIKit
import SnapKit

class DayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var hoursTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        hoursTV = UITableView()
    
        
        setupConstraints()
    }
    
    func setupConstraints() {
        hoursTV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func createTableView() -> UITableView {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.bounces = true
        tv.register(HourTableViewCell.self, forCellReuseIdentifier: "hourCell")
        return tv
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
