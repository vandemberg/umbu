class RepositoryApplication
  attr_accessor :model

  def initialize
    self.model = set_model
  end

  def list_all
    model.all
  end

  def create(attributes)
    model.create(attributes)
  end

  def set_model
    raise("should be implemented")
  end
end
