//
//  ViewController.swift
//  CGRectUnionWithSubviews
//
//  Created by Romain Menke on 19/09/15.
//  Copyright © 2015 menke dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var masterView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        let viewOne = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        viewOne.alpha = 1.0
        viewOne.backgroundColor = UIColor.blackColor()
        
        let viewTwo = UIView(frame: CGRect(x: -10, y: -10, width: 40, height: 40))
        viewTwo.alpha = 0.5
        viewTwo.backgroundColor = UIColor.blueColor()
        
        let viewThree = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        viewThree.alpha = 0.5
        viewThree.backgroundColor = UIColor.greenColor()
        
        let viewFour = UIView(frame: CGRect(x: 100, y: 0, width: 40, height: 40))
        viewFour.alpha = 0.5
        viewFour.backgroundColor = UIColor.blueColor()
        
        let viewFive = UIView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        viewFive.alpha = 0.5
        viewFive.backgroundColor = UIColor.greenColor()
        
        masterView.addSubview(viewOne)
        
        viewOne.addSubview(viewTwo)
        viewOne.addSubview(viewThree)
        
        viewTwo.addSubview(viewFour)
        viewFour.addSubview(viewFive)
        
        let unionView = UIView(frame: viewOne.cgrectUnionWithSubviews())
        unionView.alpha = 0.2
        unionView.backgroundColor = UIColor.blackColor()
        
        masterView.addSubview(unionView)
        
        print(viewOne.frame)
        print(unionView.frame)
        viewOne.sizeToFit() // this does nothing for some reason, one would think it would try to resize viewOne to so it encloses it's subviews.
        print(viewOne.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

