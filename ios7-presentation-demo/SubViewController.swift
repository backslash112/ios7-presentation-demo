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
    
//    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//    }
//    
//    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        
//    }

// only avalible in iOS 8
//    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController!, sourceViewController source: UIViewController) -> UIPresentationController? {
//        
//    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.3
    }
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let presentedController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let presentingController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        let containterView = transitionContext.containerView()
        
        let presentedView = presentedController!.view
        let presentingView = presentingController!.view
        
        if presentingController == self {
            self.dimmingView.frame = containterView.bounds
            self.dimmingView.alpha = 0.0
            
            containterView.addSubview(self.dimmingView)
            containterView.addSubview(presentingView)
            
            let transitionCoordinator  = presentingController!.transitionCoordinator()
            transitionCoordinator!.animateAlongsideTransition({ (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.dimmingView.alpha = 1.0
            }, completion: nil)
            
        } else {
            let transitionCoordinator = presentingController!.transitionCoordinator()
            transitionCoordinator!.animateAlongsideTransition({ (context: UIViewControllerTransitionCoordinatorContext!) -> Void in
                self.dimmingView.alpha = 0.0
            }, completion: nil)
        }
    }
    
    override func sizeForChildContentContainer(container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        return CGSizeMake(200, 300)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
