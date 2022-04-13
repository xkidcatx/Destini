//
//  ViewController.swift
//  DestiniNoStoryboard
//
//  Created by Eugene Kotovich on 12.04.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    
    let buttons: [UIButton] = [UIButton(type: .system), UIButton(type: .system)]
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let backgroundImage: UIImageView = {
        $0.image = UIImage(named: "backgroundImage")
        $0.contentMode = .scaleAspectFill
        return $0
    } (UIImageView())
    
//MARK: - Create & setup buttons
    
    func createButtons() {
        buttons.forEach {
            $0.layer.cornerRadius = 16
            $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            $0.titleLabel?.numberOfLines = 0
            $0.titleLabel?.textAlignment = .center
            $0.addTarget(self, action: #selector(choiceMade), for: .touchUpInside)
            $0.setTitleColor(.white, for: .normal)
            $0.snp.makeConstraints { make in
                make.height.equalTo(80)
            }
        }
        buttons[0].backgroundColor = UIColor(named: "pink")
        buttons[1].backgroundColor = UIColor(named: "violet")
    }
    
    
    @objc func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
    
//MARK: - Update UI
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        updateUI()
    }
    
    func updateUI() {
        storyLabel.text = storyBrain.getText()
        buttons[0].setTitle(storyBrain.getChoice1(), for: .normal)
        buttons[1].setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
//MARK: - Intitalize UI
    
    func initialize() {
        view.addSubview(backgroundImage)
        view.addSubview(storyLabel)
        createButtons()
        backgroundImage.snp.makeConstraints { make in
            make.top.bottom.left.right.equalToSuperview()
        }
        
        let buttonsStack = UIStackView(arrangedSubviews: buttons)
        buttonsStack.axis = .vertical
        buttonsStack.alignment = .fill
        buttonsStack.spacing = 10
        buttonsStack.distribution = .fillEqually
        
        let stack = UIStackView(arrangedSubviews: [storyLabel, buttonsStack])
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = 10
        stack.distribution = .fillProportionally
        view.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.bottom.equalTo(-20)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        
    }
    
}

