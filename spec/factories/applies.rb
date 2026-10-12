FactoryBot.define do
  factory :apply do
    job_id { 1 }
    geek_id { 1 }
    read { false }
    invited { false }
  end
end
