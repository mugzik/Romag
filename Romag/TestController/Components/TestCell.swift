//
//  TestCell.swift
//  Romag
//
//  Created by Maksim on 12.08.2024.
//

import UIKit

protocol TestCellDelegate: AnyObject {
    func tapped(index i: Int)
}

class TestCell: UICollectionViewCell {
    private var model: ArticlesDecodableType?
    private var index: Int = Int()
    var delegate: TestCellDelegate?
    
    let title: UILabel = .init()
    let time: UILabel = .init()
    let author: UILabel = .init()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ item: ArticlesDecodableType, index i: Int) {
        model = item
        index = i
        
        setTitle(item.title)
        setTime(item.publishedAt)
        setAuthor(item.author)
    }
}

private extension TestCell {
    @objc func onTapped()
    {
        delegate?.tapped(index: index)
    }
    
    func setup() {
        title.numberOfLines = 0
        addSubview(title)
        
        let mFont = UIFont(name:"ArialRoundedMTBold", size: 10.0)
        author.numberOfLines = 1
        author.textColor = .gray
        author.font = mFont
        author.textAlignment = .left
        addSubview(author)
        
        time.numberOfLines = 1
        time.textColor = .gray
        time.font = mFont
        time.textAlignment = .right
        addSubview(time)

        backgroundColor = .lightGray
        layer.cornerRadius = 10
        
        //border
        layer.borderWidth = 1
        layer.borderColor = UIColor.darkGray.cgColor
        
        //shadows
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 3.0
        
        let tapRecognizer = UITapGestureRecognizer(target:self, action:#selector(onTapped))
        tapRecognizer.numberOfTapsRequired = 1
        
        addGestureRecognizer(tapRecognizer)
    }
    
    func layout() {
        author.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(12)
        }
        
        time.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-20)
            $0.leading.equalTo(author.snp.trailing)
            $0.bottom.equalTo(author.snp.bottom)
        }
        
        title.snp.makeConstraints {
            $0.top.equalTo(author.snp.bottomMargin).offset(10)
            $0.centerX.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.lessThanOrEqualToSuperview().offset(-15)
        }
    }
    
    func setTitle(_ title: String?) {
        self.title.text = title
    }
    
    func setTime(_ time: String?) {
        guard let time = time else {
            return
        }
        
        let df = DateFormatter()
        
        df.locale = Locale(identifier: "en_US_POSIX")
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

        let prefTime = df.date(from: time)
        
        df.dateStyle = .medium
        df.timeStyle = .short

        if let prefTime = prefTime {
            self.time.text = df.string(from: prefTime)
        }
        else {
            self.time.text = "Unknown data"
        }
    }
    
    func setAuthor(_ author: String?) {
        self.author.text = author ?? "Unknown"
    }
}
