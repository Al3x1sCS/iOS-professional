//
//  AccountSummaryViewController.swift
//  Bankey
//
//  Created by user on 12/08/22.
//

import UIKit

// MARK: - AccountSummaryViewController
class AccountSummaryViewController: UIViewController {
    
    var accounts: [AccountSummaryCell.ViewModel] = []
    var tableView = UITableView()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Bankey"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        setup()
    }
}

// MARK: Extension
extension AccountSummaryViewController {
    
    
    // MARK: - Setup
    private func setup() {
        setupTableView()
        setupTableHeaderView()
        fetchData()
    }
    
    private func setupTableView() {
        
        // MARK: tableView
        tableView.backgroundColor = appColor
        tableView.delegate = self
        tableView.dataSource = self
        
        // MARK: tableView
        tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
        tableView.rowHeight = AccountSummaryCell.rowHeight
        tableView.tableFooterView = UIView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
    // MARK: - Layout
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: setupTableHeaderView
    private func setupTableHeaderView() {
        let header = AccountSummaryHeaderView(frame: .zero)
        
        var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        size.width = UIScreen.main.bounds.width
        header.frame.size = size
        
        tableView.tableHeaderView = header
    }
}

extension AccountSummaryViewController: UITableViewDataSource {
    
    // MARK: Cell For RowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard !accounts.isEmpty else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        
        return cell
    }
    
    // MARK: Number Of Rows In Section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}

extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AccountSummaryViewController {
    
    // MARK: - FetchData
    private func fetchData() {
        
        
        let savings = AccountSummaryCell.ViewModel(accountType: .Banco, accountName: "Economias Básicas", balance: 929466.23)
        
        let chequing = AccountSummaryCell.ViewModel(accountType: .Banco, accountName: "Cheque sem Taxa", balance: 17562.44)
        
        let visa = AccountSummaryCell.ViewModel(accountType: .Credito, accountName: "Cartão Visa", balance: 412.83)
        
        let masterCard = AccountSummaryCell.ViewModel(accountType: .Credito, accountName: "Mastercard Estudante", balance: 50.83)
        
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investimento, accountName: "Economias Tax-Free", balance: 2000.00)
        
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investimento, accountName: "Fundo de Investimento", balance: 15000.00)
        
        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
    }
}
