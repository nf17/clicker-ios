//
//  EditPollViewController.swift
//  Clicker
//
//  Created by Kevin Chan on 5/1/18.
//  Copyright © 2018 CornellAppDev. All rights reserved.
//

import UIKit
import SnapKit

class EditPollViewController: UIViewController {
    
    var session: Session!
    
    var buttonStackView: UIStackView!
    var editView: UIView!
    var editNameImageView: UIImageView!
    var editNameButton: UIButton!
    var deleteView: UIView!
    var deleteImageView: UIImageView!
    var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clickerWhite
        setupNavBar()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        editNameImageView = UIImageView(image: #imageLiteral(resourceName: "editPoll"))
        
        editNameButton = UIButton()
        editNameButton.setTitle("Edit Name", for: .normal)
        editNameButton.setTitleColor(.black, for: .normal)
        editNameButton.contentHorizontalAlignment = .left
        editNameButton.titleLabel?.font = UIFont._16RegularFont
        editNameButton.addTarget(self, action: #selector(editNameBtnPressed), for: .touchUpInside)
        
        editView = UIView()
        editView.addSubview(editNameImageView)
        editView.addSubview(editNameButton)
        
        deleteImageView = UIImageView(image: #imageLiteral(resourceName: "delete"))
        
        deleteButton = UIButton()
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.clickerRed, for: .normal)
        deleteButton.contentHorizontalAlignment = .left
        deleteButton.titleLabel?.font = UIFont._16RegularFont
        deleteButton.addTarget(self, action: #selector(deleteBtnPressed), for: .touchUpInside)
        
        deleteView = UIView()
        deleteView.addSubview(deleteImageView)
        deleteView.addSubview(deleteButton)
        
        buttonStackView = UIStackView(arrangedSubviews: [editView, deleteView])
        buttonStackView.axis = .vertical
        buttonStackView.distribution =  .fillEqually
        buttonStackView.spacing = 20
        view.addSubview(buttonStackView)
    }
    
    func setupConstraints() {
        buttonStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(75)
        }
        
        editView.snp.makeConstraints { make in
            make.height.equalTo(24)
        }
        
        editNameImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.centerY.equalToSuperview()
        }
        
        editNameButton.snp.makeConstraints { make in
            make.left.equalTo(editNameImageView.snp.right).offset(18)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        deleteView.snp.makeConstraints { make in
            make.height.equalTo(editView.snp.height)
        }
        
        deleteImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(18)
            make.centerY.equalToSuperview()
        }
        
        deleteButton.snp.makeConstraints { make in
            make.left.equalTo(editNameImageView.snp.right).offset(18)
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
    
    @objc func deleteBtnPressed() {
        self.navigationController?.pushViewController(DeletePollViewController(), animated: true)
    }
    
    @objc func editNameBtnPressed() {
        let editNameVC = EditNameViewController()
        editNameVC.sessionName = session.name
        self.navigationController?.pushViewController(editNameVC, animated: true)
    }
    
    @objc func exitBtnPressed() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupNavBar() {
        let sessionNameButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        sessionNameButton.setTitle(session.name, for: .normal)
        sessionNameButton.setTitleColor(.black, for: .normal)
        sessionNameButton.titleLabel?.font = UIFont._18SemiboldFont
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: sessionNameButton)
        
        let exitButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        exitButton.setImage(#imageLiteral(resourceName: "exit"), for: .normal)
        exitButton.addTarget(self, action: #selector(exitBtnPressed), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: exitButton)
    }
    
}
