//
//  NewCommentViewController.swift
//  CommentFeed
//
//  Created by Andrew Roberts on 12/22/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class NewCommentViewController: UIViewController {
    
    // MARK: - Stored Properties
    
    var delegate = CommentsController()

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var textView: UITextView!
    
    
    // MARK: - IBActions
    
    @IBAction func addComment(_ sender: Any) {
        // create and configure new comment object
        var newComment = Comment()
        newComment.id = 10
        newComment.text = "lalala"
        newComment.time = Date()
        
        // add comment to the comment feed
        delegate.commentFeed.add(comment: newComment)
        
        // segue over
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
