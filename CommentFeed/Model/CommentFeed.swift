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
    var time: Date { get }
}


// MARK: - Concrete Types

struct Comment: PostType {
    var id: Int = 0
    var text: String = ""
    var upvotes: Int = 0
    var downvotes: Int = 0
    var time: Date = Date()
    var replyFeed: ReplyFeed = ReplyFeed()
    
    func netVoteCount() -> String {
        return String(upvotes - downvotes)
    }
}

struct Reply: PostType {
    var id: Int = 0
    var text: String = ""
    var time: Date = Date()
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
        comments[commentID]!.downvotes += 1
    }
    
    func getSortedComments() -> [Comment] {
        return Array(comments.values).sorted { $0.time > $1.time }
    }
}

class ReplyFeed {
    var replies: [Reply] = []
    
    func add(reply: Reply) {
        replies.append(reply)
    }
}


