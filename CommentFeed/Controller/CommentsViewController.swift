//
//  CommentsController.swift
//  CommentFeed
//
//  Created by Andrew Roberts on 12/22/16.
//  Copyright © 2016 ajrcodes. All rights reserved.
//

import UIKit

class CommentsViewController: UITableViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableview: UITableView!
    
    
    // MARK: - Stored Properties
    
    var commentFeed = CommentFeed()
    var sortedComments: [Comment] = []
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        commentFeed.add(comment: Comment())
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
        tableview.reloadData()
    }
    
    func setupView() {
        sortedComments = commentFeed.getSortedComments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentFeed.comments.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommentCell", for: indexPath) as! CommentCell
        self.tableview.rowHeight = 135
        
        // setup the cell to be used in the table view
        cell.comment = sortedComments[indexPath.row]
        cell.delegate = self
        cell.setupCell()
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            
            if (identifier == "addComment") {
                let newCommentVC = segue.destination as! NewCommentViewController
                newCommentVC.delegate = self
            }
            
            if (identifier == "replyPress") {
                let replyFeedVC = segue.destination as! RepliesViewController
                replyFeedVC.delegate = self
                replyFeedVC.comment = commentFeed.get(commentID: sender as! Int)
            }
            
        }
    }

    
}
