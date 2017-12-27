//
//  ViewController.swift
//  DemoRxMvvm
//
//  Created by TranNgocTam on 12/26/17.
//  Copyright © 2017 TranNgocTam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LanguageVC: UIViewController {
    @IBOutlet weak var tableLanguage: UITableView!
    
    let disposeBag = DisposeBag()
    var viewModel: LanguageListViewModel!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        viewModel = LanguageListViewModel()
        setupUI()
        setupBindings()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupUI() {
        tableLanguage.rowHeight = 40
        
    }
    
    func setupBindings() {

        viewModel.languages
        .observeOn(MainScheduler.instance)
            .bind(to: tableLanguage.rx.items(cellIdentifier: "LanguageCell")) { (_, language, cell) in
            cell.textLabel?.text = language
            cell.textLabel?.textColor = UIColor.blue
            cell.selectionStyle = .none
        }
        .disposed(by: disposeBag)
        
        tableLanguage.rx
            .modelSelected(String.self)
            .subscribe(onNext:  { value in
                
                let repo = self.storyboard?.instantiateViewController(withIdentifier: "RepoVC") as! RepoVC
                repo.language = value
                self.navigationController?.pushViewController(repo, animated: true)
                print(value)
            })
            .disposed(by: disposeBag)
        
        
        tableLanguage.rx.modelSelected(String.self)
            .bind(to: viewModel.selectLanguage)
            .disposed(by: disposeBag)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

