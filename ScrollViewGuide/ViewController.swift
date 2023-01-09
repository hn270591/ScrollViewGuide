//
//  ViewController.swift
//  ScrollViewGuide
//
//  Created by Nguyen Dac Trung on 09/01/2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // DO NOT USE
        // THE SCROLLVIEW HAS NOT FINISHED LAYOUTING YET
        // let pageWidth = scrollView.bounds.width
        // let pageHeight = scrollView.bounds.height
        
        let pageWidth = UIScreen.main.bounds.width
        let pageHeight = UIScreen.main.bounds.height
        
        scrollView.contentSize = CGSizeMake(3*pageWidth, pageHeight)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        
        let view1 = UIView(frame: CGRectMake(0, 0, pageWidth, pageHeight))
        view1.backgroundColor = UIColor.blue
        let view2 = UIView(frame: CGRectMake(pageWidth, 0, pageWidth, pageHeight))
        view2.backgroundColor = UIColor.orange
        let view3 = UIView(frame: CGRectMake(2*pageWidth, 0, pageWidth, pageHeight))
        view3.backgroundColor = UIColor.purple
        
        scrollView.addSubview(view1)
        scrollView.addSubview(view2)
        scrollView.addSubview(view3)
        
        scrollView.delegate = self
        pageControl.numberOfPages = 3
    }
    
    // Update scroll view when page changed
    @IBAction func pageControlDidPage(_ sender: UIPageControl) {
        print(sender.currentPage)
        let xOffset = scrollView.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPointMake(xOffset,0) , animated: true)
    }
    
    // MARK: - UIScrollViewDelegate
    
    // Update page control when user finished scrolling.
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // print("scrollViewDidEndDecelerating")
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // print("scrollViewDidScroll")
        // print(scrollView.contentOffset)
    }
}

