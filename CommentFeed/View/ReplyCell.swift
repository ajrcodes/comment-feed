//
//  ReplyCell.swift
//  CommentFeed
//
//  Created by Andrew Roberts on 12/25/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class ReplyCell: UITableViewCell {
    
    // MARK: - Stored Properties
    
    var reply: Reply = Reply()
    
    
    // MARK: - IBOutlets

    @IBOutlet weak var textBox: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    
    
    // MARK: - Life Cycle
    
    func setupCell() {
        textBox.text = reply.text
        timeStamp.text = DataHelper.timeAgoSinceDate(date: reply.time, numericDates: true)
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
