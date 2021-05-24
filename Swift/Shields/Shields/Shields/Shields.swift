//
//  Shields.swift
//  Shields
//
//  Created by 纽扣软件 on 2021/5/24.
//

import UIKit

class Shields: UIView {
    //
    private var label: ShieldsLabel = ShieldsLabel()
    private var message: ShieldsMessage = ShieldsMessage()
    
    //
    var messageWidth: CGFloat {
        get {
            15.0
        }
        set {
            let center: CGPoint = self.center
            message.frame = CGRect(x: self.message.frame.origin.x, y: self.message.frame.origin.y, width: newValue, height: self.message.frame.height)
            message.layoutSubviews()
            
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.label.frame.width+newValue, height: self.frame.height)
            self.center = center
        }
    }
    
    var cornerRadius: CGFloat {
        get {
            0.0
        }
        
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        /// 配置UI
        setupUI(style: .ShieldsDefault)
    }
    
    init(frame: CGRect, style: ShieldsLabel.ShieldsStyle) {
        super.init(frame: frame)
        
        /// 配置UI
        setupUI(style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:- 配置UI
extension Shields {
    private func setupUI(style: ShieldsLabel.ShieldsStyle) {
        /// label
        let labelW: CGFloat = self.frame.width * 0.4;
        let label: ShieldsLabel = ShieldsLabel(frame: CGRect(x: 0, y: 0, width: labelW, height: self.frame.height), style: style)
        addSubview(label)
        self.label = label;
        
        let messageW: CGFloat = self.frame.width - labelW;
        /// message
        let message: ShieldsMessage = ShieldsMessage(frame: CGRect(x: labelW, y: 0, width: messageW, height: self.frame.height))
        addSubview(message)
        self.message = message;
    }
}

//MARK:- 基本配置
extension Shields {
    func configLabel(label: String?, message: String?) {
        configLabel(label: label, message: message, labelColor: nil, messageColor: nil)
    }
    
    func configLabel(label: String?, message: String?, labelColor: UIColor?, messageColor: UIColor?) {
        configLabel(label: label, message: message, labelBackgroundColor: nil, messageBackgroundColor: nil, labelColor: labelColor, messageColor: messageColor)
    }
    
    func configLabel(label: String?, message: String?, labelColor: UIColor?) {
        configLabel(label: label, message: message, labelColor: labelColor, messageColor: nil)
    }
    
    func configLabel(label: String?, message: String?, messageColor: UIColor?) {
        configLabel(label: label, message: message, labelColor: nil, messageColor: messageColor)
    }
    
    func configLabel(label: String?, message: String?, labelBackgroundColor: UIColor?) {
        configLabel(label: label, message: message, labelBackgroundColor: labelBackgroundColor, messageBackgroundColor: nil, labelColor: nil, messageColor: nil)
    }
    
    func configLabel(label: String?, message: String?, messageBackgroundColor: UIColor?) {
        configLabel(label: label, message: message, labelBackgroundColor: nil, messageBackgroundColor: messageBackgroundColor, labelColor: nil, messageColor: nil)
    }
    
    func configLabel(label: String?, message: String?, labelBackgroundColor: UIColor?, messageBackgroundColor: UIColor?) {
        configLabel(label: label, message: message, labelBackgroundColor: labelBackgroundColor, messageBackgroundColor: messageBackgroundColor, labelColor: nil, messageColor: nil)
    }
    
    func configLabel(label: String?, message: String?, labelBackgroundColor: UIColor?, messageBackgroundColor: UIColor?, labelColor: UIColor?, messageColor: UIColor?) {
        configLabel(label: label, message: message, labelBackgroundColor: labelBackgroundColor, messageBackgroundColor: messageBackgroundColor, labelColor: labelColor, messageColor: messageColor, logo: nil)
    }
    
    func configLabel(label: String?, message: String?, labelBackgroundColor: UIColor?, messageBackgroundColor: UIColor?, labelColor: UIColor?, messageColor: UIColor?, logo: UIImage?) {
        configLabel(label: label, message: message, labelBackgroundColor: labelBackgroundColor, messageBackgroundColor: messageBackgroundColor, labelColor: labelColor, messageColor: messageColor, logo: logo, logoWidth: 0.0, logoPosition: CGPoint())
    }
    
    func configLabel(label: String?, message: String?, labelBackgroundColor: UIColor?, messageBackgroundColor: UIColor?, labelColor: UIColor?, messageColor: UIColor?, logo: UIImage?, logoWidth: CGFloat?, logoPosition: CGPoint?) {
        if let labelBackgroundColor = labelBackgroundColor {
            self.label.backgroundColor = labelBackgroundColor
        }
        
        if let messageBackgroundColor = messageBackgroundColor {
            self.message.backgroundColor = messageBackgroundColor
        }

        
        
        if let label = label {
            self.label.configLabel(str: label)
            if let labelColor = labelColor {
                self.label.configLabel(str: label, color: labelColor)
            }
        }

        if let message = message  {
            self.message.configMessage(str: message)
            if let messageColor = messageColor {
                self.message.configMessage(str: message, color: messageColor)
            }
        }
        
        
        if let logo = logo {
            self.label.configLogo(img: logo)
            if let logoWidth = logoWidth {
                self.label.configLogo(img: logo, logoWidth: logoWidth)
                if let logoPosition = logoPosition {
                    self.label.configLogo(img: logo, logoWidth: logoWidth, logoPosition: logoPosition)
                }
            }
        }
    }
}

//MARK:- Json文件读取配置
extension Shields {
    func configWithJsonFilePath(jsonPath: String) {
        if jsonPath.count != 0 {
            do {
                let data = try Data.init(contentsOf: URL(fileURLWithPath: jsonPath))
                configJsonWithData(data: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func configWithJsonFileURL(jsonURL: URL) {
        if jsonURL.absoluteString.count != 0 {
            do {
                let data = try Data.init(contentsOf: jsonURL)
                configJsonWithData(data: data)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func configJsonWithData(data: Data) {
        do {
            let dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            configWithModel(model: ShieldsModel().modelWithDict(dict: dict as! Dictionary<String, Any>))
        } catch {
            print(error.localizedDescription)
            return
        }
    }
    
    private func configWithModel(model: ShieldsModel) {
        configLabel(label: model.label, message: model.message, labelBackgroundColor: model.labelBackgroundColor, messageBackgroundColor: model.messageBackgroundColor, labelColor: model.labelColor, messageColor: model.messageColor, logo: UIImage(named: model.logoName), logoWidth: model.logoWidth, logoPosition: model.logoPosition)
    }
}
