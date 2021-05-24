//
//  ShieldsMessage.swift
//  Shields
//
//  Created by 纽扣软件 on 2021/5/24.
//

import UIKit

class ShieldsMessage: UIView {
    private var message: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /// 配置UI
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- 配置UI
extension ShieldsMessage {
    private func setupUI() {
        backgroundColor = UIColor(red: 108/255.0, green: 188/255.0, blue: 65/255.0, alpha: 1.0)
        
        let message: UILabel = UILabel()
        message.textColor = UIColor.white
        message.text = "message"
        message.textAlignment = .center
        addSubview(message)
        self.message = message
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let paddingL: CGFloat = 4;
        let paddingR: CGFloat = 6;
        let paddingY: CGFloat = 4;
        let messageX: CGFloat = paddingL;
        let messageY: CGFloat = paddingY;
        let messageW: CGFloat = self.bounds.width - paddingL - paddingR;
        let messageH: CGFloat = self.bounds.height - paddingY * 2.0;
        self.message.frame = CGRect(x: messageX, y: messageY, width: messageW, height: messageH);
    }
}

//MARK:- 基本配置
extension ShieldsMessage {
    func configMessage(str: String) {
        message.text = str
    }
    
    func configMessage(str: String, color: UIColor) {
        configMessage(str: str)
        message.textColor = color
    }
}
