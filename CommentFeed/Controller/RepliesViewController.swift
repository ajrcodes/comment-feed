//
//  RepliesViewController.swift
//  CommentFeed
//
//  Created by Andrew Roberts on 12/24/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class RepliesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Stored Properties
    
    var comment: Comment = Comment()
    var delegate: CommentsViewController = CommentsViewController()
    
    
    // MARK: - IBOutlets
    
    // comment being displayed
    @IBOutlet weak var textBox: UILabel!
    @IBOutlet weak var timeStamp: UILabel!
    @IBOutlet weak var voteCount: UILabel!
    @IBOutlet weak var textField: UITextField!
    // table of replies
    @IBOutlet weak var tableview: UITableView!
    
    
    // MARK: - IBActions
    
    @IBAction func upvoteAction() {
        delegate.commentFeed.upvote(commentID: comment.id)
    }
    
    @IBAction func downvoteAction() {
        delegate.commentFeed.downvote(commentID: comment.id)
    }
    
    @IBAction func addReply() {
        // don't allow a blank reply
        if let text = textField.text {
            // configure new reply object
            var newReply: Reply = Reply()
            newReply.id = Int(arc4random())
            newReply.text = text
            newReply.time = Date()
            // add reply to replyFeed
            comment.replyFeed.add(reply: newReply)
            tableview.reloadData()
        }
    }
    
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comment.replyFeed.replies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "replyCell", for: indexPath) as! ReplyCell
        self.tableview.rowHeight = 60
        
        // setup the cell to be used in the table view
        cell.reply = comment.replyFeed.replies[indexPath.row]
        cell.setupCell()
        
        return cell
    }
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupComment()
        setupTable()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
    }
    
    func setupComment() {
        textBox.text = comment.text
        timeStamp.text = DataHelper.timeAgoSinceDate(date: comment.time, numericDates: true)
        voteCount.text = comment.netVoteCount()
    }
    
    func setupTable() {
        tableview.delegate = self
        tableview.dataSource = self
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
