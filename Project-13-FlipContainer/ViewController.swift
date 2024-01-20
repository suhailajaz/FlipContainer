//
//  ViewController.swift
//  Project-13-FlipContainer
//
//  Created by suhail on 18/01/24.
//

import UIKit
import WebKit
import SDWebImage

class ViewController: UIViewController {
    var countries = [CountryViewModel]()
    var trackView = true
    @IBOutlet var col: UICollectionView!{
        didSet{
            col.register(CVCell.nib, forCellWithReuseIdentifier: CVCell.identifier)
        }
    }
    
    @IBOutlet var tbl: UITableView!{
            didSet{
                tbl.register(TVCell.nib, forCellReuseIdentifier: TVCell.identifier)
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchDataFromServer()
        col.delegate = self
        col.dataSource = self
        tbl.delegate = self
        tbl.dataSource = self
       // self.tbl.isHidden = true
    }

    @IBAction func btnToggleTapped(_ sender: UIControl) {
        trackView.toggle()
        if trackView{
            DispatchQueue.main.async{
                self.tbl.isHidden = true
                self.col.isHidden = false
            }
        }else{
            DispatchQueue.main.async{
                self.tbl.isHidden = false
                self.col.isHidden = true
            }
        }
        
        
            
        
    }
    
}
// MARK: - Collection View Methods
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = col.dequeueReusableCell(withReuseIdentifier: CVCell.identifier, for: indexPath) as! CVCell
        let flagURL = countries[indexPath.row].flagURL == "https://rest-countries-gamma.vercel.app/emojis/png/.png" ? "https://i.pinimg.com/236x/d8/ca/7a/d8ca7ae0675272688f1c09bd8c0b544e.jpg": countries[indexPath.row].flagURL
        cell.imgCVCell.sd_setImage(with: URL(string:flagURL))
        cell.lblCvCell.text = countries[indexPath.row].shortNAme
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (col.bounds.width/2)-15, height: (col.bounds.width/2)-15)
    }
    
    
    
}
// MARK: - Table View Methods
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries .count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbl.dequeueReusableCell(withIdentifier: TVCell.identifier, for: indexPath) as! TVCell
        cell.lblTblCell.text = countries[indexPath.row].shortNAme
        let flagURL = countries[indexPath.row].flagURL == "https://rest-countries-gamma.vercel.app/emojis/png/.png" ? "https://i.pinimg.com/236x/d8/ca/7a/d8ca7ae0675272688f1c09bd8c0b544e.jpg": countries[indexPath.row].flagURL
        cell.imgTblCell.sd_setImage(with: URL(string:flagURL))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
// MARK: - Custom functions
extension ViewController{
    func fetchDataFromServer(){
        DispatchQueue.global(qos: .userInitiated).async{
            NetworkManager.shared.fetchDataFromServer { [weak self] fetchedCountries in
                print("COuntries sent to main")
                print(fetchedCountries)
                
                self?.countries = fetchedCountries.map { CountryViewModel(shortNAme: $0.name.shortname, fullName: $0.name.fullname ?? "No Full Name", flagURL: $0.flag.officialflag.png)
                }
                DispatchQueue.main.async{
                    self?.tbl.reloadData()
                    self?.col.reloadData()
                }
                
            }
        }
    }
}

