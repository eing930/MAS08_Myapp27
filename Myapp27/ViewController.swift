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
    
    @IBOutlet weak var ball2View: UIImageView!
    
    @IBOutlet weak var greenView: UIImageView!
    @IBOutlet weak var ball3View: UIImageView!
    @IBOutlet weak var targetView: UIView!
    var anim: UIDynamicAnimator!
    
    @IBAction func doSnap(_ sender: UITapGestureRecognizer) {  //撲向的行為
        let snap = UISnapBehavior(item: ball3View, snapTo: greenView.center)
        snap.damping = 1  // damping 是阻尼 預設值是0-100
        //2. - 1引力
        let g = UIGravityBehavior(items: [ball3View])
        g.gravityDirection = CGVector(dx: 0.0,dy: 3.0)
        //anim.removeAllBehaviors()
        anim.addBehavior(snap) // anim是行為
        anim.addBehavior(g)
        
    }
    @IBAction func pushBall(_ sender: UITapGestureRecognizer) {
        //2. - 1引力
        let g = UIGravityBehavior(items: [ball2View])
        g.gravityDirection = CGVector(dx: 1.0,dy: 1.0)
        // 2 - 2 碰撞
        let c = UICollisionBehavior(items: [ball2View])
        c.translatesReferenceBoundsIntoBoundary = true
        
        let push = UIPushBehavior(items: [ball2View], mode: .continuous)
        
        push.magnitude = 1.0   // point 速度 ball2
        push.angle = 55.0 / 180.0 * CGFloat(Double.pi) //弧度
        push.pushDirection = CGVector(dx: 0.4,dy: 0.7)
        
        anim.addBehavior(push)
        anim.addBehavior(c)
        anim.addBehavior(g)
        
    }
    @IBAction func doTap(_ sender: UITapGestureRecognizer) {
        //1.
        //2. - 1引力
        let g = UIGravityBehavior(items: [ballView])
        g.gravityDirection = CGVector(dx: 1.0,dy: 1.0)
        // 2 - 2 碰撞
        let c = UICollisionBehavior(items: [ballView])
        c.translatesReferenceBoundsIntoBoundary = true
        
        
        anim.addBehavior(c)
        anim.addBehavior(g)
        
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

