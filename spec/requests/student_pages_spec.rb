require 'spec_helper'

describe "StudentPages" do
  subject { page }

    describe "register page" do
      before { visit register_path }

      it { should have_content('Register') }
      it { should_not have_title(full_title('| Register')) }
    end
end
