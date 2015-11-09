//
//  ViewController.swift
//  Example
//
//  Created by Daiwei Lu on 5/25/15.
//
//

import UIKit
import TapLabel

class ViewController: UIViewController, TapLabelDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let l = TapLabel(frame: CGRect(x: 20, y: 40, width: 280, height: 100))

        l.delegate = self

        let str = "The length of a #KILabel is unrestricted, unlike the length of a " +
            "tweet. Tweets are limited to 140 characters, here's long link to " +
            "explain why this is the case http://www.adweek.com/socialtimes/the-reason-for-the-160-character-text-message-and-140-character-twitter-length-limits/4914."

        let text = NSMutableAttributedString(string: str, attributes: [
            NSFontAttributeName: UIFont.systemFontOfSize(16),
            NSParagraphStyleAttributeName: {
                let p = NSMutableParagraphStyle()
                p.lineSpacing = 5
                p.alignment = NSTextAlignment.Center
                return p
            }()
        ])

        text.addAttribute(TapLabel.LinkContentName, value: "test", range: NSMakeRange(30, 20))
        text.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSMakeRange(30, 20))
        text.addAttribute(TapLabel.SelectedForegroudColorName, value: UIColor.redColor(), range: NSMakeRange(30, 20))

        l.attributedText = text
        l.lineBreakMode = .ByWordWrapping
        l.numberOfLines = 0

        l.sizeToFit()
        print(l.fitHeight)
        print(l.frame.height)

        l.layer.borderColor = UIColor.blackColor().CGColor
        l.layer.borderWidth = 1

        view.addSubview(l)
    }

    func tapLabel(tapLabel: TapLabel, didSelectLink link: String) {
        print(link)
    }
}
