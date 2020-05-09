class Poll < ApplicationRecord

  def self.format_params(params)
    byebug
    text_attrs = %w(name email phone open_question)
    bool_attrs = Poll.column_names - text_attrs - FRAMEWORK_ATTRS
    formated_params = {}

    # Handle text attributes
    text_attrs.each do |t|
      formated_params[t] = params[t]
    end

    # Handle boolean attributes
    text_attrs.each { |t| params.delete t }
    bool_attrs.each do |b|
      formated_params[b] = params.values.include? b
    end
    formated_params
  end
end
