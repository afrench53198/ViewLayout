//
//  ViewController.swift
//  ViewLayoutDemo
//
//  Created by Adam B French on 11/29/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var view1: UIView!
    var view2: UIView!
    var view3: UIView!
    var view4: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        // After device rotation, you need to reset view frames;downside of not using auto layout, but less code
        setFrames()
    }
    /// reset view frames after rotating
    private func setFrames() {
        let view1Layout = UIView.ViewLayout(withBounds: self.view, position: .topLeft, size: CGSize(width:200,height:200), padding: (20,0)).makeInnerLayout()
        view1.frame = view1Layout
        let view2Layout = UIView.ViewLayout(withFrame: view1, position: .bottomRight, size: CGSize(width:200,height:200), padding: (0,0)).makeOuterLayout()
        view2.frame = view2Layout
        let view3Layout = UIView.ViewLayout(withFrame: view2, position: .left, size: CGSize(width:200,height:200), padding: (0,0)).makeOuterLayout()
        view3.frame = view3Layout
        let view4Layout = UIView.ViewLayout(withFrame: view3, position: .left, size: CGSize(width:50,height:50), padding: (0,0)).makeInnerLayout()
        view4.frame = view4Layout
    }
    
    private func layoutViews() {
        // This view is 20 pts down and 20 pts to the right
        let view1Layout = UIView.ViewLayout(withBounds: self.view, position: .topLeft, size: CGSize(width:200,height:200), padding: (20,20)).makeInnerLayout()
        // Can initialize view with layout, or set frame after initialization
        view1 = UIView(frame: view1Layout)
        view1.backgroundColor = .black
        let view2Layout = UIView.ViewLayout(withFrame: view1, position: .bottomRight, size: CGSize(width:200,height:200), padding: (0,0)).makeOuterLayout()
        view2 = UIView(frame: view2Layout)
        view2.backgroundColor = .red
        let view3Layout = UIView.ViewLayout(withFrame: view2, position: .bottomLeft, size: CGSize(width:200,height:200), padding: (0,0)).makeOuterLayout()
        view3 = UIView(frame: view3Layout)
        view3.backgroundColor = .blue
        let view4Layout = UIView.ViewLayout(withFrame: view3, position: .left, size: CGSize(width:50,height:50), padding: (0,0)).makeInnerLayout()
        view4 = UIView(frame: view4Layout)
        view4.backgroundColor = .gray
        let views: [UIView] = [view1,view2,view3,view4]
        for view in views {
            self.view.addSubview(view)
        }
    }


}

