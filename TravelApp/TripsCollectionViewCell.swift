//
//  TripsCollectionViewCell.swift
//  TravelApp
//
//  Created by Zack Hurwitz on 4/26/18.
//  Copyright © 2018 Zack. All rights reserved.
//

import UIKit
import SnapKit

class TripsCollectionViewCell: UICollectionViewCell {
    
    var slLabel: UILabel!
    var elLabel: UILabel!
    var sdLabel: UILabel!
    var edLabel: UILabel
    var hLabel: UILabel!
    
    override init(frame: CGRect) {
        slLabel = UILabel()
        elLabel = UILabel()
        sdLabel = UILabel()
        edLabel = UILabel()
        hLabel = UILabel()
        
        super.init(frame: frame)
        
        contentView.backgroundColor = backgroundGray
        
        slLabel = UILabel()
        elLabel = UILabel()
        sdLabel = UILabel()
        edLabel = UILabel()
        hLabel = UILabel()
        
        slLabel.text = "Start Location: "
        elLabel.text = "End Location: "
        sdLabel.text = "Start Date: "
        edLabel.text = "End Date: "
        hLabel.text = "Hotel: "
        
//        slLabel.textColor = .white
//        elLabel.textColor = .white
//        sdLabel.textColor = .white
//        edLabel.textColor = .white
//        hLabel.textColor = .white
        
        slLabel.font = UIFont.systemFont(ofSize: 24)
        elLabel.font = UIFont.systemFont(ofSize: 24)
        sdLabel.font = UIFont.systemFont(ofSize: 16)
        edLabel.font = UIFont.systemFont(ofSize: 16)
        hLabel.font = UIFont.systemFont(ofSize: 16)
        
        
        
        contentView.addSubview(slLabel)
        contentView.addSubview(elLabel)
        contentView.addSubview(sdLabel)
        contentView.addSubview(edLabel)
        contentView.addSubview(hLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        slLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
        }
        elLabel.snp.makeConstraints { make in
            make.top.equalTo(slLabel.snp.bottom).offset(8)
            make.leading.equalTo(slLabel.snp.leading)
        }
        sdLabel.snp.makeConstraints { make in
            make.leading.equalTo(slLabel.snp.leading)
            make.top.equalTo(elLabel.snp.bottom).offset(8)
        }
        edLabel.snp.makeConstraints { make in
            make.top.equalTo(sdLabel.snp.bottom).offset(8)
            make.leading.equalTo(slLabel.snp.leading)
        }
        hLabel.snp.makeConstraints { make in
            make.top.equalTo(edLabel.snp.bottom).offset(8)
            make.leading.equalTo(slLabel.snp.leading)
        }
        
        super.updateConstraints()
    }
    
    
}
