//
//  SubViewController.swift
//  ios7-presentation-demo
//
//  Created by YangCun on 14/12/27.
//  Copyright (c) 2014年 backslash112. All rights reserved.
//

import UIKit

class SubViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning
{

    lazy var dimmingView: UIView = {
        let view = UIView(frame: self.view.frame)
        view.backgroundColor = UIColor.redColor().colorWithAlphaComponent(0.5)
        view.alpha = 1.0
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        // Do any additional setup after loading the view.
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        self.transitioningDelegate = self
        self.modalPresentationStyle = UIModalPresentationStyle.Custom
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClick(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }

// only avalible in iOS 8
//    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
//        
//    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let presentedController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let presentingController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containterView = transitionContext.containerView()
        
        let presentedView = presentedController!.view
        let presentingView = presentingController!.view
        
        if presentingController == self {
            
            containterView.addSubview(presentingView)
            presentingView.frame = presentedView.frame
            presentingView.alpha = 0.0
            presentingView.tintAdjustmentMode = UIViewTintAdjustmentMode.Dimmed
            
            // let transitionCoordinator  = presentingController!.transitionCoordinator()

            UIView.animateWithDuration(0.25, animations: { () in
                presentingView.alpha = 1.0
            }, completion: { finished in
                transitionContext.completeTransition(true)
            })
            
        } else {
            // let transitionCoordinator = presentingController!.transitionCoordinator()
            
            UIView.animateWithDuration(0.25, animations: { () in
                presentedView.alpha = 0.0
                }, completion: { finished in
                    presentingView.tintAdjustmentMode = UIViewTintAdjustmentMode.Automatic
                    transitionContext.completeTransition(true)
            })
        }
    }
    
//    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
//        return CGSizeMake(200, 300)
//    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
