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
        
        view.backgroundColor = .blue
        
        title = "Date"
        hoursTV = UITableView()
    
        view.addSubview(hoursTV)
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Date"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 24
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hourCell") as! HourTableViewCell

        
        cell.dateLabel.text = String((indexPath.item % 12) + 12)
        
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        printSongs()
//        let songVC = SongViewController()
//        self.songDelegate = songVC
//        navigationController?.pushViewController(songVC, animated: true)
//        songDelegate?.updateTextFields(songs: songs, number: indexPath.row)r
//    }

}
