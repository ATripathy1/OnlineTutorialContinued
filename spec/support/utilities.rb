def full_title(page_title)
  base_title = "Online Tutorial"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def sign_in(student, options={})
  if options[:no_capybara]
    # Sign in when not using Capybara.
    remember_token = Student.new_remember_token
    cookies[:remember_token] = remember_token
    student.update_attribute(:remember_token, Student.digest(remember_token))
  else
    visit signin_path
    fill_in "Email",    with: student.email
    fill_in "Password", with: student.password
    click_button "Sign On"
  end
end