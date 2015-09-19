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
        
        let viewOne = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        viewOne.alpha = 0.6
        viewOne.backgroundColor = UIColor.yellowColor()
        
        let viewTwo = UIView(frame: CGRect(x: -10, y: -10, width: 40, height: 40))
        viewTwo.alpha = 0.6
        viewTwo.backgroundColor = UIColor.redColor()
        
        let viewThree = UIView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
        viewThree.alpha = 0.6
        viewThree.backgroundColor = UIColor.greenColor()
        
        let viewFour = UIView(frame: CGRect(x: 100, y: 0, width: 40, height: 40))
        viewFour.alpha = 0.6
        viewFour.backgroundColor = UIColor.brownColor()
        
        let viewFive = UIView(frame: CGRect(x: 10, y: 10, width: 40, height: 40))
        viewFive.alpha = 0.6
        viewFive.backgroundColor = UIColor.purpleColor()
        
        masterView.addSubview(viewOne)
        
        viewOne.addSubview(viewTwo)
        viewOne.addSubview(viewThree)
        
        viewTwo.addSubview(viewFour)
        viewFour.addSubview(viewFive)
        
        let unionView = UIView(frame: viewOne.cgrectUnionWithSubviews())
        unionView.alpha = 0.2
        unionView.backgroundColor = UIColor.blueColor()
        
        masterView.addSubview(unionView)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

