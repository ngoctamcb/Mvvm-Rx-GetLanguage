//
//  RepoVC.swift
//  DemoRxMvvm
//
//  Created by TranNgocTam on 12/26/17.
//  Copyright © 2017 TranNgocTam. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Foundation

class RepoVC: UIViewController {
    private let disposeBag = DisposeBag()

    @IBOutlet weak var tableRepo: UITableView!
    
    var language: String = ""
    var repoViewModel: RepositoryListViewModel!
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.sendActions(for: .valueChanged)
        repoViewModel = RepositoryListViewModel(initialLanguage: language)
        setupUI()
        setupBindings()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        self.navigationItem.title = language
        self.tableRepo.rowHeight = 120
    }
    
    func setupBindings() {
        repoViewModel.repositories
            .observeOn(MainScheduler.instance)
            .do(onNext: { [weak self] _ in self?.refreshControl.endRefreshing() })
            .bind(to: tableRepo.rx.items(cellIdentifier: "RepositoryCell", cellType: RepoCell.self)) { [weak self] (_, repo, cell) in
                self?.setupRepositoryCell(cell, repository: repo)
            }
            .disposed(by: disposeBag)
    }
    
    private func setupRepositoryCell(_ cell: RepoCell, repository: RepositoryViewModel) {
        cell.selectionStyle = .none
        cell.setName(repository.name)
        cell.setDescription(repository.description)
        cell.setStarsCountTest(repository.starsCountText)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
