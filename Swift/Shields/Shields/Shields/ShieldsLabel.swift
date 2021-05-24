//
//  ShieldsLabel.swift
//  Shields
//
//  Created by 纽扣软件 on 2021/5/24.
//

import UIKit

class ShieldsLabel: UIView {
    enum ShieldsStyle: Int {
        case ShieldsDefault
        case ShieldsLogo
    }
    
    private var logo: UIImageView = UIImageView()
    private var label: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /// 配置UI
        setupUI(style: .ShieldsDefault)
    }
    
    init(frame: CGRect, style: ShieldsStyle) {
        super.init(frame: frame)
        
        /// 配置UI
        setupUI(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- 配置UI
extension ShieldsLabel {
    private func setupUI(style: ShieldsStyle) {
        backgroundColor = UIColor(red: 93/255.0, green: 93/255.0, blue: 93/255.0, alpha: 1.0)
        
        switch style {
        case .ShieldsDefault:
            onlyLabel()
        case .ShieldsLogo:
            logoWithLabel()
        }
    }
    
    private func onlyLabel() {
        let paddingL: CGFloat = 6
        let paddingR: CGFloat = 4
        let paddingY: CGFloat = 4
        
        let labelX: CGFloat = paddingL
        let labelY: CGFloat = paddingY
        let labelW: CGFloat = self.bounds.width - paddingL - paddingR;
        let labelH: CGFloat = self.bounds.height - paddingY * 2.0;
        let label: UILabel = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
        label.textColor = .white
        label.text = "label"
        label.textAlignment = .center
        addSubview(label)
        self.label = label;
    }
    
    private func logoWithLabel() {
        /// logo
        let logoX: CGFloat = 2
        let logoY: CGFloat = 4
        let logoW: CGFloat = 20
        let logoH: CGFloat = logoW
        
        let logo: UIImageView = UIImageView(frame: CGRect(x: logoX, y: logoY, width: logoW, height: logoH))
        logo.center = CGPoint(x: logoX+logoW*0.5+5, y: self.center.y);
        if let errorLogoPath: String = Bundle.main.path(forResource:"errorLogo", ofType: "png") {
            logo.image = UIImage(contentsOfFile: errorLogoPath)
        }
        
        addSubview(logo)
        self.logo = logo
        
        /// label
        let labelX: CGFloat = logoX + logoW + 2
        let labelY: CGFloat = logoY
        let labelW: CGFloat = self.bounds.width - labelX - 2
        let labelH: CGFloat = self.bounds.height - logoY * 2.0
        let label: UILabel = UILabel(frame: CGRect(x: labelX, y: labelY, width: labelW, height: labelH))
        label.textColor = UIColor.white
        label.text = "label"
        label.textAlignment = .center;
        addSubview(label)
        self.label = label;
    }
}

//MARK:- 基本配置
extension ShieldsLabel {
    func configLabel(str: String) {
        label.text = str
    }
    
    func configLabel(str: String, color: UIColor) {
        configLabel(str: str)
        label.textColor = color
    }
    
    func configLogo(img: UIImage) {
        logo.image = img
    }
    
    func configLogo(img: UIImage, logoWidth: CGFloat) {
        configLogo(img: img)
        
        if logoWidth != 0.0 {
            logo.frame = CGRect(x: self.logo.frame.origin.x, y: self.logo.frame.origin.y, width: logoWidth, height: logoWidth)
        }
    }
    
    func configLogo(img: UIImage, logoWidth: CGFloat, logoPosition: CGPoint) {
        configLogo(img: img, logoWidth: logoWidth)
        logo.center = logoPosition
    }
}
