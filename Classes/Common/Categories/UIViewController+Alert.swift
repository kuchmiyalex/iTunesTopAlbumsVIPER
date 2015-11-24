//
//  UIViewController+Alert.swift
//  iTunes Albums VIPER
//
//  Created by Alexey Kuchmiy on 11/23/15.
//  Copyright © 2015 Alexey Kuchmiy. All rights reserved.
//

import UIKit

extension UIViewController
{
    func showWarningAlert(message: String)
    {
        showAlert("Warning", message: message)
    }

    func showAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        let actionOk = UIAlertAction(title: "OK", style: .Cancel) { (alert) -> Void in
        }
        alertController.addAction(actionOk)
        presentViewController(alertController, animated: true, completion: nil)
        
    }

}