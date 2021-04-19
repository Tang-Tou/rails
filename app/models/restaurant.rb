class Restaurant < ApplicationRecord
  validates :title, presence: true
  validates :email, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  belongs_to :user

  scope :available, -> { where(deleted_at: nil).order(id: :desc) }
  # default_scope { where(deleted_at: nil) }, 可依照分類需求多做一個
  default_scope { available }
  # 有做查詢動作的都會被加上這個scope

  # def self.all 
    # where(deleted_at: nil) all本身就有在where, 這樣會造成無窮迴圈 
  # end

  def self.deleted
    unscope(:where).where.not(deleted_at: nil)
    # 需要先拔掉預設的scope
  end


  def fake_destroy
    update(deleted_at: Time.now) 
  end

  def destroy
    super
  end
end


