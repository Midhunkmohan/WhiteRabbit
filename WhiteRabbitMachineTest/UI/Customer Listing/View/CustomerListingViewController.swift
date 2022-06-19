//
//  CustomerListingViewController.swift
//  WhiteRabbitMachineTest
//
//  Created by Midhun KM on 19/06/22.
//

import UIKit

class CustomerListingViewController: UIViewController {
    
    // MARK: - IB UI
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    
    let viewModel = CustomerListViewModel()
    
    // MARK: - Private methods
    
    /// To register table view cells
    fileprivate func registerTableViewCell() {
        
        // Customer listing table view cell
        tableView.register(CustomerListingTableViewCell.nib, forCellReuseIdentifier: CustomerListingTableViewCell.identifier)
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Additional setup after loading the view.
        registerTableViewCell()
        
        getCustomerDetails()
        
        searchBar.delegate = self
    }
    
    // MARK: - Webservice
    
    func getCustomerDetails() {
        viewModel.getCustomerList { [weak self] success in
            if success {
                self?.tableView.reloadData()
            }
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == Identifier.Segue.customerDetails {
            if let destinationViewController = segue.destination as? CustomerDetailsViewController {
                let index = sender as? Int ?? 0
                destinationViewController.viewModel.customerDetailsModel = viewModel.arrayOfFilteredCustomer[index]
            }
        }
    }
    

}

// MARK: - UITableViewDataSource

extension CustomerListingViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayOfFilteredCustomer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: CustomerListingTableViewCell.identifier,
                for: indexPath
            ) as? CustomerListingTableViewCell else { return UITableViewCell() }
        
        let customer = viewModel.arrayOfFilteredCustomer[indexPath.row]
        cell.configure(with: customer)
        
        
        return cell
    }
}

extension CustomerListingViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: Identifier.Segue.customerDetails, sender: indexPath.row)
    }
}

extension CustomerListingViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var arrayOfCustomer = [CustomerDetails]()
        if !searchText.isEmpty {
            viewModel.arrayOfFilteredCustomer.forEach { customer in
                if (customer.name?.prefix(searchText.count))! == searchText || (customer.email?.prefix(searchText.count))! == searchText {
                    arrayOfCustomer.append(customer)
                }
                viewModel.arrayOfFilteredCustomer = arrayOfCustomer
                self.tableView.reloadData()
            }
        } else {
            viewModel.arrayOfFilteredCustomer = viewModel.arrayOfCustomer
            self.tableView.reloadData()
        }
    }
}
