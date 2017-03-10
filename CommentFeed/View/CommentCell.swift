//
//  CommentCell.swift
//  CommentFeed
//
//  Created by Andrew Roberts on 12/22/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell {
    
    // MARK: - Stored Properties
    
    var comment: Comment = Comment()
    var delegate: CommentsViewController = CommentsViewController()
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var textBox: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var replyCount: UIButton!
    
    
    // MARK: - IBActions
    
    @IBAction func upvoteAction() {
        delegate.commentFeed.upvote(commentID: comment.id)
    }
    
    @IBAction func downvoteAction() {
        delegate.commentFeed.downvote(commentID: comment.id)
    }
    
    @IBAction func replyPress(_ sender: Any) {
        delegate.performSegue(withIdentifier: "replyPress", sender: comment.id)
    }
    
    // MARK: - Life Cycle
    
    func setupCell() {
        textBox.text = comment.text
        timeStamp.text = DataHelper.timeAgoSinceDate(date: comment.time, numericDates: true) 
        voteCount.text = comment.netVoteCount()
        replyCount.setTitle("\(comment.replyFeed.replies.count) replies", for: .normal)
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
