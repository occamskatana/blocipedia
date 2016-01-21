class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable

         after_initialize {self.role ||= :guest}

         enum role: [:guest, :member, :admin]
         has_many :collaborators
         has_many :wikis, through: :collaborators
end
