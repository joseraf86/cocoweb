class Poll < ApplicationRecord

  # Validations
  ## TODO Implement Poll model validations

  # Scopes
  scope :count_answer, ->(answer) { where({ answer => true}).count }

  # Class methods
  def self.results
    results = {}
    1.upto 11 do |i|
      results["answer#{i}".to_sym] = count_answer("answer#{i}".to_sym)
    end
    results
  end

  def self.format_params(params)
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
