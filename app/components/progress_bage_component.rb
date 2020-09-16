class ProgressBageComponent < ViewComponent::Base
  def initialize(status:)
    @status = status
  end
end
