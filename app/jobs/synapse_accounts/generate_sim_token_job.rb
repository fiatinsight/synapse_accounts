class SynapseAccounts::GenerateSimTokenJob < SynapseAccounts::ApplicationJob
  queue_as :default

  def perform(user)
    o = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    token = (0...50).map { o[rand(o.length)] }.join
    user.update(sim_token: token)
  end
end
