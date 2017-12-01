//
// UIViewExtensions.swift
//  DesignPatterns
//
//  Created by Adam B French on 9/28/17.
//  Copyright © 2017 Adam B French. All rights reserved.
//
// The struct ViewLayout demonstrates the factory pattern. The factory pattern means the creation of an object may is encapsulated to the client.  ViewLayout creates a CGrect with a certain position in comparison to a guide view, but the client cannot see how the position is calculated when the creation of a layout is called.
import UIKit



enum ViewPosition {
    case bottomCenter
    case bottomLeft
    case bottomRight
    
    case topCenter
    case topLeft
    case topRight
    
    case center
    case left
    case right
}


extension UIView {
    
    
    convenience init (with Layout: ViewLayout,isInsideView: Bool) {
        if isInsideView {
            self.init(frame: Layout.makeInnerLayout())
        } else {
            self.init(frame: Layout.makeOuterLayout())
        }
    }
    
    public struct ViewLayout {
        
        // The View that is used for positioning
        var guide: CGRect
        var position: ViewPosition
        var size: CGSize
        // First float is vertical padding-negative pushed view up on the screen and positive pushes it down. Second float is horizontal padding-negative pushes view left and positive pushes it right
        var padding: (CGFloat,CGFloat)
       
        // Usually you want to use this init unless laying out view with the root view as the guide
        init(withFrame ofView: UIView, position: ViewPosition, size:CGSize, padding: (CGFloat,CGFloat)) {
            self.guide = ofView.frame
            self.position = position
            self.size = size
            self.padding = padding
        }
        init(withBounds ofView: UIView, position: ViewPosition, size:CGSize, padding: (CGFloat,CGFloat))  {
            self.guide = ofView.bounds
            self.position = position
            self.size = size
            self.padding = padding
        }
        
        
        // This origin is used for laying out the view within it's guide view
        private var origin: CGPoint {
            switch position {
            case .bottomCenter:
                return CGPoint(x: guide.midX - (size.width / 2) + padding.1 , y: guide.maxY - (size.height + padding.0))
            case .bottomLeft:
                return CGPoint(x: guide.minX + padding.1 , y: guide.maxY - (size.height + padding.0))
            case .bottomRight:
                return CGPoint(x: guide.maxX - (self.size.width + padding.1) , y: guide.maxY - (size.height + padding.0))
            case .topLeft:
                return CGPoint(x: guide.minX + padding.1 , y: guide.minY + padding.0)
            case .topRight:
                return CGPoint(x: guide.maxX - (self.size.width + padding.1) , y: (guide.minY + padding.0))
            case .topCenter:
                return CGPoint(x: guide.midX - (size.width / 2) + padding.1, y: guide.minY + padding.0)
            case .right:
                return CGPoint(x: guide.maxX - (size.width + padding.1), y: guide.midY  - (size.height / 2) + padding.0)
            case .left:
                return CGPoint(x: guide.minX + padding.1, y: guide.midY  - (size.height / 2) + padding.0)
            // Center Layout
            default:
                return CGPoint(x: guide.midX - (size.width / 2) + padding.1, y: guide.midY  - (size.height / 2) + padding.0)
            }
        }
        
        // This origin is used for laying out the view outside it's guide view
        private var outerOrigin: CGPoint {
            switch position {
            case .bottomCenter:
                return CGPoint(x: guide.midX - size.width / 2 + padding.1, y: guide.maxY + padding.0)
            case .bottomLeft:
                return CGPoint(x: guide.minX - size.width + padding.1 , y: guide.maxY + padding.0)
            case .bottomRight:
                return CGPoint(x: guide.maxX + padding.1 , y: guide.maxY + padding.0 )
            case .topLeft:
                return CGPoint(x: guide.minX - size.width + padding.1 , y: guide.minY - size.height + padding.0)
            case .topRight:
                return CGPoint(x: guide.maxX + padding.1 , y: guide.minY + size.height + padding.0)
            case .topCenter:
                return CGPoint(x: guide.midX - (size.width / 2) + padding.1, y: guide.minY + size.height + padding.0)
            case .right:
                return CGPoint(x: guide.maxX + padding.1 , y: guide.midY  - (size.height / 2) + padding.0)
            case .left:
                return CGPoint(x: guide.minX - size.width + padding.1, y: guide.midY  - (size.height / 2) + padding.0)
            // Center Layout
            default:
                return CGPoint(x: guide.midX - (size.width / 2) + padding.1, y: guide.midY  - (size.height / 2) + padding.0)
            }
        }
        
        // Don't forget to call this at the end of instantiation!
        func makeInnerLayout() -> CGRect {
            return CGRect(origin: origin, size: size)
        }
        func makeOuterLayout() -> CGRect {
            return CGRect(origin: outerOrigin, size: size)
        }
    }
   

}

