//
//  UserListView.swift
//  TestTask_DownloadPictures
//
//  Created by Кирилл Нескоромный on 02.12.2021.
//

import UIKit

// MARK: - Protocol requirements
protocol UserListViewProtocol: AnyObject {
    func updateView()
    func showAlert()
}

class UserListView: UIViewController {
    
    // MARK: - UI Elements
    var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .lightGray
        tv.register(UserCell.self, forCellReuseIdentifier: "UserCell")
        return tv
    }()
    
    // MARK: - Dependencies
    var presenter: UserListPresenterProtocol!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self

        addTableView()
        setupNavigationBar()
        
        presenter.fetchData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter.launchTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        presenter.deleteFromStorage()
    }
    
    // MARK: - UI Customization
    private func addTableView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    private func setupNavigationBar() {
        
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}

// MARK: - Table View Data Source
extension UserListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        
        presenter.usersCount
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell",
                                                 for: indexPath) as! UserCell
        
        let user = presenter.getUser(at: indexPath)
        cell.updateView(with: user?.name ?? "")
        
        return cell
    }
}

// MARK: - Table View Delegate
extension UserListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let user = presenter.getUser(at: indexPath) {
            presenter.didTap(user: user)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension UserListView: UserListViewProtocol {
    func updateView() {
        tableView.reloadData()
    }
    func showAlert() {
        Alert.show(in: self,
                   with: "Похоже, что нет интернет соединения. Я загрузил последние доступные данные!")
    }
}

