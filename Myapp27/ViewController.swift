//
//  ViewController.swift
//  Myapp27
//
//  Created by user20 on 2017/10/3.
//  Copyright © 2017年 Yvonne Big. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var ballView: UIImageView!
    
    @IBOutlet weak var targetView: UIView!
    var anim: UIDynamicAnimator!
    
    @IBAction func doTap(_ sender: UITapGestureRecognizer) {
        //1.
        //2.
        let g = UIGravityBehavior(items: [ballView])
        
    }
    @IBAction func doPan(_ sender: UIPanGestureRecognizer) {
        let np = sender.location(in: self.view)
        labelA.center = np
        
        let behavior = anim.behaviors.first as! UIAttachmentBehavior
        behavior.anchorPoint = np
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //1.
        anim = UIDynamicAnimator(referenceView: view)
        //2. Dynamic Behavior
        let behavior = UIAttachmentBehavior(item: targetView, offsetFromCenter: UIOffsetMake(40, 40), attachedToAnchor: labelA.center)
        anim.addBehavior(behavior)
    }



}

