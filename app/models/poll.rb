class Poll < ApplicationRecord
  # Constants
  TEXT_ATTRS = %w(name email phone open_question)
  BOOL_ATTRS = Poll.column_names - TEXT_ATTRS - FRAMEWORK_ATTRS

  # Callbacks
  before_save :strip_text_data

  # Validations
  validates :name, allow_blank: true,
                   length: {maximum: 255}

  ##TODO: Internacionalizar mensaje en validaciones
  validates :email, allow_blank: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP,
                    message: "%{value} has an invalid email format" }

  validates :phone, allow_blank: true,
                    length: {is: 7},
                    numericality: { only_integer: true }

  validates :answer1,
            :answer2,
            :answer3,
            :answer4,
            :answer5,
            :answer6,
            :answer7,
            :answer8,
            :answer9,
            :answer10,
            :answer11,
            inclusion: { in: [true, false] }

  validates :open_question, length: {maximum: 65535}

  # Scopes
  scope :count_answer, ->(answer) { where({ answer => true}).count }

  # Instance methods
  def strip_text_data
    name.strip unless name.nil?
    email.strip unless email.nil?
    phone.strip unless phone.nil?
    open_question.strip unless open_question.nil?
  end

  # Class methods
  def self.format_params(params)
    formated_params = {}

    # Handle text attributes
    TEXT_ATTRS.each do |t|
      formated_params[t] = params[t]
    end

    # Handle boolean attributes
    TEXT_ATTRS.each { |t| params.delete t }
    BOOL_ATTRS.each do |b|
      formated_params[b] = params.values.include? b
    end
    formated_params
  end

  def self.results
    results = {}
    1.upto 11 do |i|
      results["answer#{i}".to_sym] = count_answer("answer#{i}".to_sym)
    end
    results
  end

  def self.seed(quantity = 100)
    polls = []
    bool_values = [true, false]
    quantity.times do
      polls << { name: Faker::Name.name,
                 email: Faker::Internet.email,
                 phone: rand(1111111..9999999),
                 answer1: bool_values.sample,
                 answer2: bool_values.sample,
                 answer3: bool_values.sample,
                 answer4: bool_values.sample,
                 answer5: bool_values.sample,
                 answer6: bool_values.sample,
                 answer7: bool_values.sample,
                 answer8: bool_values.sample,
                 answer9: bool_values.sample,
                 answer10: bool_values.sample,
                 answer11: bool_values.sample,
                 open_question: Faker::Lorem.paragraph(sentence_count: 20) }
    end
    Poll.create polls
  end

  private :strip_text_data
end
