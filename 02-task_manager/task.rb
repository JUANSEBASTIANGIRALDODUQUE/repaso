require 'pry-byebug'

class Task
  attr_reader :id
  attr_accessor :title, :derscription, :done

  def initialize(attributes={})
    @id = attributes[:id]
    @title = attributes[:title]
    @derscription = attributes[:derscription]
    @done = attributes[:done] || false
  end

  def self.find(id)
    task_find = DB.execute('SELECT * FROM tasks WHERE id = ?', id).first
    task_find.nil? ? nil : build_task(task_find)
  end

  def save
    DB.execute('INSERT INTO tasks (id, title, derscription, done) VALUES (?, ?, ?, ?)', @id, @title, @derscription, @done ? 1 : 0)
    @id = DB.last_insert_row_id
  end

  def self.build_task(task_find)
    Task.new(
      id: task_find['id'],
      title: task_find['title'],
      derscription: task_find['derscription'],
      done: task_find['done'] == 1
    )
  end
end
