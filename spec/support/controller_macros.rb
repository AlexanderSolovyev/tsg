module ControllerMacros
  def login_user
    let(:user) {create(:user)}
    before { sign_in user}
  end
end

