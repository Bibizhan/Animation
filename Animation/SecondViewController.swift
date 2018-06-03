//
//  SecondViewController.swift
//  Animation
//
//  Created by Bibizhan on 03.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import hkMotus

class SecondViewController: UIViewController{
    var phoneCell: PhoneCell?
    var phones: [Phone] = [
        Phone("IPhone", "360$","12MPX" ,"Snapdragon 808"),
        Phone("Samsung Galaxy S8", "360$","12MPX" ,"Snapdragon 808"),
        Phone("IPhone", "360$","12MPX" ,"Snapdragon 808"),
        Phone("Nexus 6P", "360$","12MPX", "Snapdragon 808"),
        Phone("IPhone", "360$","12MPX" ,"Snapdragon 808"),
        Phone("Google Pixel", "360$","12MPX", "Snapdragon 808")
    ]

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PhoneCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        setupConstrains()
       // button.addTarget(self, action: #selector (infoButton), for: .touchUpInside)
    
        UIView.animate(withDuration: 1.5, animations: {
            self.tableView.transform = CGAffineTransform.init(translationX: 0, y: 0)
        }) { (isCompleted) in
            if isCompleted{
                UIView.animate(withDuration: 1, animations: {
                    
                })
            }
        }
    }
    
//    @objc func infoButton(){
//        print("info")
//
//    }

    func setupConstrains(){
        constrain(tableView, view) { tb,vw in
            tb.top == vw.top
            tb.right == vw.right
            tb.left == vw.left
            tb.bottom == vw.bottom
            
    }
}
}

extension SecondViewController: UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phones.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PhoneCell
        cell.textLabel?.text = phones[indexPath.row].phoneModel
        cell.detailTextLabel?.text = phones[indexPath.row].phonePrice
        
        cell.transform = CGAffineTransform.init(translationX: -1000, y: 0)
    
        UIView.animate(withDuration: 1.5, delay: 0.2*Double(indexPath.row), options: .curveEaseOut, animations: {
            cell.transform = CGAffineTransform.init(translationX: 0, y: 0)
        }, completion: nil)
        

       return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
         tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        if let cell = tableView.visibleCells[indexPath.row] as? PhoneCell{
            let secondView = cell.secondView
            secondView.isHidden = false
            secondView.alpha = 1
            let transitionOptions: UIViewAnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
            UIView.transition(with: secondView, duration: 1, options: transitionOptions, animations: nil, completion: { (_) in
                cell.accessoryType = .none
            })
            
            cell.secondView.isHidden = false
            cell.accessoryType = .none
        }
    }
    
}


