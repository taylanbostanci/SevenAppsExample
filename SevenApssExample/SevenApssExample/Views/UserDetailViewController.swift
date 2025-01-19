//
//  UserDetailViewController.swift
//  SevenApssExample
//
//  Created by TaylanBostanci on 19.01.2025.
//

import SnapKit

final class UserDetailViewController: BaseViewController {
    // MARK: - Properties
    private let userModel: UserResponseModel
     
    // MARK: - Initializers
    init(userModel: UserResponseModel) {
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Elements
    private let baseView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .fill
        stackView.backgroundColor = .cyan
        stackView.layer.cornerRadius = 12
        return stackView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()

    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()

    private let websiteLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupUI()
    }

    // MARK: - UI Setup
    private func setupConstraints() {
        // Add stackView to the view
        view.addSubview(baseView)
        baseView.addSubview(stackView)

        // Add labels to the stackView
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
        stackView.addArrangedSubview(websiteLabel)
        
        // Setup constraints
        baseView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(baseView.snp.top).offset(200)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
    }
    
   private func setupUI() {
       view.backgroundColor = .white
       self.navigationItem.title = localizer.stringForKey(key: LocalizableUtils.Strings.userDetailPage.rawValue)

       nameLabel.setBoldAndItalicText(boldText: "\(localizer.stringForKey(key: LocalizableUtils.Strings.name.rawValue)): ", italicText: userModel.name)
       emailLabel.setBoldAndItalicText(boldText: "\(localizer.stringForKey(key: LocalizableUtils.Strings.email.rawValue)): ", italicText: userModel.email)
       phoneLabel.setBoldAndItalicText(boldText: "\(localizer.stringForKey(key: LocalizableUtils.Strings.phone.rawValue)): ", italicText: userModel.phone)
       websiteLabel.setBoldAndItalicText(boldText: "\(localizer.stringForKey(key: LocalizableUtils.Strings.website.rawValue)): " , italicText: userModel.website)
    }
}
