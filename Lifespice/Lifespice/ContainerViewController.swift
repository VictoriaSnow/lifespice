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
        masterViewController = UIStoryboard.masterViewController()
        masterViewController.delegate = self
        
        // wrap the masterViewController in a navigation controller, so we can push views to it
        // and display bar button items in the navigation bar
        masterNavigationController = UINavigationController(rootViewController: masterViewController)
        view.addSubview(masterNavigationController.view)
        addChildViewController(masterNavigationController)
        
        masterNavigationController.didMoveToParentViewController(self)
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
        return mainStoryboard().instantiateViewControllerWithIdentifier("MasterViewController") as? MasterViewController
    }
}

