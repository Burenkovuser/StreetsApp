//
//  MenuViewController.swift
//  StreetsApp
//
//  Created by Vasilii on 30.10.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var backgroundMaskView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var UserView: UIView!
    @IBOutlet weak var dialogView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Set Blur Effect (вызываем написанную ниже функцию для разных view)
        addBlurEffectF(backgroundMaskView, style:.Dark)
        addBlurEffectF(headerView, style:.Dark)
        addBlurEffectF(buttonView, style:.Dark)
        
    }
    // пишем функцию
    func addBlurEffectF(view: UIView, style: UIBlurEffectStyle) {
        
        // отчищаем   view для примеменения blurEffect
        view.backgroundColor = UIColor.clearColor()
        // создадим переменную и задамим ей стиль
        let blurEffect = UIBlurEffect(style: style)
        // создадим следующею констатнту и применяем к ней эффект (ту переменную что создали выше)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        //??
        blurEffectView.frame = view.bounds
        //устанавливаем во view блюрэффект
        view.insertSubview(blurEffectView, atIndex: 0)
    }


}
