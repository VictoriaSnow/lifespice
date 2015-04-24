//
//  ContainerViewController.swift
//  Lifespice
//
//  Created by Victoria Bian on 1/13/15.
//  Copyright (c) 2015 Lifespice. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case BothCollapsed
    case SlideOutMenuExpanded
//    case RightPanelExpanded
}

class ContainerViewController: UIViewController, MasterViewControllerDelegate, UIGestureRecognizerDelegate {

    var masterNavigationController: UINavigationController!
    var masterViewController: MasterViewController!
    
    var currentMenu = ""
    var clickedMenu = ""
    var userDefaults = NSUserDefaults()
    
    var currentState: SlideOutState = .BothCollapsed {
        didSet {
            println("show shadow")
            let shouldShowShadow = currentState != .BothCollapsed
            showShadowForMasterViewController(shouldShowShadow)
        }
    }
    
    var slideOutMenuViewController: SlideOutMenuViewController?
    
    let masterPanelExpandedOffset: CGFloat = 76
    
    override func viewDidLoad() {

        super.viewDidLoad()
        println("view loading")
        if(userDefaults.valueForKey("Menu") != nil) {
            currentMenu = userDefaults.valueForKey("Menu") as String
        }
        
        setMasterViewController()
    }
    
    func setMasterViewController() {
        println("reset center view")
        masterViewController = UIStoryboard.masterViewController()
        masterViewController.delegate = self
        
        // wrap the masterViewController in a navigation controller, so we can push views to it
        // and display bar button items in the navigation bar
        masterNavigationController = UINavigationController(rootViewController: masterViewController)
        view.addSubview(masterNavigationController.view)
        addChildViewController(masterNavigationController)
        masterNavigationController.didMoveToParentViewController(self)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePanGesture:")
        masterNavigationController.view.addGestureRecognizer(panGestureRecognizer)
    }
    
    func resetMasterViewController() {
        println("reset center view")
        if(userDefaults.valueForKey("Menu") != nil) {
            clickedMenu = userDefaults.valueForKey("Menu") as String
        }
        if(currentMenu != clickedMenu) {
            currentMenu = clickedMenu
            masterViewController.view.removeFromSuperview()
            masterNavigationController.view.removeFromSuperview()
            setMasterViewController()
        }
    }

    // MARK: MasterViewController delegate methods
    func toggleSlideOutMenu() {
        println("Toggling")
        let notAlreadyExpanded = (currentState != .SlideOutMenuExpanded)
        
        if notAlreadyExpanded {
            addSlideOutMenuViewController()
        }

        animateSlideOutMenu(shouldExpand: notAlreadyExpanded)

    }
    
//    func toggleRightPanel() {
//    
//    }
    func addSlideOutMenuViewController() {
        if (slideOutMenuViewController == nil) {
            slideOutMenuViewController = UIStoryboard.slideOutMenuViewController()
            slideOutMenuViewController!.menuItems = Menu.allMenuItems()
            
            addChildSidePanelController(slideOutMenuViewController!)
        }
    }

    func addChildSidePanelController(sidePanelController: SlideOutMenuViewController) {
        sidePanelController.delegate = masterViewController
        
        view.insertSubview(sidePanelController.view, atIndex: 0)
        
        addChildViewController(sidePanelController)
        sidePanelController.didMoveToParentViewController(self)
    }
//    func addRightPanelViewController() {
//        
//    }
    func animateSlideOutMenu(#shouldExpand: Bool) {
        println("animating")
        if (shouldExpand) {
            currentState = .SlideOutMenuExpanded
            
            animateMasterPanelXPosition(targetPosition: CGRectGetWidth(masterNavigationController.view.frame) - masterPanelExpandedOffset)
        } else {
            resetMasterViewController()
            self.masterNavigationController.view.frame.origin.x = CGRectGetWidth(masterNavigationController.view.frame) - masterPanelExpandedOffset
            animateMasterPanelXPosition(targetPosition: 0) { finished in
                self.currentState = .BothCollapsed
                self.slideOutMenuViewController!.view.removeFromSuperview()
                self.slideOutMenuViewController = nil;
            }
        }
        println("menu animated")
        
    }
    func animateMasterPanelXPosition(#targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {
            self.masterNavigationController.view.frame.origin.x = targetPosition
            }, completion: completion)
    }
    func showShadowForMasterViewController(shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            masterNavigationController.view.layer.shadowOpacity = 0.8
        } else {
            masterNavigationController.view.layer.shadowOpacity = 0.0
        }
    }
//    func animateRightPanel(#shouldExpand: Bool) {
//        
//    }
    func collapseSidePanels() {
        switch (currentState) {
//        case .RightPanelExpanded:
//            toggleRightPanel()
        case .SlideOutMenuExpanded:
            toggleSlideOutMenu()
        default:
            break
        }
    }
    // MARK: Gesture recognizer
    
    func handlePanGesture(recognizer: UIPanGestureRecognizer) {
        // we can determine whether the user is revealing the left or right
        // panel by looking at the velocity of the gesture
        let gestureIsDraggingFromLeftToRight = (recognizer.velocityInView(view).x > 0)
        
        switch(recognizer.state) {
        case .Began:
            if (currentState == .BothCollapsed) {
                // If the user starts panning, and neither panel is visible
                // then show the correct panel based on the pan direction
                
                if (gestureIsDraggingFromLeftToRight) {
                    addSlideOutMenuViewController()
                }
                
                showShadowForMasterViewController(true)
            }
        case .Changed:
            // If the user is already panning, translate the center view controller's
            // view by the amount that the user has panned
            recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
            recognizer.setTranslation(CGPointZero, inView: view)
        case .Ended:
            // When the pan ends, check whether the left or right view controller is visible
            if (masterViewController != nil) {
                // animate the side panel open or closed based on whether the view has moved more or less than halfway
                let hasMovedGreaterThanHalfway = recognizer.view!.center.x > view.bounds.size.width
                animateSlideOutMenu(shouldExpand: hasMovedGreaterThanHalfway)
            }
            
        default:
            break
        }
    }
}


private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func slideOutMenuViewController() -> SlideOutMenuViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("SlideOutMenuViewController") as? SlideOutMenuViewController
    }
    
//    class func rightViewController() -> SlideOutMenuViewController? {
//        return mainStoryboard().instantiateViewControllerWithIdentifier("RightViewController") as? SlideOutMenuViewController
//    }
    
    class func masterViewController() -> MasterViewController? {
        var userDefaults = NSUserDefaults()
        var menu = ""
        if(userDefaults.valueForKey("Menu") != nil) {
            menu = userDefaults.valueForKey("Menu") as String
        }
        println("center view menu \(menu)")
        
        var vc = mainStoryboard().instantiateViewControllerWithIdentifier("MasterViewController") as? MasterViewController
        switch (menu) {
        case "Categories":
            vc = mainStoryboard().instantiateViewControllerWithIdentifier("Categories") as? MasterViewController
        case "Settings":
            vc = mainStoryboard().instantiateViewControllerWithIdentifier("Settings") as? MasterViewController
        case "Help":
            vc = mainStoryboard().instantiateViewControllerWithIdentifier("Help") as? MasterViewController
        default:
            vc = mainStoryboard().instantiateViewControllerWithIdentifier("MasterViewController") as? MasterViewController
        }
        
        return vc
    }
}
















