class User < ApplicationRecord
    has_secure_password
    validates_presence_of:email
    validates_uniqueness_of:email
    enum role: [:superadmin, :admin, :participant]
    after_initialize :set_default_role, if: :new_record?

    private
  
    def set_default_role
      self.role ||= :participant # Attribuez le rôle de participant par défaut
    end
end
