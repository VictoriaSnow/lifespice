////
////  ContainerViewController.swift
////  Lifespice
////
////  Created by Victoria Bian on 1/13/15.
////  Copyright (c) 2015 Lifespice. All rights reserved.
////
//
//import UIKit
//import QuartzCore
//
//enum SlideOutState {
//    case BothCollapsed
//    case LeftPanelExpanded
//    case RightPanelExpanded
//}
//
//class ContainerViewController: UIViewController, MasterViewControllerDelegate, UIGestureRecognizerDelegate {
//    var centerNavigationController: UINavigationController!
//    var centerViewController: MasterViewController!
//    var currentMenu = ""
//    var clickedMenu = ""
//    var userDefaults = NSUserDefaults()
//    
//    var currentState: SlideOutState = .BothCollapsed {
//        didSet {
//            let shouldShowShadow = currentState != .BothCollapsed
//            showShadowForCenterViewController(shouldShowShadow)
//        }
//    }
//    
//    var leftViewController: SlideOutMenuViewController?
//    var rightViewController: SlideOutMenuViewController?
//    
//    let centerPanelExpandedOffset: CGFloat = 60
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        currentMenu = userDefaults.valueForKey("Menu") as String
//        setCenterViewController()
//    }
//    
//    func setCenterViewController(){
//        centerViewController = UIStoryboard.centerViewController()
//        centerViewController.delegate = self
//        
//        // wrap the centerViewController in a navigation controller, so we can push views to it
//        // and display bar button items in the navigation bar
//        centerNavigationController = UINavigationController(rootViewController: centerViewController)
//        view.addSubview(centerNavigationController.view)
//        addChildViewController(centerNavigationController)
//        centerNavigationController.didMoveToParentViewController(self)
//        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
//        centerNavigationController.view.addGestureRecognizer(panGestureRecognizer)
//    }
//    
//    func resetCenterViewController(){
//        println("setCenterViewController")
//        clickedMenu = userDefaults.valueForKey("Menu") as String
//        if(currentMenu != clickedMenu){
//            currentMenu = clickedMenu
//            centerViewController.view.removeFromSuperview()
//            centerNavigationController.view.removeFromSuperview()
//            setCenterViewController()
//        }
//    }
//    
//    // MARK: CenterViewController delegate methods
//    func collapseSidePanels() {
//        switch (currentState) {
//        case .RightPanelExpanded:
//            toggleRightPanel()
//            //            resetCenterViewController()
//        case .LeftPanelExpanded:
//            toggleLeftPanel()
//            //            resetCenterViewController()
//        default:
//            break
//        }
//    }
//    
//    func toggleLeftPanel() {
//        let notAlreadyExpanded = (currentState != .LeftPanelExpanded)
//        if notAlreadyExpanded {
//            addLeftPanelViewController()
//        }
//        animateLeftPanel(shouldExpand: notAlreadyExpanded)
//    }
//    
//    func toggleRightPanel() {
//        let notAlreadyExpanded = (currentState != .RightPanelExpanded)
//        if notAlreadyExpanded {
//            addRightPanelViewController()
//        }
//        animateRightPanel(shouldExpand: notAlreadyExpanded)
//    }
//    
//    
//    func addLeftPanelViewController() {
////        if (leftViewController == nil) {
////            leftViewController = UIStoryboard.leftViewController()
////            leftViewController!.menus = Menu.allLeftMenus()
////            addChildSidePanelController(leftViewController!)
////        }
//    }
//    
//    func addRightPanelViewController() {
////        if (rightViewController == nil) {
////            rightViewController = UIStoryboard.rightViewController()
////            rightViewController!.menus = Menu.allRightMenus()
////            addChildSidePanelController(rightViewController!)
////        }
//    }
//    
//    func addChildSidePanelController(sidePanelController: SlideOutMenuViewController) {
//        sidePanelController.delegate = centerViewController
//        view.insertSubview(sidePanelController.view, atIndex: 0)
//        addChildViewController(sidePanelController)
//        sidePanelController.didMoveToParentViewController(self)
//    }
//    
//    func animateLeftPanel(#shouldExpand: Bool) {
//        println("animateLeftPanel")
//        println("CGRectGetWidth(centerNavigationController.view.frame) \(CGRectGetWidth(centerNavigationController.view.frame))")
//        if (shouldExpand) {
//            currentState = .LeftPanelExpanded
//            animateCenterPanelXPosition(targetPosition: CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset)
//        } else {
//            resetCenterViewController()
//            self.centerNavigationController.view.frame.origin.x = CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset
//            animateCenterPanelXPosition(targetPosition: 0) { finished in
//                self.currentState = .BothCollapsed
//                self.leftViewController!.view.removeFromSuperview()
//                self.leftViewController = nil;
//            }
//        }
//    }
//    
//    func animateRightPanel(#shouldExpand: Bool) {
////        println("animateRightPanel")
////        if (shouldExpand) {
////            currentState = .RightPanelExpanded
////            animateCenterPanelXPosition(targetPosition: -CGRectGetWidth(centerNavigationController.view.frame) + centerPanelExpandedOffset)
////        } else {
////            resetCenterViewController()
////            self.centerNavigationController.view.frame.origin.x = -CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset
////            animateCenterPanelXPosition(targetPosition: 0) { _ in
////                self.currentState = .BothCollapsed
////                self.rightViewController!.view.removeFromSuperview()
////                self.rightViewController = nil;
////            }
////        }
//    }
//    
//    func animateCenterPanelXPosition(#targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
//        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
//            self.centerNavigationController.view.frame.origin.x = targetPosition
//            }, completion: completion)
//    }
//    
//    func showShadowForCenterViewController(shouldShowShadow: Bool) {
//        if (shouldShowShadow) {
//            centerNavigationController.view.layer.shadowOpacity = 0.8
//        } else {
//            centerNavigationController.view.layer.shadowOpacity = 0.0
//        }
//    }
//    
//    // MARK: Gesture recognizer
//    
//    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
//        // we can determine whether the user is revealing the left or right
//        // panel by looking at the velocity of the gesture
//        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
//        
//        switch(recognizer.state) {
//        case .Began:
//            if (currentState == .BothCollapsed) {
//                // If the user starts panning, and neither panel is visible
//                // then show the correct panel based on the pan direction
//                
//                if (gestureIsDraggingFromLeftToRight) {
//                    addLeftPanelViewController()
//                } else {
//                    addRightPanelViewController()
//                }
//                
//                showShadowForCenterViewController(true)
//            }
//        case .Changed:
//            // If the user is already panning, translate the center view controller's
//            // view by the amount that the user has panned
//            recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
//            recognizer.setTranslation(CGPointZero, inView: view)
//        case .Ended:
//            // When the pan ends, check whether the left or right view controller is visible
//            if (leftViewController != nil) {
//                // animate the side panel open or closed based on whether the view has moved more or less than halfway
//                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
//                animateLeftPanel(shouldExpand: hasMovedGreaterThanHalfway)
//            } else if (rightViewController != nil) {
//                let hasMovedGreaterThanHalfway = recognizer.view!.center.x < 0
//                animateRightPanel(shouldExpand: hasMovedGreaterThanHalfway)
//            } default: break
//        }
//    }
//}
////private extension UIStoryboard {
////    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
////    
////    class func leftViewController() -> SlideOutMenuViewController? {
////        return mainStoryboard().instantiateViewControllerWithIdentifier("LeftViewController") as? SidePanelViewController
////    }
////    
////    class func rightViewController() -> SlideOutMenuViewController? {
////        return mainStoryboard().instantiateViewControllerWithIdentifier("RightViewController") as? SidePanelViewController
////    }
////    
////    class func centerViewController() -> MasterViewController? {
////        var userDefaults = NSUserDefaults()
////        var menu = ""
////        menu = userDefaults.valueForKey("Menu") as String
////        println("centerViewController menu \(menu)")
////        var vc = mainStoryboard().instantiateViewControllerWithIdentifier("MasterViewController") as? CenterViewController
////        switch(menu) {
////        case "LeftMenu1":
////            vc = mainStoryboard().instantiateViewControllerWithIdentifier("LeftVC1") as? CenterViewController
////        case "LeftMenu2":
////            vc = mainStoryboard().instantiateViewControllerWithIdentifier("LeftVC2") as? CenterViewController
////        case "LeftMenu3":
////            vc = mainStoryboard().instantiateViewControllerWithIdentifier("LeftVC3") as? CenterViewController
////        case "RightMenu1":
////            vc = mainStoryboard().instantiateViewControllerWithIdentifier("RightVC1") as? CenterViewController
////        case "RightMenu2":
////            vc = mainStoryboard().instantiateViewControllerWithIdentifier("RightVC2") as? CenterViewController
////        case "RightMenu3":
////            vc = mainStoryboard().instantiateViewControllerWithIdentifier("RightVC3") as? CenterViewController
////        default:
////            vc = mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
////            break
////        }
////        return vc
////        
////    }
////}
//
