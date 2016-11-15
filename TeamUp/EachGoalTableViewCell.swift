//
//  EachGoalTableViewCell.swift
//  TeamUp
//
//  Created by 洪德晟 on 2016/11/10.
//  Copyright © 2016年 洪德晟. All rights reserved.
//

import UIKit

class EachGoalTableViewCell: UITableViewCell, ReactionFeedbackDelegate {
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var goalProgress: UIProgressView!
    @IBOutlet weak var userBestContiDays: UILabel!
    @IBOutlet weak var userCurrentDays: UILabel!
    @IBOutlet weak var currentDays: UILabel!
    @IBOutlet weak var bestContiDays: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var masterImage: UIImageView!
    
    // Facebook like
    // button
    @IBOutlet weak var facebookReactionButton: ReactionButton! {
        didSet {
            facebookReactionButton.reactionSelector = ReactionSelector()
            facebookReactionButton.config           = ReactionButtonConfig() {
                $0.iconMarging      = 8
                $0.spacing          = 4
                $0.font             = UIFont(name: "HelveticaNeue", size: 14)
                $0.neutralTintColor = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
                $0.alignment        = .left
            }
            
            facebookReactionButton.reactionSelector?.feedbackDelegate = self
        }
    }
    
    // summary
    @IBOutlet weak var reactionSummary: ReactionSummary! {
        didSet {
            reactionSummary.reactions = [Reaction.facebook.like, Reaction.facebook.love]
            reactionSummary.text = ""
//            reactionSummary.setDefaultText(withTotalNumberOfPeople: 3, includingYou: true)
            reactionSummary.config    = ReactionSummaryConfig {
                $0.spacing      = 2
                $0.iconMarging  = 2
                $0.font         = UIFont(name: "HelveticaNeue", size: 7)
                $0.textColor    = UIColor(red: 0.47, green: 0.47, blue: 0.47, alpha: 1)
                $0.alignment    = .left
                $0.isAggregated = true
            }
        }
    }
    
    // button
    @IBAction func facebookButtonReactionTouchedUpAction(_ sender: AnyObject) {
        if facebookReactionButton.isSelected == false {
            facebookReactionButton.reaction = Reaction.facebook.like
        }
    }
    
    // summary
    @IBAction func summaryTouchedAction(_ sender: AnyObject) {
        facebookReactionButton.presentReactionSelector()
    }
    
    // protocol
    func reactionFeedbackDidChanged(_ feedback: ReactionFeedback?) {
        //        feedbackLabel.isHidden = feedback == nil
        //
        //        feedbackLabel.text = feedback?.localizedString
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


