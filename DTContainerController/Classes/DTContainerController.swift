//
//  DTContainerController.swift
//  Pods
//
//  Created by Admin on 22/09/2017.
//
//

import UIKit

open class DTContainerController: UIViewController {
    /// currentViewController
    open private(set) var currentViewController: UIViewController?
    
    //MARK: Initializers
    required public init(viewController: UIViewController) {
        super.init(nibName: nil, bundle: nil)
        currentViewController = viewController
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: UIViewController
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return currentViewController?.preferredStatusBarStyle ?? UIStatusBarStyle.default
    }
    
    override open var prefersStatusBarHidden : Bool {
        return currentViewController?.prefersStatusBarHidden ?? false
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        if let currentViewController = currentViewController {
            addChildViewController(currentViewController)
            view.addSubview(currentViewController.view)
            currentViewController.didMove(toParentViewController: self)
        }
    }
    
    override open func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if let currentViewController = currentViewController {
            currentViewController.view.frame = view.bounds
        }
    }
    
    open func show(_ viewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        let oldViewController = currentViewController
        oldViewController?.willMove(toParentViewController: nil)
        addChildViewController(viewController)
        self.currentViewController = nil // Prevent frame changing in viewWillLayoutSubviews
        
        // Add new view controller's view
        view.addSubview(viewController.view)
        viewController.view.frame = view.bounds
        viewController.view.transform = viewController.view.transform.concatenating(CGAffineTransform(translationX: 0, y: view.frame.size.height))
        
        // The transition
        UIView.animate(withDuration: animated ? 0.6 : 0.0, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: UIViewAnimationOptions.curveLinear, animations: {
            // Update status bar
            self.setNeedsStatusBarAppearanceUpdate()
            
            if let oldViewController = oldViewController {
                oldViewController.view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            viewController.view.transform = CGAffineTransform.identity
        }, completion: { (finished) in
            oldViewController?.removeFromParentViewController()
            viewController.didMove(toParentViewController: self)
            completion?()
            self.currentViewController = viewController
        })
    }
}

/// MARK: UIViewController - return current container view controller
public extension UIViewController {
    weak var containerViewController : DTContainerController? {
        get {
            var viewController : UIViewController?
            viewController = self
            
            while viewController != nil {
                if let containerViewController = viewController?.parent as? DTContainerController {
                    return containerViewController
                }
                else {
                    viewController = viewController?.parent
                }
            }
            
            return nil
        }
    }
}
