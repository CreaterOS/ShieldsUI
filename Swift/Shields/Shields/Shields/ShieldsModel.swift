//
//  ShieldsModel.swift
//  Shields
//
//  Created by 纽扣软件 on 2021/5/24.
//

import Foundation
import UIKit

class ShieldsModel: Any {
    var schemaVersion: Int = 0
    var label: String = String()
    var message: String = String()
    var labelBackgroundColor: UIColor = UIColor.clear
    var messageBackgroundColor: UIColor = UIColor.clear
    var labelColor: UIColor = UIColor.clear
    var messageColor: UIColor = UIColor.clear
    var logoName: String = String()
    var logoWidth: CGFloat = 0.0
    var logoPosition: CGPoint = CGPoint()
    
    func modelWithDict(dict: Dictionary<String, Any>) -> ShieldsModel {
        let model: ShieldsModel = ShieldsModel()
        
        for key:String in dict.keys {
            let value = dict[key]
            if key == "schemaVersion" {
                model.schemaVersion = value as! Int
            } else if key == "label" || key == "message" || key == "logoName" {
                let str = value as! String
                if key == "label" {
                    model.label = str
                } else if key == "message" {
                    model.message = str
                } else if key == "logoName" {
                    model.logoName = str
                }
            } else if key == "logoWidth" {
                model.logoWidth = value as! CGFloat
            } else if key == "labelBackgroundColor" || key == "messageBackgroundColor" || key == "labelColor" || key == "messageColor" {
                if key == "labelBackgroundColor" {
                    model.labelBackgroundColor = configColor(value: value as! Dictionary<String, Any>)
                } else if key == "messageBackgroundColor" {
                    model.messageBackgroundColor = configColor(value: value as! Dictionary<String, Any>)
                } else if key == "labelColor" {
                    model.labelColor = configColor(value: value as! Dictionary<String, Any>)
                } else if key == "messageColor" {
                    model.messageColor = configColor(value: value as! Dictionary<String, Any>)
                }
            } else if key == "logoPosition" {
                let locationDict: Dictionary = value as! Dictionary<String, Any>
                let allKeys = locationDict.keys
                var x: CGFloat = 0.0
                var y: CGFloat = 0.0
                
                if allKeys.contains("X") {
                    x = locationDict["X"] as! CGFloat
                }
                
                if allKeys.contains("Y") {
                    y = locationDict["Y"] as! CGFloat
                }
                
                model.logoPosition = CGPoint(x: x, y: y)
            }
        }
        
        return model
    }
    
    private func configColor(value: Dictionary<String,Any>) -> UIColor {
        let colorDict: Dictionary<String,Any> = value
        if colorDict.count != 0 {
            var hexStr: String = String()
            var alpha: CGFloat = 0.0
            let allKeys = colorDict.keys
            if allKeys.contains("hex") {
                hexStr = colorDict["hex"] as! String
            }
            if allKeys.contains("alpha") {
                alpha = colorDict["alpha"] as! CGFloat
            }
            
            let color: UIColor = UIColor().colorWithHexString(colorStr: hexStr, alpha: alpha)
            return color
        }
        
        return .clear
    }
}

extension UIColor {
    func colorWithHexString(colorStr: String, alpha: CGFloat) -> UIColor {
        var cString:String = colorStr.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if (cString.count < 6) {
            return .clear
        }
       
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }
        
        if (cString.count != 6) {
            return .clear
        }
        
        /// Separate into r,g,b substrings
        var range: NSRange = NSRange()
        range.location = 0
        range.length = 2
        /// red
        let rStr: String = (cString as NSString).substring(with: range)
        /// green
        range.location = 2
        let gStr: String = (cString as NSString).substring(with: range)
        /// blue
        range.location = 4
        let bStr: String = (cString as NSString).substring(with: range)
        /// Scan values
        var r: Int = 0
        var g: Int = 0
        var b: Int = 0
        
        Scanner(string: rStr).scanInt(&r)
        Scanner(string: gStr).scanInt(&g)
        Scanner(string: bStr).scanInt(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: alpha)
    }
}
