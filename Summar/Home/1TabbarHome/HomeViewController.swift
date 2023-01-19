//
//  TabbarHomeController.swift
//  Summar
//
//  Created by ukBook on 2022/12/10.
//

import Foundation
import UIKit
import SnapKit
import JJFloatingActionButton

class HomeViewController : UIViewController {
    static let shared = HomeViewController()
    let homeView = HomeView.shared
    let actionButton = JJFloatingActionButton()
    
    let viewWidth : CGFloat = {
        var btnWidth = UIScreen.main.bounds.width
        return btnWidth
    }()
    
    let titleImageView : UIImageView = {
        let title = UIImageView()
        title.image = UIImage(named: "Title")
        return title
    }()
    
    let directBtn : UIButton = {
        let directBtn = UIButton()
        directBtn.setImage(UIImage(systemName: "paperplane"), for: .normal)
        directBtn.tintColor = .black
        directBtn.imageView?.contentMode = .scaleToFill
        directBtn.imageEdgeInsets = UIEdgeInsets(top: 32, left: 35, bottom: 33, right: 35)
//        directBtn.addTarget(self, action: #selector(topBtnAction(_:)), for: .touchUpInside)
        directBtn.tag = 2
        return directBtn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(homeView)
        
        let lbNavTitle = UIView (frame: CGRect(x: 0, y: 0, width: viewWidth, height: 40))
        lbNavTitle.layer.borderWidth = 1
        
        _ = [titleImageView].map {
            lbNavTitle.addSubview($0)
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: lbNavTitle)
        self.navigationItem.rightBarButtonItem = self.navigationItem.makeSFSymbolButton(self, action: #selector(topBtnAction(_:)), uiImage: UIImage(systemName: "heart")!, tintColor: .black)
        
        titleImageView.snp.makeConstraints{(make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
            make.width.equalTo(72)
            make.height.equalTo(18)
        }
        
        homeView.snp.makeConstraints{(make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(0)
        }
        
        floatingBtn()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeView.selectFeed()
    }
    
    func floatingBtn(){
        actionButton.addItem(title: "피드 작성하기", image: UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)) { item in
            
            let wrController = UINavigationController(rootViewController:  WriteFeedController.shared)
            wrController.navigationBar.isTranslucent = false
            wrController.navigationBar.backgroundColor = .white
            wrController.modalPresentationStyle = UIModalPresentationStyle.fullScreen
            self.present(wrController, animated: true, completion: nil)
        }

        
        self.view.addSubview(actionButton)
        
        actionButton.snp.makeConstraints{(make) in
            make.width.height.equalTo(56)
            make.bottom.right.equalTo(-16)
        }
        
        actionButton.buttonColor = .systemBlue
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        actionButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        
        actionButton.configureDefaultItem { item in
//            item.titleLabel.font = .boldSystemFont(ofSize: UIFont.systemFontSize)
//            item.titleLabel.textColor = .white
            item.buttonColor = .white
            item.buttonImageColor = .systemBlue

            item.layer.shadowColor = UIColor.black.cgColor
            item.layer.shadowOffset = CGSize(width: 0, height: 1)
            item.layer.shadowOpacity = Float(0.4)
            item.layer.shadowRadius = CGFloat(2)
        }

    }
    
    @objc func topBtnAction(_ sender: Any){
        smLog("")
    }
}

