//
//  CustomerListingTableViewCell.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import UIKit
import AlamofireImage

class CustomerListingTableViewCell: UITableViewCell {
    
    // MARK: - IB UI
    
    // ImageView
    @IBOutlet weak var customerImageView: UIImageView!
    
    // Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    // MARK: - Static Properties
    
    static let identifier = "CustomerListingTableViewCell"
    static let nib = UINib(nibName: "CustomerListingTableViewCell", bundle: nil)
    
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
    
    /// Configure the cell
    /// - Parameter model: String
    func configure(with model: CustomerDetails) {
        let imageURL = model.profileImage ?? ""
        if let url = URL(string: imageURL) {
            customerImageView.af_setImage(withURL: url)
        }
        
        nameLabel.text = model.name ?? ""
        if let company  = model.company {
            companyLabel.text = company.name ?? ""
        }
    }
    
}
