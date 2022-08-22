//
//  AccountSummaryCell.swift
//  Bankey
//
//  Created by user on 15/08/22.
//

import Foundation
import UIKit

// MARK: - AccountSummaryCell
class AccountSummaryCell: UITableViewCell {
    
    enum AccountType: String {
        case Banco
        case Credito
        case Investimento
    }
    
    struct ViewModel {
        let accountType: AccountType
        let accountName: String
        let balance: Decimal
        
        var balanceAsAttributedString: NSAttributedString {
            return CurrencyFormatter().makeAttributedCurrency(balance)
        }
    }
    
    let viewModel: ViewModel? = nil
    
    let typeLabel = UILabel()
    let underlineView = UIView()
    let nameLabel = UILabel()
    
    let balanceStackView = UIStackView()
    let balanceLabel = UILabel()
    let balanceAmountLabel = UILabel()
    
    let chevronImageView = UIImageView()
    
    static let reuseID = "AccountSummaryCell"
    static let rowHeight: CGFloat = 112
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) não foi implementado.")
    }
    
}

extension AccountSummaryCell {
    //MARK: - SETUP
    private func setup() {
        contentView.addSubview(typeLabel)
        contentView.addSubview(underlineView)
        contentView.addSubview(nameLabel)
        
        balanceStackView.addArrangedSubview(balanceLabel)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        
        contentView.addSubview(balanceStackView)
        
        contentView.addSubview(chevronImageView)
        
        // MARK: typeLabel
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.font = UIFont.preferredFont(forTextStyle: .caption1)
        typeLabel.adjustsFontForContentSizeCategory = true
        typeLabel.adjustsFontSizeToFitWidth = true
        typeLabel.text = "Tipo de conta"
        typeLabel.textColor = appColor5
        
        // MARK: underlineView
        underlineView.translatesAutoresizingMaskIntoConstraints = false
        underlineView.backgroundColor = appColor5
        underlineView.layer.cornerRadius = 4
        
        // MARK: nameLabel
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.preferredFont(forTextStyle: .body)
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.text = "Nome da conta"
        
        // MARK: balanceStackView
        balanceStackView.translatesAutoresizingMaskIntoConstraints = false
        balanceStackView.axis = .vertical
        balanceStackView.spacing = 0
        
        // MARK: balanceLabel
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        balanceLabel.font = balanceLabel.font.withSize(17)
        balanceLabel.adjustsFontSizeToFitWidth = true
        balanceLabel.textAlignment = .right
        balanceLabel.text = "Balanço"
        
        // MARK: balanceAmountLabel
        balanceAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceAmountLabel.textAlignment = .right
        balanceAmountLabel.adjustsFontSizeToFitWidth = true
        balanceAmountLabel.text = "XXX,XXX.XX"
        
        // MARK: chevronImageView
        chevronImageView.translatesAutoresizingMaskIntoConstraints = false
        let chevronImage = UIImage(systemName: "chevron.right.circle.fill")!.withTintColor(appColor2, renderingMode: .alwaysOriginal)
        chevronImageView.image = chevronImage
        
    }
    // MARK: - LAYOUT
    private func layout() {
        NSLayoutConstraint.activate([
            
            // MARK: typeLabel
            typeLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            typeLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            // MARK: underlineView
            underlineView.topAnchor.constraint(equalToSystemSpacingBelow: typeLabel.bottomAnchor, multiplier: 1),
            underlineView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            underlineView.widthAnchor.constraint(equalToConstant: 75),
            underlineView.heightAnchor.constraint(equalToConstant: 3),
            
            // MARK: nameLabel
            nameLabel.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 2),
            nameLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            
            // MARK: balanceStackView
            balanceStackView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 0),
            balanceStackView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 4),
            trailingAnchor.constraint(equalToSystemSpacingAfter: balanceStackView.trailingAnchor, multiplier: 5),
            
            // MARK: chevronImageView
            chevronImageView.topAnchor.constraint(equalToSystemSpacingBelow: underlineView.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: chevronImageView.trailingAnchor, multiplier: 1)
        ])
        
    }
    
    // MARK: Make Formatted Balance
    private func makeFormattedBalance(dollars: String, cents: String) -> NSMutableAttributedString {
        let dollarSignAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .callout), .baselineOffset: 7]
        let dollarAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .title1)]
        let centAttributes: [NSAttributedString.Key: Any] = [.font: UIFont.preferredFont(forTextStyle: .footnote), .baselineOffset: 7]
        
        let rootString = NSMutableAttributedString(string: "$", attributes: dollarSignAttributes)
        let dollarString = NSAttributedString(string: dollars, attributes: dollarAttributes)
        let centString = NSAttributedString(string: cents, attributes: centAttributes)
        
        rootString.append(dollarString)
        rootString.append(centString)
        
        return rootString
    }
}

// MARK: Configuration
extension AccountSummaryCell {
    func configure(with vm: ViewModel) {
        typeLabel.text = vm.accountType.rawValue
        nameLabel.text = vm.accountName
        balanceAmountLabel.attributedText = vm.balanceAsAttributedString
        
        
        switch vm.accountType {
        case .Banco:
            underlineView.backgroundColor = appColor3
            balanceLabel.text = "Balanço Atual"
        case .Credito:
            underlineView.backgroundColor = .systemOrange
            balanceLabel.text = "Balanço Atual"
        case .Investimento:
            underlineView.backgroundColor = appColor5
            balanceLabel.text = "Valor"
        }
    }
}
