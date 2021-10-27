require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  before do
    FactoryBot.create(:task)
    FactoryBot.create(:second_task)
  end
end
describe 'Task management function', type: :system do
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
      task = Task.create(name: 'task1', description: 'description1')
      visit tasks_path(task)
      expect(page).to have_content 'task'
      end
    end
  end
end
