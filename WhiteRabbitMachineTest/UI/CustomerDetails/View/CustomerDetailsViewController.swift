//
//  CustomerDetailsViewController.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import UIKit

class CustomerDetailsViewController: UIViewController {
    
    // MARK: - IB UI
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    let viewModel = CustomerDetailsViewModel()
    
    // MARK: - Private methods
    
    /// To registe table view  cells
    fileprivate func registerTableViewCell() {
        // Customer details table view cell
        tableView.register(CustomerDetailsTableViewCell.nib, forCellReuseIdentifier: CustomerDetailsTableViewCell.identifier)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Additional setup after loading the view.
        
        registerTableViewCell()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource

extension CustomerDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.customerModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CustomerDetailsTableViewCell.identifier,
                for: indexPath
            ) as? CustomerDetailsTableViewCell else { return UITableViewCell() }
        
        let details = Array(viewModel.customerModel)[indexPath.row]
        cell.optionLabel.text = details.key
        cell.valueLabel.text = (details.value as! String)
            
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CustomerDetailsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = CustomerHeader.loadNib()
        
        header.CustomerName.text = viewModel.customerDetailsModel.name ?? ""
        let imageURL = viewModel.customerDetailsModel.profileImage ?? ""
        
        if let url = URL(string: imageURL) {
            header.CustomerImageView.af_setImage(withURL: url)
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30/100 * UIScreen.main.bounds.height
    }
}
