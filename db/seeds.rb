# Компании
Company.delete_all
Company.reset_pk_sequence
Company.create([
                 { name: 'Yandex',       location: 'Moscow' },
                 { name: 'VK',           location: 'Saint-Petersburg' },
                 { name: 'SberTech',     location: 'Kazan' },
                 { name: 'Kaspersky',    location: 'Kaliningrad' },
                 { name: 'Tbank',      location: 'Moscow' },
                 { name: 'Ozon',         location: 'Krasnodar' },
                 { name: 'Avito',        location: 'Ufa' },
                 { name: 'Wildberries',  location: 'Yekaterinburg' }
               ])

# Вакансии
Job.delete_all
Job.reset_pk_sequence
Job.create([
             { name: 'Ruby on Rails Developer',    place: 'Remote',      company_id: 1 },
             { name: 'Sinatra Backend Developer',  place: 'Contract',      company_id: 2 },
             { name: 'Ruby React Full Stack',      place: 'Hybrid',      company_id: 3 },
             { name: 'Node.js Backend Engineer',   place: 'Office',      company_id: 4 },
             { name: 'React Frontend Developer',   place: 'Permanent', company_id: 5 },
             { name: 'Go Backend Developer',       place: 'Remote',      company_id: 6 },
             { name: 'Python Data Engineer',       place: 'Contract',      company_id: 7 },
             { name: 'Java Spring Developer',      place: 'Hybrid',      company_id: 8 },
             { name: 'DevOps Engineer',            place: 'Office',      company_id: 1 },
             { name: 'Javascript CSS HTML Layout', place: 'Contract',      company_id: 3 }
           ])

# Соискатели
Geek.delete_all
Geek.reset_pk_sequence
Geek.create([
              { name: 'Ivan Petrov',      stack: 'Ruby on Rails, PostgreSQL', resume: 'true'  },
              { name: 'Alexey Smirnov',   stack: 'Ruby, Sinatra, Redis',      resume: 'true'  },
              { name: 'Maria Ivanova',    stack: 'React, TypeScript',         resume: 'false' },
              { name: 'Dmitry Kuznetsov', stack: 'Java, Spring Boot',         resume: 'true'  },
              { name: 'Anna Sokolova',    stack: 'PHP, Laravel',              resume: 'false' },
              { name: 'Nikita Popov',     stack: 'Node.js, Express',          resume: 'true'  },
              { name: 'Olga Morozova',    stack: 'Vue.js, Nuxt',              resume: 'true'  },
              { name: 'Sergey Volkov',    stack: 'Python, Django',            resume: 'false' },
              { name: 'Elena Novikova',   stack: 'Full stack Ruby/React',     resume: 'true'  },
              { name: 'Pavel Lebedev',    stack: 'DevOps, Kubernetes, AWS',   resume: 'true'  },
              { name: 'Tatiana Zaytseva', stack: 'Go, gRPC, PostgreSQL',      resume: 'true'  },
              { name: 'Andrey Orlov',     stack: 'C++, Qt',                   resume: 'false' }
            ])

# Заявления
Apply.delete_all
Apply.reset_pk_sequence
Apply.create([
               { job_id: 1, geek_id: 1,  read: true,  invited: true  },
               { job_id: 1, geek_id: 2,  read: false, invited: false },
               { job_id: 2, geek_id: 3,  read: true,  invited: false },
               { job_id: 3, geek_id: 9,  read: true,  invited: true  },
               { job_id: 4, geek_id: 6,  read: false, invited: false },
               { job_id: 5, geek_id: 7,  read: true,  invited: false },
               { job_id: 6, geek_id: 11, read: false, invited: false },
               { job_id: 9, geek_id: 10, read: true,  invited: true  }
             ])

puts "Seeds loaded successfully!"
puts "Companies: #{Company.count}"
puts "Jobs: #{Job.count}"
puts "Geeks: #{Geek.count}"
puts "Applies: #{Apply.count}"