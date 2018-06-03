//
//  PhoneCell.swift
//  Animation
//
//  Created by Bibizhan on 03.04.18.
//  Copyright © 2018 SDU. All rights reserved.
//

import UIKit
import Cartography
import hkMotus

class PhoneCell: UITableViewCell {
    
    let secondView: UIView = {
        let secondView = UIView()
        secondView.backgroundColor = UIColor.purple
        return secondView
    }()
    
    let phoneCamera: UILabel = {
        let phoneCamera = UILabel()
        phoneCamera.textColor = .black
        phoneCamera.text = "16MPX"
        return phoneCamera
    }()
    
    let phone: UILabel = {
        let phoneCamera = UILabel()
        phoneCamera.textColor = .black
        phoneCamera.text = "Snapdragon 808"
        return phoneCamera
    }()
    
    
    lazy var hideButton: UIButton = {
        let hideButton = UIButton()
        hideButton.backgroundColor = .clear
        hideButton.layer.cornerRadius = 7
        hideButton.layer.borderWidth = 1
        hideButton.layer.borderColor = UIColor.white.cgColor
        hideButton.setTitle("hide", for: .normal)
        hideButton.setTitleColor(.white, for: .normal)
        hideButton.translatesAutoresizingMaskIntoConstraints = false
        hideButton.addTarget(self, action: #selector(handleHideTapped), for: .touchUpInside)
        return hideButton
    }()
    
    @objc func handleHideTapped(){
        
        UIView.animate(withDuration: 1, animations: {
            self.secondView.alpha = 0
            self.secondView.transform = CGAffineTransform.init(translationX: 1000, y: 0)
        }) { (_) in
            self.accessoryType = .detailButton
            self.secondView.isHidden = true
            
            self.secondView.transform = CGAffineTransform.identity
        }
        
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: "")
        self.accessoryType = .detailButton
        // perform(#selector(flip), with: nil, afterDelay: 5)
       
        secondView.backgroundColor = .orange
        secondView.isHidden = true
        
        secondView.addSubview(hideButton)
        secondView.addSubview(phone)
        secondView.addSubview(phoneCamera)
        
        addSubview(secondView)
        setupConstraints()
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints(){
        constrain(secondView, self){ sv, this in
            sv.top == this.top
            sv.left == this.left
            sv.right == this.right
            sv.bottom == this.bottom
            
        }
        
        constrain(hideButton ,phoneCamera, phone, secondView){ hb, pc, ph, sv in
            hb.centerY == sv.centerY
            hb.right == sv.right - 20
            hb.height == 30
            hb.width == 100
            
            pc.left == sv.left + 20
            pc.top == sv.top + 12
            
            ph.left == sv.left + 20
            ph.top == sv.bottom - 40

        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
