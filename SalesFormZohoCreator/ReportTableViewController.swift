//
//  ReportTableViewController.swift
//  SalesFormZohoCreator
//
//  Created by Temp on 13/03/22.
//

import UIKit

class ReportTableViewController: UITableViewController {

    var salesReport: Order?
    
    let urlString = "https://creator.zoho.in/api/v2/navanee/learningapp/report/salesDetails"
    
    let cellReuseID = "CellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchData()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return salesReport?.data.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath)
        
        cell.textLabel?.text = salesReport?.data[indexPath.row].IME
        return cell
        
    }
    
    
    
    
    func fetchData(){
        
        if let url = URL(string: urlString){

            var request = URLRequest(url: url)
            request.httpMethod = "GET"
        //    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //    request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("Zoho-oauthtoken \(authToken)", forHTTPHeaderField: "Authorization")
        //    request.httpBody = json
            
            let task = URLSession.shared.dataTask(with: request) { data, reponse, error in
                
                if error != nil{
                    print("Error occured",error?.localizedDescription)
                }
                
                if let reponse = reponse{
        //            print(reponse)
                }
                if let data = data {
                    print(String(data: data, encoding: .utf8)!)
                    
                    let decoder = JSONDecoder()
                    
                    do{
                        let data = try decoder.decode(Order.self, from: data)
                        DispatchQueue.main.async {
                            self.salesReport = data
                            self.tableView.reloadData()
                        }
                        
                      
                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }
                
                }
                
            task.resume()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = DetailViewController()
        vc.salesReport = salesReport
        vc.index = indexPath
        navigationController?.pushViewController(vc, animated: true)
    }
  
}
