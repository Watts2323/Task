//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Xavier on 10/10/18.
//  Copyright © 2018 Xavier ios dev. All rights reserved.
//

import UIKit

protocol taskTableViewCellDelegate: class {
    func isCompleteButtonTapped(cell: taskTableViewCellDelegate)
}

class TaskTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    //Landing Pad
    var task: Task?{
        didSet{
            updateView()
        }
    }
    
    //Weak var delegate goes below
    weak var delegate: taskTableViewCellDelegate?
    
    func updateView(){
        isCompleteButton.adjustsImageWhenDisabled = (task?.isComplete)!
        nameLabel.text = task?.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        delegate?.isCompleteButtonTapped(cell: self as! taskTableViewCellDelegate)
    }
}
