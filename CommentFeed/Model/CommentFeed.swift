//
//  CommentFeed.swift
//  CommentFeed
//
//  Created by Andrew Roberts on 12/16/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import Foundation
import UIKit


// MARK: - Protocols

protocol PostType {
    var id: Int { get }
    var text: String { get set }
    var time: NSDate { get }
}


// MARK: - Concrete Types

struct Comment: PostType {
    var id: Int
    var text: String
    var upvotes: Int
    var downvotes: Int
    var time: NSDate
    
    func netVoteCount() -> Int {
        return upvotes - downvotes
    }
}

struct Reply: PostType {
    var id: Int
    var text: String
    var time: NSDate
}

class CommentFeed {
    var comments: [Int : Comment] = [:]
    
    func add(comment: Comment) {
        comments[comment.id] = comment
    }
    
    func delete(commentID: Int) {
        comments.removeValue(forKey: commentID)
    }
    
    func get(commentID: Int) -> Comment {
        return comments[commentID]!
    }
    
    func upvote(commentID: Int) {
        comments[commentID]!.upvotes += 1
    }
    
    func downvote(commentID: Int) {
        comments[commentID]!.downvotes -= 1
    }
}

class ReplyFeed {
    var replies: [Reply] = []
    
    func add(reply: Reply) {
        replies.append(reply)
    }
}


