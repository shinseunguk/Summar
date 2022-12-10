//
//  TabbarFeed.swift
//  Summar
//
//  Created by ukBook on 2022/12/10.
//

import Foundation
import UIKit
import SnapKit

class TabbarFeed : UIViewController {
    static let shared = TabbarFeed()
    
    let label : UILabel = {
        let label = UILabel()
        label.text = "피드작성"
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(label)
        
        label.snp.makeConstraints{(make) in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.centerY)
            make.width.equalTo(300)
            make.width.equalTo(300)
        }
    }
}

