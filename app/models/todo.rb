class Todo < ActiveRecord::Base
  def as_json(options)
    attribute_names.inject({}) do |h, attr|
      h[attr.to_sym] = self[attr]
      h
    end
  end
end
