//
//  ChatRoomController.swift
//  Chat
//
//  Created by 籍孟飞 on 2018/7/27.
//  Copyright © 2018年 籍孟飞. All rights reserved.
//

import UIKit
import Starscream
class ChatRoomController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    @IBOutlet weak var textTF: UITextField!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var tableBottom: NSLayoutConstraint!
    
    var socket:WebSocket!
    
    var dataSources:[MessageModel] = []{
        
        didSet{
            
            tableView.reloadData()
            tableView.scrollToRow(at: IndexPath(row: dataSources.endIndex-1, section: 0), at: .bottom, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var request = URLRequest(url: URL(string: "ws://localhost:1314/chatRoom?uid=110&gid=111")!)
        request.timeoutInterval = 5
        request.setValue("chat", forHTTPHeaderField: "Sec-WebSocket-Protocol")
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        
        socket = WebSocket(request: request)
        
        socket.delegate = self
        socket.connect()
    
       
    }
    
    // 键盘将要升起
    @objc func keyboardWillShow(_ sender:NSNotification) {
        
        if  let duration =  sender.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as?Double,let keyboardY = (sender.userInfo?[UIKeyboardFrameEndUserInfoKey]as?CGRect)?.origin.y{
            
            bottom.constant = iphoneX ? -(view.frame.height - keyboardY - 40) : -(view.frame.height - keyboardY + 7)
            tableBottom.constant = -bottom.constant + bottomView.frame.height
            
            animation(withDuration: duration)
        
        }
    
    }
    
    
   // 键盘将要消失
   @objc func keyboardWillHide(_ sender:NSNotification)   {
    
        if let duration =  sender.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as?Double{
            
            bottom.constant = 0
            tableBottom.constant = iphoneX ? 60 : 0
            animation(withDuration: duration)
        }
    
    
    }
    
    
    func animation(withDuration duration:Double) {
        
        UIView.animate(withDuration: duration) {
            
            self.bottomView.layoutIfNeeded()
            self.tableView.layoutIfNeeded()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self)
    }


}
//MKRK: -UITextFieldDelegate
extension ChatRoomController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let message = textField.text else {return false}
        
        socket.write(string: message)
        let model = MessageModel(msg: message, way: .send, success: socket.isConnected)
        dataSources.append(model)
        textField.text = nil
        
        return true
    }
    
}

//MKRK: -UITableViewDataSource
extension ChatRoomController : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSources.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let model = dataSources[indexPath.row]
        var cell:UITableViewCell!
        if model.way == .send {
            
            cell = tableView.dequeueReusableCell(withIdentifier: "SendCell", for: indexPath)
        
        }else{
            
            cell = tableView.dequeueReusableCell(withIdentifier: "ReadCell", for: indexPath)
        }
        
        (cell as! MessageType).messageLab.text = dataSources[indexPath.row].msg
        (cell as! MessageType).errorImageView.isHidden = dataSources[indexPath.row].success
        return cell
    }
    
}
//MARK: -UITableViewDelegate
extension ChatRoomController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}
//MARK: -WebSocketDelegate
extension ChatRoomController : WebSocketDelegate {
    
    func websocketDidConnect(socket: WebSocketClient) {
        
        print("已经连接了")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        
        print("结束连接了")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        
        print("已经接受到消息了==\(text)")
        let model = MessageModel(msg: text, way: .recive)
        dataSources.append(model)
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
        print("已经接收到数据了==\(data)")
    }

}
