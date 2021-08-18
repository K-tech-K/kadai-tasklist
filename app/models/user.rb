class User < ApplicationRecord
    #Userインスタンスが保存される前に全ての文字列を小文字へ変換
    before_save { self.email.downcase! }
    
    #nameカラムのバリデーション
    validates :name, presence: true, length: { maximum: 50 }
    
    #emailカラムのバリデーション
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
    #パスワード付きモデル使用時のセキュリティ用コード
    has_secure_password
    
    has_many :tasks
end
