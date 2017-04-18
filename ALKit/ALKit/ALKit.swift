//
//  ALKit.swift
//  AutolayoutPlayground
//
//  Created by Cem Olcay on 22/10/15.
//  Copyright © 2015 prototapp. All rights reserved.
//
//  https://www.github.com/cemolcay/ALKit
//

import UIKit

public extension UIEdgeInsets {

	/// Equal insets for all edges
	public init (inset: CGFloat) {
		top = inset
		bottom = inset
		left = inset
		right = inset
	}
}

public extension UIView{

	public convenience init (withAutolayout: Bool) {
		self.init(frame: CGRect.zero)
		translatesAutoresizingMaskIntoConstraints = false
	}

	public class func AutoLayout() -> UIView {
		let view = UIView(frame: CGRect.zero)
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}

	public func pin(
		edge: NSLayoutAttribute,
		toEdge: NSLayoutAttribute,
		ofView: UIView?,
		withInset: CGFloat = 0) {
		guard let view = superview else {
			return assertionFailure("view must be added as subview in view hierarchy")
		}
		view.addConstraint(NSLayoutConstraint(
			item: self,
			attribute: edge,
			relatedBy: .equal,
			toItem: ofView,
			attribute: toEdge,
			multiplier: 1,
			constant: withInset))
	}

	// MARK: Pin Super

	public func pinRight(toView: UIView, withInset: CGFloat = 0) {
		pin(edge: .right, toEdge: .right, ofView: toView, withInset: -withInset)
	}

	public func pinLeft(toView: UIView, withInset: CGFloat = 0) {
		pin(edge: .left, toEdge: .left, ofView: toView, withInset: withInset)
	}

	public func pinTop(toView: UIView, withInset: CGFloat = 0) {
		pin(edge: .top, toEdge: .top, ofView: toView, withInset: withInset)
	}

	public func pinBottom(toView: UIView, withInset: CGFloat = 0) {
		pin(edge: .bottom, toEdge: .bottom, ofView: toView, withInset: -withInset)
	}

	// MARK: Pin To Another View In Super

	public func pinToRight(ofView: UIView, withOffset: CGFloat = 0) {
		pin(edge: .left, toEdge: .right, ofView: ofView, withInset: withOffset)
	}

	public func pinToLeft(ofView: UIView, withOffset: CGFloat = 0) {
		pin(edge: .right, toEdge: .left, ofView: ofView, withInset: -withOffset)
	}

	public func pinToTop(ofView: UIView, withOffset: CGFloat = 0) {
		pin(edge: .bottom, toEdge: .top, ofView: ofView, withInset: -withOffset)
	}

	public func pinToBottom(ofView: UIView, withOffset: CGFloat = 0) {
		pin(edge: .top, toEdge: .bottom, ofView: ofView, withInset: withOffset)
	}

	// MARK: Fill In Super

	public func fill(toView view: UIView, withInset: UIEdgeInsets = .zero) {
		pinLeft(toView: view, withInset: withInset.left)
		pinRight(toView: view, withInset: withInset.right)
		pinTop(toView: view, withInset: withInset.top)
		pinBottom(toView: view, withInset: withInset.bottom)
	}

	public func fillHorizontal(toView view: UIView, withInset: CGFloat = 0) {
		pinRight(toView: view, withInset: withInset)
		pinLeft(toView: view, withInset: withInset)
	}

	public func fillVertical(toView view: UIView, withInset: CGFloat = 0) {
		pinTop(toView: view, withInset: withInset)
		pinBottom(toView: view, withInset: withInset)
	}

	// MARK: Size

	public func pinSize(width: CGFloat, height: CGFloat) {
		pinWidth(width: width)
		pinHeight(height: height)
	}

	public func pinWidth(width: CGFloat) {
		pin(edge: .width, toEdge: .notAnAttribute, ofView: nil, withInset: width)
	}

	public func pinHeight(height: CGFloat) {
		pin(edge: .height, toEdge: .notAnAttribute, ofView: nil, withInset: height)
	}

	// MARK: Center

	public func pinCenter(toView view: UIView) {
		pinCenterX(toView: view)
		pinCenterY(toView: view)
	}

	public func pinCenterX(toView view: UIView) {
		pin(edge: .centerX, toEdge: .centerX, ofView: view)
	}

	public func pinCenterY(toView view: UIView) {
		pin(edge: .centerY, toEdge: .centerY, ofView: view)
	}
}
