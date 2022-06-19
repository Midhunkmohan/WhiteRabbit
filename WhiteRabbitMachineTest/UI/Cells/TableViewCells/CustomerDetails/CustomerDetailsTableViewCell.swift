//
//  CustomerDetailsTableViewCell.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import UIKit

class CustomerDetailsTableViewCell: UITableViewCell {
    
    // MARK: - IB UI
    
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    // MARK: - Prorperties
    
    static let identifier = "CustomerDetailsTableViewCell"
    static let nib = UINib(nibName: "CustomerDetailsTableViewCell", bundle: nil)
    
    // MARK: - Lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Helper
    
    func configure(with model: [String: String]) {
        optionLabel.text = model.first?.key
        valueLabel.text = model.first?.value
    }
    
}
