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
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        // эффект масштабирования через стандартную функцию (увеличение)
        let scale = CGAffineTransformMakeScale(0.5, 0.5)
        // задаем начальную точку представления (перемещение)
        let translate = CGAffineTransformMakeTranslation(0, -300)
        //объеденяем две трансформации
        dialogView.transform = CGAffineTransformConcat(scale, translate)
        
        // анимация представления длительность (2.0 сек)
        UIView.animateWithDuration(2.0) {
            //возвращаем в начальную точку представление
            let scale = CGAffineTransformMakeScale(1, 1)
            let translate = CGAffineTransformMakeTranslation(0, 0)
            self.dialogView.transform = CGAffineTransformConcat(scale, translate)
        }
    }
    
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
    // делаем белым статус бар плюс меняем статус бар там где информация о проекте в главном меню
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }


}
