//
//  MenuViewController.swift
//  StreetsApp
//
//  Created by Vasilii on 30.10.16.
//  Copyright © 2016 Vasilii Burenkov. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var backgrounMaskView: UIView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var dialogView: UIView!
    
    
    var animator: UIDynamicAnimator!
    var attachmentBahavior: UIAttachmentBehavior!
    var snapBehavior: UISnapBehavior!
    
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
        addBlurEffectF(backgrounMaskView, style: .Dark)
        //addBlurEffectF(backgroundMaskView, style:.Dark)
        addBlurEffectF(headerView, style:.Dark)
        addBlurEffectF(bottomView, style: .Dark)
        
        
        animator = UIDynamicAnimator(referenceView: view)
        snapBehavior = UISnapBehavior(item: dialogView, snapToPoint: view.center)
        
    }
    
    // обрабатываем перемещение элемента
    @IBAction func handelRecognizer(sender: AnyObject) {
        
        let myView = dialogView
        let location = sender.locationInView(view)
        let boxLocation = sender.locationInView(dialogView)
       
        
        if sender.state == UIGestureRecognizerState.Began {
            animator.removeBehavior(snapBehavior)
            
            let centerOffset = UIOffsetMake(boxLocation.x - CGRectGetMidX(myView.bounds), boxLocation.y - CGRectGetMidY(myView.bounds))
            attachmentBahavior = UIAttachmentBehavior(item: myView, offsetFromCenter: centerOffset, attachedToAnchor: location)
            attachmentBahavior.frequency = 0
            
            animator.addBehavior(attachmentBahavior)
            
            UIView.animateWithDuration(0.5, animations: { 
                self.userView.frame = CGRectMake(73, 485, 230, 55)
                }
            )
        }
        else if sender.state == UIGestureRecognizerState.Changed {
            attachmentBahavior.anchorPoint = location
        }
        else if sender.state == UIGestureRecognizerState.Ended {
            animator.removeBehavior(attachmentBahavior)
            
            snapBehavior = UISnapBehavior(item: myView, snapToPoint: view.center)
            animator.addBehavior(snapBehavior)
        }
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
