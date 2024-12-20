class Admin < ApplicationRecord
    has_secure_password

    before_save :downcase_email
    before_save :downcase_username, if: :new_record?

    before_destroy :prevent_base_admin_destruction
    before_update :prevent_base_admin_changes

    validates :email, format: {with: Devise.email_regexp, message: "Please use a valid email"}
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: { case_sensitive: false }  
    validates :password, presence: true,
    format: {
      with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>]).{8,}\z/,
      message: "must be at least 8 characters long, contain at least one lowercase letter, one uppercase letter, one number, and one special character"
      }, if: :password_required?

    has_many :events, class_name: 'Event', foreign_key: :admin_id
    has_many :questions, class_name: 'Question'
    has_many :reviews, class_name: 'Review', foreign_key: :adminID_id

    private

    def prevent_base_admin_destruction
        if username == "admin"
          errors.add(:base, "This admin cannot be deleted.")
          throw(:abort)
        end
    end

    def prevent_base_admin_changes
        if username == "admin"
            if email_changed? || firstName_changed?
                errors.add(:base, "Just password can be changed on this admin.")
                throw(:abort)
            end
        end
    end

    def password_required?
        new_record? || password.present?
    end

end
