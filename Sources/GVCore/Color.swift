//
//  Color.swift
//  GVCore
//
//  Created by geovision on 2020/11/20.
//
import UIKit
//import Foundation

extension GVCore {
    public class Color {
        /// Allow you to convert 6 gigit hexadecimal string into a UIColor instance
        /// - Warning: The "#" symbol is stripped from the beginning of the string submitted here.
        /// - Parameters:
        ///   - hexString: A 6-digital hexadecimal string. Use 6 digits rather then 8, and add the accompanying alpha value in the second parameter
        ///   - alpha: alpha value from 0.0~1.0
        /// - Returns: a UIColor define by input string
        internal class func fromHexString(_ hexString: String, alpha: CGFloat = 1.0) -> UIColor {
            let r, g, b: CGFloat
            let offset = hexString.hasPrefix("#") ? 1 : 0
            let start = hexString.index(hexString.startIndex, offsetBy: offset)
            let hexColor = String(hexString[start...])
            let scanner = Scanner(string: hexColor)
            var hexNumber: UInt64 = 0
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                b = CGFloat((hexNumber & 0x0000ff) ) / 255
                return UIColor(red: r, green: g, blue: b, alpha: alpha)
            }
            return UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        }
        //MARK: public stuff
        /// Random chose color by Prince
        public static var defaultColor : UIColor {
            return GVCore.Color.fromHexString("005FFF")
        }
        // Gv-Eye
        public static var gveyeColor : UIColor {
            //[UIColor colorWithRed:123.0/255.0 green:144.0/255.0 blue:170/255.0 alpha:1.0];
            return GVCore.Color.fromHexString("7B90AA")
        }
        // Cloud App, CamApp, Cloud Center Client
        public static var cloudColor : UIColor{
            //[UIColor colorWithRed:0.0/255.0 green:150.0/255.0 blue:206/255.0 alpha:1.0];
            return GVCore.Color.fromHexString("0096CE")
        }
        // Advance Eye
        public static var advanceColor : UIColor{
            //[UIColor colorWithRed:0.0/255.0 green:130.0/255.0 blue:178.0/255.0 alpha:1.0];
            return GVCore.Color.fromHexString("0082B2")
        }
        public static var bolderColor : UIColor{
            //[UIColor colorWithRed:28/255.0 green:28/255.0 blue:27/255.0 alpha:1.0];
            return GVCore.Color.fromHexString("1C1C1B")
        }
        public static var fillColor : UIColor{
            //[UIColor colorWithRed:28/255.0 green:28/255.0 blue:27/255.0 alpha:1.0];
            return GVCore.Color.fromHexString("4F4F4E")
        }
        public static var placeholderColor : UIColor{
            return GVCore.Color.fromHexString("0000FA", alpha: 0.22)
        }
    }
}
